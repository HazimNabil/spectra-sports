from flask import Flask, request, jsonify
import numpy as np
import cv2
import os
from mtcnn.mtcnn import MTCNN
from keras_facenet import FaceNet
from sklearn.preprocessing import LabelEncoder
from sklearn.svm import SVC
from joblib import load
from ultralytics import YOLO

app = Flask(__name__)

# ─── Load Face Recognition Models ─────────────────────────────────────
face_data = np.load('ai/face recognition result.npz', allow_pickle=True)
X = face_data['arr_0']
y = face_data['arr_1']
face_encoder = LabelEncoder().fit(y)
y_enc = face_encoder.transform(y)
face_model = SVC(kernel='linear', probability=True).fit(X, y_enc)

face_detector = MTCNN()
face_embedder = FaceNet()

def get_emb(face_img):
    face_img = face_img.astype('float32')
    face_img = np.expand_dims(face_img, 0)
    return face_embedder.embeddings(face_img)[0]

# ─── Load Soccer Player Model ─────────────────────────────────────────
player_model = load("ai/xgb_first_position_model.joblib")
player_labelencoder = load("ai/label_encoder.joblib")
FEATURE_ORDER = [
    'pace',
    'shooting',
    'passing',
    'attacking_crossing',
    'dribbling',
    'defending',
    'physic',
    'height_cm'
]

# ─── Load YOLO Model ─────────────────────────────────────────────────
yolo_model = YOLO('ai/best.pt')
GOAL_ROI = (899, 198, 1765, 601)

# Hardcoded video path
base_dir = os.path.dirname(os.path.abspath(__file__))
video_fp = os.path.join(base_dir, 'edited_match.mp4')

# ─── Route for Face Recognition Prediction ───────────────────────────
@app.route('/predict-faces', methods=['POST'])
def predict_faces():
    if 'image' not in request.files:
        return jsonify({'error': 'No image file provided', 'status': 'error'}), 400

    file = request.files['image']
    if file.filename == '':
        return jsonify({'error': 'Empty filename', 'status': 'error'}), 400

    img_arr = np.frombuffer(file.read(), np.uint8)
    img = cv2.imdecode(img_arr, cv2.IMREAD_COLOR)
    img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)

    faces = face_detector.detect_faces(img)
    if not faces:
        return jsonify({'error': 'No faces detected', 'status': 'error'}), 400

    preds = []
    for face in faces:
        x, y, w, h = face['box']
        x, y = abs(x), abs(y)
        crop = img[y:y+h, x:x+w]
        if crop.size == 0: continue

        crop = cv2.resize(crop, (160, 160))
        emb = get_emb(crop).reshape(1, -1)
        yhat = face_model.predict(emb)[0]
        proba = face_model.predict_proba(emb)[0]
        conf = float(np.max(proba))
        name = face_encoder.inverse_transform([yhat])[0]
        if conf < 0.05: name = 'Unknown'
        preds.append({'name': name, 'confidence': conf, 'box': {'x': x, 'y': y, 'w': w, 'h': h}})

    return jsonify({'predictions': preds, 'status': 'success'})

# ─── Route for Soccer Player Prediction ───────────────────────────────
@app.route("/predict", methods=["POST"])
def predict_player():
    try:
        data = request.json
        print("Received data:", data)
        
        # Convert JSON to properly ordered array
        input_array = np.array([[
            data['pace'],
            data['shooting'],
            data['passing'],
            data['attacking_crossing'],
            data['dribbling'],
            data['defending'],
            data['physic'],
            data['height_cm']
        ]], dtype=np.float32)  # 2D array shape (1, 8)
        
        # Make prediction
        prediction = player_model.predict(input_array)
        predicted_label = player_labelencoder.inverse_transform(prediction)[0]
        
        return jsonify({
            "prediction_numeric": int(prediction[0]),
            "prediction_label": str(predicted_label),
            "status": "success"
        })
        
    except Exception as e:
        return jsonify({
            "error": str(e),
            "status": "error"
        }), 400

# ─── Route for Shot/Goal Detection ────────────────────────────────────
@app.route('/detect', methods=['POST'])
def detect_shots_goals():
    if not os.path.exists(video_fp):
        return jsonify({'error': 'Video file not found'}), 404

    # Static intervals
    intervals = [
        (2*60+25, 2*60+27),
        (2*60+30, 2*60+32),
        (2*60+36, 2*60+38),
        (2*60+40, 2*60+42),
        (2*60+43, 2*60+45),
        (2*60+47, 2*60+49),
        (2*60+51, 2*60+54),
        (2*60+58, 3*60+0),
        (3*60+1,  3*60+4),
        (3*60+6,  3*60+9),
    ]

    cap = cv2.VideoCapture(video_fp)
    results = []

    for idx, (start, end) in enumerate(intervals, 1):
        found_goal = False
        t = start
        while t <= end:
            cap.set(cv2.CAP_PROP_POS_MSEC, t*1000)
            ret, frame = cap.read()
            if not ret:
                break

            res = yolo_model(frame, device='cpu', imgsz=640, conf=0.1)[0]

            for box, cls in zip(res.boxes.xyxy.cpu().numpy(),
                              res.boxes.cls.cpu().numpy().astype(int)):
                if cls != 0:
                    continue
                x1,y1,x2,y2 = box
                cx, cy = (x1+x2)/2, (y1+y2)/2
                if GOAL_ROI[0] < cx < GOAL_ROI[2] and GOAL_ROI[1] < cy < GOAL_ROI[3]:
                    found_goal = True
                    break
            if found_goal:
                break
            t += 0.5

        event_type = "GOAL" if found_goal else "SHOT"
        results.append({'interval': (start, end), 'result': event_type})

    cap.release()

    return jsonify({'results': results})

# ─── Main Entry Point ─────────────────────────────────────────────────
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)