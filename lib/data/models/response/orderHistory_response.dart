class OrderHistoryResponse {
  int? id;
  int? userId;
  int? designId;
  String? price;
  String? color;
  String? size;
  String? createdAt;
  String? updatedAt;
  Design? design;

  OrderHistoryResponse(
      {this.id,
      this.userId,
      this.designId,
      this.price,
      this.color,
      this.size,
      this.createdAt,
      this.updatedAt,
      this.design});

  OrderHistoryResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    designId = json['design_id'];
    price = json['price'];
    color = json['color'];
    size = json['size'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    design =
        json['design'] != null ? new Design.fromJson(json['design']) : null;
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
    if (this.design != null) {
      data['design'] = this.design!.toJson();
    }
    return data;
  }
}

class Design {
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

  Design(
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

  Design.fromJson(Map<String, dynamic> json) {
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
