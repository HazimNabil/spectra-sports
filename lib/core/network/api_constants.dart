class ApiEndpoints {
  ApiEndpoints._();

  static const baseUrl = 'https://gp-t1br.onrender.com/api';
  static const aiBaseUrl = 'http://192.168.1.104:5000';
  static const login = '/auth/login';
  static const register = '/auth/register/admin';
  static const registerParent = '/auth/register/parent';
  static const getTeams = '/admin/teams';
  static const coachGetMatches = '/coach/matches';
  static const adminGetMatches = '/admin/teams';
  static const addMatch = '/admin/matches';
  static const getCoachTeam = '/coach/my-team';
  static const updateMatch = '/match';
  static const addPlayer = '/admin/teams';
  static const predict = '/predict';
  static const predictFaces = '/predict-faces';
}

class ApiKeys {
  ApiKeys._();

  static const authorization = 'Authorization';
  static const bearer = 'Bearer';
  static const message = 'message';
  static const token = 'token';
  static const teams = 'teams';
  static const team = 'team';
  static const matches = 'matches';
  static const position = 'prediction_label';
  static const image = 'image';
  static const predictions = 'predictions';
  static const players = 'players';
}

class ApiErrors {
  ApiErrors._();

  static const notFound = 'Your request not found, Please try later.';
  static const serverError = 'Internal Server error, Please try later.';
  static const defaultError = 'Oops There was an Error, Please try again.';
  static const connectionTimeout =
      'Connection timed out. Please check your internet connection and try again.';
  static const receiveTimeout =
      'Server is taking too long to respond. Please try again later.';
  static const badCertificate =
      'Secure connection verification failed. Please contact support.';
  static const cancelled = 'Request was cancelled. Please try again.';
  static const connectionError =
      'Unable to connect to the server. Please check your internet connection.';
  static const unknown = 'Something went wrong. Please try again later.';
  static const sendTimeout =
      'Failed to send request. Please check your connection.';
}
