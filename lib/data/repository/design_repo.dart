import 'dart:convert';

import 'package:design_app/data/constant/constant.dart';
import 'package:design_app/data/http_client/api_error_response.dart';
import 'package:design_app/data/http_client/api_response.dart';
import 'package:design_app/data/http_client/http_client.dart';
import 'package:design_app/data/models/body/order_body.dart';
import 'package:design_app/data/models/body/reviewDesign_body.dart';
import 'package:design_app/data/models/body/search_body.dart';
import 'package:design_app/init_controller/init_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as multiPartHttp;

class DesignRepo {
  MyHttpClient http = MyHttpClient();
  InitController initController = Get.put(InitController());

  getCategories() async {
    return await http.getRequest(CATEGORIES, {}, {
      "Authorization": "Bearer ${initController.token}",
      "Accept": "application/json"
    });
  }

  getColors() async {
    return await http.getRequest(COLORS, {}, {
      "Authorization": "Bearer ${initController.token}",
      "Accept": "application/json"
    });
  }

  getSizes() async {
    return await http.getRequest(SIZES, {}, {
      "Authorization": "Bearer ${initController.token}",
      "Accept": "application/json"
    });
  }

  addDesign(Map<String, dynamic> body, Map<String, dynamic> sizes,
      Map<String, dynamic> colors, String image) async {
    final request =
        multiPartHttp.MultipartRequest('POST', Uri.parse(CREATE_DESIGN));
    request.fields.addAll({...body, ...sizes, ...colors});
    request.files
        .add(await multiPartHttp.MultipartFile.fromPath('image', image));
    request.headers.addAll({
      "Authorization": "Bearer ${initController.token}",
      "Accept": "application/json"
    });

    final apiCall = await request.send();
    final response = await multiPartHttp.Response.fromStream(apiCall);
    var js = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return ApiResponse.fromJson(js);
    } else {
      return ApiErrorResponse.fromJson(js);
    }
  }

  getDesign(int id) async {
    return await http.getRequest("$GET_DESIGN/$id", {}, {
      "Authorization": "Bearer ${initController.token}",
      "Accept": "application/json"
    });
  }

  makeOrder(OrderBody body) async {
    return await http.postRequest(ORDER, body.toJson(), {
      "Authorization": "Bearer ${initController.token}",
      "Accept": "application/json"
    });
  }

  search(SearchBody body) async {
    return await http.postRequest(SEARCH, body.toJson(), {
      "Authorization": "Bearer ${initController.token}",
      "Accept": "application/json"
    });
  }

  getSortedDesigns() async {
    return await http.getRequest(SORTED_DESIGNS, {}, {
      "Authorization": "Bearer ${initController.token}",
      "Accept": "application/json"
    });
  }

  reviewDesign(ReviewDesignBody body) async {
    return await http.postRequest(REVIEW, body.toJson(), {
      "Authorization": "Bearer ${initController.token}",
      "Accept": "application/json"
    });
  }

  deleteDesign(int id) async {
    return await http.deleteRequest('$DELETE_DESIGN/$id', {}, {
      "Authorization": "Bearer ${initController.token}",
      "Accept": "application/json"
    });
  }

  getDesigner(String id) async {
    return await http.getRequest('$GET_DESIGNER/$id', {}, {
      "Authorization": "Bearer ${initController.token}",
      "Accept": "application/json"
    });
  }

  getOrders() async {
    return await http.getRequest(USER_INFO, {}, {
      "Authorization": "Bearer ${initController.token}",
      "Accept": "application/json"
    });
  }

  changeOrderStatus(String orderId, String status) async {
    return await http.postRequest(CHANGE_ORDER_STATUS, {
      "order_id": orderId,
      "status": status
    }, {
      "Authorization": "Bearer ${initController.token}",
      "Accept": "application/json"
    });
  }

  editDesign(Map<String, dynamic> body, Map<String, dynamic> sizes,
      Map<String, dynamic> colors, String? image, int id) async {
    final request =
        multiPartHttp.MultipartRequest('POST', Uri.parse('$UPDATE_DESIGN/$id'));
    request.fields.addAll({...body, ...sizes, ...colors});
    if (image != null) {
      request.files
          .add(await multiPartHttp.MultipartFile.fromPath('image', image));
    }
    request.headers.addAll({
      "Authorization": "Bearer ${initController.token}",
      "Accept": "application/json"
    });

    final apiCall = await request.send();
    final response = await multiPartHttp.Response.fromStream(apiCall);
    var js = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return ApiResponse.fromJson(js);
    } else {
      return ApiErrorResponse.fromJson(js);
    }
  }
}
