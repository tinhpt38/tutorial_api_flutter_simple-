import 'package:tutorial_api/model/category_product.dart';
import 'package:tutorial_api/model/color.dart';
import 'package:tutorial_api/model/size.dart';

class CategoryProductRepo{

  final List<Category> categories = List();
  final List<SizeProduct> sizies = List();
  final List<ColorProduct> colors = List();
  
    CategoryProductRepo.fromJson(Map<String, dynamic> json){
  
      List<dynamic> cateData = json['category_product'];
      cateData.map((e) => categories.add(Category.fromJson(e)));
      List<dynamic> sizeData = json['sizes'];
      cateData.map((e) => sizeData.add(SizeProduct.formJson(e)));
      List<dynamic> colorData = json['colors'];
      cateData.map((e) => colorData.add(ColorProduct.fromJson(e)));
    }
  }
  