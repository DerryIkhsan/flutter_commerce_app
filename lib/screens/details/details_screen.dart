import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tokoto_commerce_app/models/product.dart';
import 'components/body.dart';
import 'package:flutter_tokoto_commerce_app/size_config.dart';

import 'components/custom_appbar.dart';
import 'components/rounded_icon_btn.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments arguments = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      // By default our background color is white
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(rating: arguments.product.rating,),
      body: Body(
        product: arguments.product,
      ),
    );
  }
}



class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({@required this.product});
}
