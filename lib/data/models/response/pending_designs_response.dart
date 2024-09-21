class PendingDesignsResponse {
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
  Designer? designer;
  Category? category;
  List<Colors>? colors;
  List<Sizes>? sizes;

  PendingDesignsResponse(
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
      this.designer,
      this.category,
      this.colors,
      this.sizes});

  PendingDesignsResponse.fromJson(Map<String, dynamic> json) {
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
    designer = json['designer'] != null
        ? new Designer.fromJson(json['designer'])
        : null;
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    if (json['colors'] != null) {
      colors = <Colors>[];
      json['colors'].forEach((v) {
        colors!.add(new Colors.fromJson(v));
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
    if (this.designer != null) {
      data['designer'] = this.designer!.toJson();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.colors != null) {
      data['colors'] = this.colors!.map((v) => v.toJson()).toList();
    }
    if (this.sizes != null) {
      data['sizes'] = this.sizes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Designer {
  int? id;
  String? name;
  String? mobile;
  String? email;
  int? isDesigner;
  String? address;
  String? createdAt;
  String? updatedAt;

  Designer(
      {this.id,
      this.name,
      this.mobile,
      this.email,
      this.isDesigner,
      this.address,
      this.createdAt,
      this.updatedAt});

  Designer.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
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

class Category {
  int? id;
  String? name;

  Category({this.id, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Colors {
  int? id;
  String? hex;
  ColorPivot? pivot;

  Colors({this.id, this.hex, this.pivot});

  Colors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hex = json['hex'];
    pivot = json['pivot'] != null ? new ColorPivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['design_id'] = this.designId;
    data['color_id'] = this.colorId;
    return data;
  }
}

class Sizes {
  int? id;
  String? size;
  SizePivot? pivot;

  Sizes({this.id, this.size,  this.pivot});

  Sizes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    size = json['size'];
    pivot = json['pivot'] != null ? new SizePivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['size'] = this.size;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class SizePivot {
  int? designId;
  int? sizeId;

  SizePivot({this.designId, this.sizeId});

  SizePivot.fromJson(Map<String, dynamic> json) {
    designId = json['design_id'];
    sizeId = json['size_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['design_id'] = this.designId;
    data['size_id'] = this.sizeId;
    return data;
  }
}
