class SignupBody {
  String? name;
  String? email;
  String? password;
  String? mobile;
  String? address;
  String? isDesigner;

  SignupBody(
      {this.name,
      this.email,
      this.password,
      this.mobile,
      this.address,
      this.isDesigner});

  SignupBody.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    mobile = json['mobile'];
    address = json['address'];
    isDesigner = json['is_designer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['mobile'] = mobile;
    data['address'] = address;
    data['is_designer'] = isDesigner;
    return data;
  }
}
