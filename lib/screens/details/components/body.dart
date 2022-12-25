import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tokoto_commerce_app/components/default_button.dart';
import 'package:flutter_tokoto_commerce_app/constant.dart';
import 'package:flutter_tokoto_commerce_app/models/product.dart';
import 'package:flutter_tokoto_commerce_app/screens/cart/cart.dart';
import 'package:flutter_tokoto_commerce_app/screens/details/components/product_description.dart';
import 'package:flutter_tokoto_commerce_app/screens/details/components/product_images.dart';
import 'package:flutter_tokoto_commerce_app/screens/details/components/rounded_icon_btn.dart';
import 'package:flutter_tokoto_commerce_app/screens/details/components/top_rounded_container.dart';
import 'package:flutter_tokoto_commerce_app/size_config.dart';

import 'color_dots.dart';

class Body extends StatelessWidget {
  const Body({Key key, @required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImages(product: product),
          TopRoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                ProductDescription(
                  product: product,
                  pressOnSeeMore: () {},
                ),
                TopRoundedContainer(
                  color: Color(0xFFF6F7F9),
                  child: Column(
                    children: [
                      ColorDots(product: product),
                      TopRoundedContainer(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: SizeConfig.screenWidth * 0.15,
                            right: SizeConfig.screenWidth * 0.15,
                            top: getProportionateScreenWidth(15),
                            bottom: getProportionateScreenWidth(40),
                          ),
                          child: DefaultButton(
                            text: "Add to Chart",
                            press: () => Navigator.pushNamed(context, CartScreen.routeName),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
