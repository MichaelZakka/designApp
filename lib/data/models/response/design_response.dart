class DesignResponse {
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
  List<DesignColors>? colors;
  List<Sizes>? sizes;

  DesignResponse(
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
      this.userRate,
      this.colors,
      this.sizes});

  DesignResponse.fromJson(Map<String, dynamic> json) {
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
    if (json['colors'] != null) {
      colors = <DesignColors>[];
      json['colors'].forEach((v) {
        colors!.add(new DesignColors.fromJson(v));
      });
    }
    if (json['sizes'] != null) {
      sizes = <Sizes>[];
      json['sizes'].forEach((v) {
        sizes!.add(new Sizes.fromJson(v));
      });
    }
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
    if (this.colors != null) {
      data['colors'] = this.colors!.map((v) => v.toJson()).toList();
    }
    if (this.sizes != null) {
      data['sizes'] = this.sizes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DesignColors {
  int? id;
  String? hex;
  ColorPivot? pivot;

  DesignColors({this.id, this.hex, this.pivot});

  DesignColors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hex = json['hex'];
    pivot = json['pivot'] != null ? new ColorPivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['hex'] = this.hex;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class ColorPivot {
  int? designId;
  int? colorId;

  ColorPivot({this.designId, this.colorId});

  ColorPivot.fromJson(Map<String, dynamic> json) {
    designId = json['design_id'];
    colorId = json['color_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['design_id'] = this.designId;
    data['color_id'] = this.colorId;
    return data;
  }
}

class Sizes {
  int? id;
  String? size;
  SizesPivot? pivot;

  Sizes({this.id, this.size,  this.pivot});

  Sizes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    size = json['size'];
    pivot = json['pivot'] != null ? new SizesPivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['size'] = this.size;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class SizesPivot {
  int? designId;
  int? sizeId;

  SizesPivot({this.designId, this.sizeId});

  SizesPivot.fromJson(Map<String, dynamic> json) {
    designId = json['design_id'];
    sizeId = json['size_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['design_id'] = this.designId;
    data['size_id'] = this.sizeId;
    return data;
  }
}
