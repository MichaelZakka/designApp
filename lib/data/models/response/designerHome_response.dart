class DesignerHomeResponse {
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

  DesignerHomeResponse(
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

  DesignerHomeResponse.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
