import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tutorial_api/model/category_product.dart';
import 'package:tutorial_api/model/color.dart';
import 'package:tutorial_api/model/size.dart';

class Api {
  Future<void> getProductCategory({
    Function(List<Category>, List<SizeProduct>, List<ColorProduct>) onSuccess,
    Function(String) onError,
  }) async {
    String endpoint =
        'http://www.json-generator.com/api/json/get/bVFfLBxzaW?indent=2';
    var res = await http.get(endpoint);
    if (res.statusCode == 200) {
      try {
        var jsonData = json.decode(res.body);
        var jsonFromData = jsonData['data'];
        if (jsonData['status'] == 1) {
          List<Category> categories = List();
          List<dynamic> cateData = jsonFromData['category_product'];
          cateData.forEach((e) => categories.add(Category.fromJson(e)));
          List<SizeProduct> sizes = List();
          List<dynamic> sizeData = jsonFromData['sizes'];
          sizeData.forEach((e) => sizes.add(SizeProduct.formJson(e)));
          List<ColorProduct> colors = List();
          List<dynamic> colorData = jsonFromData['colors'];
          colorData.forEach((e) => colors.add(ColorProduct.fromJson(e)));
          onSuccess(categories, sizes, colors);
        } else {
          onError('Error ' + jsonFromData['status']);
        }
      } catch (e) {
        onError('Something get wrong!');
      }
    } else {
      onError('Error Code ${res.statusCode}');
    }
  }
}
