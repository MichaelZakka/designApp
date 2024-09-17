class AddDesignBody {
  String? name;
  String? description;
  String? prepareDuration;
  String? price;
  String? sizes;
  String? colors;
  String? categoryId;

  AddDesignBody(
      {this.name,
      this.description,
      this.prepareDuration,
      this.price,
      this.sizes,
      this.colors,
      this.categoryId});

  AddDesignBody.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    prepareDuration = json['prepare_duration'];
    price = json['price'];
    sizes = json['sizes[]'];
    colors = json['colors[]'];
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = this.name;
    data['description'] = this.description;
    data['prepare_duration'] = this.prepareDuration;
    data['price'] = this.price;
    data['sizes[]'] = this.sizes;
    data['colors[]'] = this.colors;
    data['category_id'] = this.categoryId;
    return data;
  }
}
