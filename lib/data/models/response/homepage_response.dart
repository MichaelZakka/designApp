import 'package:design_app/data/models/response/product_response.dart';

class HomepageResponse {
  int? id;
  String? name;
  List<ProductResponse>? designs;

  HomepageResponse({this.id, this.name, this.designs});

  HomepageResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['designs'] != null) {
      designs = <ProductResponse>[];
      json['designs'].forEach((v) {
        designs!.add(new ProductResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.designs != null) {
      data['designs'] = this.designs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
