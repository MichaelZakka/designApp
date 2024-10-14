class OrderResponse {
  int? id;
  int? userId;
  int? designId;
  String? price;
  String? color;
  String? size;
  String? designImage;
  String? designName;
  String? createdAt;
  String? updatedAt;
  String? status;
  User? user;

  OrderResponse(
      {this.id,
      this.userId,
      this.designId,
      this.price,
      this.color,
      this.size,
      this.designImage,
      this.designName,
      this.createdAt,
      this.updatedAt,
      this.status,
      this.user});

  OrderResponse.fromJson(Map<String, dynamic> json, String image, String name) {
    id = json['id'];
    userId = json['user_id'];
    designId = json['design_id'];
    price = json['price'];
    color = json['color'];
    size = json['size'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    designImage = image;
    designName = name;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['design_id'] = this.designId;
    data['price'] = this.price;
    data['color'] = this.color;
    data['size'] = this.size;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['status'] = this.status;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? mobile;
  String? email;
  int? isDesigner;
  String? address;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.name,
      this.mobile,
      this.email,
      this.isDesigner,
      this.address,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    isDesigner = json['is_designer'];
    address = json['address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['is_designer'] = this.isDesigner;
    data['address'] = this.address;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
