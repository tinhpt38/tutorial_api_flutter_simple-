import 'package:flutter/material.dart';
import 'package:tutorial_api/api.dart';
import 'package:tutorial_api/item.dart';
import 'package:tutorial_api/model/category_product.dart';
import 'package:tutorial_api/model/color.dart';
import 'package:tutorial_api/model/size.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Category> _categories = List();
  List<SizeProduct> _sizes = List();
  List<ColorProduct> _colors = List();
  bool _isLoading = false;

  SizeProduct getSizeFromId(int id) {
    return _sizes.where((e) => e.id == id) as SizeProduct;
  }

  ColorProduct getColorFromId(int id) {
    return _colors.where((e) => e.id == id) as ColorProduct;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() => _isLoading = true);
      Api().getProductCategory(onSuccess: (cates, sizes, colors) {
        setState(() {
          _categories = cates;
          _sizes = sizes;
          _colors = colors;
          _isLoading = false;
        });
      }, onError: (msg) {
        print("msg: $msg");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Code P Soft'),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : _categories.isEmpty
              ? Center(
                  child: Text("Nothing to show!"),
                )
              : Container(
                  child: ListView.builder(
                  itemCount: _categories.length,
                  itemBuilder: (context, index) {
                    return ProductItem(
                      product: _categories[index],
                      // color: getColorFromId(_categories[index].id),
                      // size: getSizeFromId(_categories[index].id)
                    );
                  },
                )),
    );
  }
}
