import 'dart:convert';

import 'package:learn_bloc/model/color_product.dart';
import 'package:learn_bloc/model/user.dart';
import 'package:learn_bloc/model/response/base_response.dart';
import 'package:http/http.dart' as http;

class ColorProductRepository {
  Future<List<ColorProduct>> getColorProduct() async {
    try {
      final response = await http.get(Uri.parse("https://reqres.in/api/unknown?per_page=12"));
      BaseResponse<ColorProduct> colorProductResponse = BaseResponse.fromJson(jsonDecode(response.body), (data) => ColorProduct.fromJson(data));
      if (response.statusCode == 200) {
        return colorProductResponse.data ?? List.empty();
      } else {
        throw "Error loading product";
      }
    } catch (e) {
      rethrow;
    }
  }

}