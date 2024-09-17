class SizeResponse {
  int? id;
  String? size;

  SizeResponse({this.id, this.size});

  SizeResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['size'] = this.size;
    return data;
  }
}
