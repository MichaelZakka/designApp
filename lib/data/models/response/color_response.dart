class ColorResponse {
  int? id;
  String? hex;

  ColorResponse({this.id, this.hex});

  ColorResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hex = json['hex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['hex'] = this.hex;
    return data;
  }
}
