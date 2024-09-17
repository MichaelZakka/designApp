class ChangePasswordBody {
  String? currentPassword;
  String? newPassword;

  ChangePasswordBody({this.currentPassword, this.newPassword});

  ChangePasswordBody.fromJson(Map<String, dynamic> json) {
    currentPassword = json['current_password'];
    newPassword = json['new_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_password'] = this.currentPassword;
    data['new_password'] = this.newPassword;
    return data;
  }
}
