class UpdateUseraccountBody {
  String? name;
  String? mobile;
  String? address;
  String? email;

  UpdateUseraccountBody({this.name, this.mobile, this.address, this.email});

  UpdateUseraccountBody.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mobile = json['mobile'];
    address = json['address'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['address'] = this.address;
    data['email'] = this.email;
    return data;
  }
}
