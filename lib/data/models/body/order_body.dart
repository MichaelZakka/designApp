class OrderBody {
  String? designId;
  String? colorId;
  String? sizeId;

  OrderBody({this.designId, this.colorId, this.sizeId});

  OrderBody.fromJson(Map<String, dynamic> json) {
    designId = json['design_id'];
    colorId = json['color_id'];
    sizeId = json['size_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['design_id'] = this.designId;
    data['color_id'] = this.colorId;
    data['size_id'] = this.sizeId;
    return data;
  }
}
