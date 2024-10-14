class DesignerResponse {
  int? id;
  String? name;
  String? mobile;
  String? email;
  String? emailVerifiedAt;
  int? isDesigner;
  String? address;
  String? createdAt;
  String? updatedAt;
  List<Designs>? designs;

  DesignerResponse(
      {this.id,
      this.name,
      this.mobile,
      this.email,
      this.emailVerifiedAt,
      this.isDesigner,
      this.address,
      this.createdAt,
      this.updatedAt,
      this.designs});

  DesignerResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    isDesigner = json['is_designer'];
    address = json['address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['designs'] != null) {
      designs = <Designs>[];
      json['designs'].forEach((v) {
        designs!.add(new Designs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['is_designer'] = this.isDesigner;
    data['address'] = this.address;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.designs != null) {
      data['designs'] = this.designs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Designs {
  int? id;
  int? designerId;
  int? categoryId;
  String? name;
  String? description;
  String? prepareDuration;
  String? image;
  String? price;
  String? status;
  String? createdAt;
  String? updatedAt;
  bool? isReviewed;
  int? averageRate;
  int? userRate;

  Designs(
      {this.id,
      this.designerId,
      this.categoryId,
      this.name,
      this.description,
      this.prepareDuration,
      this.image,
      this.price,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.isReviewed,
      this.averageRate,
      this.userRate});

  Designs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    designerId = json['designer_id'];
    categoryId = json['category_id'];
    name = json['name'];
    description = json['description'];
    prepareDuration = json['prepare_duration'];
    image = json['image'];
    price = json['price'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isReviewed = json['is_reviewed'];
    averageRate = json['average_rate'].toInt();
    userRate = json['user_rate'].toInt();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['designer_id'] = this.designerId;
    data['category_id'] = this.categoryId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['prepare_duration'] = this.prepareDuration;
    data['image'] = this.image;
    data['price'] = this.price;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['is_reviewed'] = this.isReviewed;
    data['average_rate'] = this.averageRate;
    data['user_rate'] = this.userRate;
    return data;
  }
}
