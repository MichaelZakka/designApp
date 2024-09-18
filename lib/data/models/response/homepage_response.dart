// import 'package:design_app/data/models/response/product_response.dart';

// class HomepageResponse {
//   String? status;
//   String? message;
//   List<Data>? data;

//   HomepageResponse({this.status, this.message, this.data});

//   HomepageResponse.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['status'] = this.status;
//     data['message'] = this.message;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Data {
//   int? id;
//   String? name;
//   List<ProductResponse>? designs;

//   Data({this.id, this.name, this.designs});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     if (json['designs'] != null) {
//       designs = <ProductResponse>[];
//       json['designs'].forEach((v) {
//         designs!.add(new ProductResponse.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = this.id;
//     data['name'] = this.name;
//     if (this.designs != null) {
//       data['designs'] = this.designs!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

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
