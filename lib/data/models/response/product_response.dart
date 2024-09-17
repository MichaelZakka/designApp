class ProductResponse {
  String? name;
  String? description;
  String? categoryId;
  String? prepareDuration;
  String? image;
  String? price;
  int? designerId;
  String? updatedAt;
  String? createdAt;
  int? id;
  bool? isReviewed;
  int? averageRate;
  int? userRate;

  ProductResponse(
      {this.name,
      this.description,
      this.categoryId,
      this.prepareDuration,
      this.image,
      this.price,
      this.designerId,
      this.updatedAt,
      this.createdAt,
      this.id,
      this.isReviewed,
      this.averageRate,
      this.userRate});

  ProductResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    categoryId = json['category_id'];
    prepareDuration = json['prepare_duration'];
    image = json['image'];
    price = json['price'];
    designerId = json['designer_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    isReviewed = json['is_reviewed'];
    averageRate = json['average_rate'];
    userRate = json['user_rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = this.name;
    data['description'] = this.description;
    data['category_id'] = this.categoryId;
    data['prepare_duration'] = this.prepareDuration;
    data['image'] = this.image;
    data['price'] = this.price;
    data['designer_id'] = this.designerId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['is_reviewed'] = this.isReviewed;
    data['average_rate'] = this.averageRate;
    data['user_rate'] = this.userRate;
    return data;
  }
}
