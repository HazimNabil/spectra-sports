class ChangePasswordBody {
  String? oldPassword;
  String? newPassword;
  String? confirmPassword;

  ChangePasswordBody({
    this.oldPassword,
    this.newPassword,
    this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'oldPassword': oldPassword,
      'newPassword': newPassword,
      'confirmPassword': confirmPassword,
    };
  }
}
