
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tutorial_api/model/category_product.dart';
import 'package:tutorial_api/model/color.dart';
import 'package:tutorial_api/model/size.dart';

class ProductItem extends StatefulWidget {
  final Category product;
  final SizeProduct size;
  final ColorProduct color;

  ProductItem({this.product, this.size, this.color});

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * (1/4),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black45, offset: Offset(3, 6), blurRadius: 5)
          ]),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: CachedNetworkImage(
                imageUrl: widget.product.image,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, _, __) =>
                    Center(child: Icon(Icons.error)),
                imageBuilder: (context, image) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: image,
                      fit: BoxFit.fitWidth,
                      // colorFilter: ColorFilter.mode(
                      //     Colors.red, BlendMode.colorBurn)
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: 24, vertical: 12),
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(5, 6),
                        blurRadius: 5)
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(45))),
              child: Text(
                "K",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
