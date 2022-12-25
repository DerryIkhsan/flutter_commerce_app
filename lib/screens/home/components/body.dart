import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tokoto_commerce_app/constant.dart';
import 'package:flutter_tokoto_commerce_app/models/product.dart';
import 'package:flutter_tokoto_commerce_app/screens/home/components/popular_products.dart';
import 'package:flutter_tokoto_commerce_app/screens/home/components/search_field.dart';
import 'package:flutter_tokoto_commerce_app/screens/home/components/section_title.dart';
import 'package:flutter_tokoto_commerce_app/screens/home/components/special_offers.dart';

import '../../../size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'icon_btn_with_counter.dart';
import 'product_card.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenWidth(20),
            ),
            HomeHeader(),
            SizedBox(
              height: getProportionateScreenWidth(30),
            ),
            DiscountBanner(),
            SizedBox(
              height: getProportionateScreenWidth(30),
            ),
            Categories(),
            SizedBox(
              height: getProportionateScreenWidth(30),
            ),
            SpecialOffers(),
            SizedBox(
              height: getProportionateScreenWidth(30),
            ),
            PopularProducts(),
            SizedBox(
              height: getProportionateScreenWidth(30),
            ),
          ],
        ),
      ),
    );
  }
}


