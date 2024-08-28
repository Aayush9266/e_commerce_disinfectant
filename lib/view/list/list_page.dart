import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:e_commerce_disinfectant/controller/home_controller.dart';
import 'package:e_commerce_disinfectant/data/common/category_bean.dart';
import 'package:e_commerce_disinfectant/utils/common/widget_helper.dart';
import 'package:e_commerce_disinfectant/utils/constant/color_const.dart';
import 'package:e_commerce_disinfectant/utils/constant/dummy_data.dart';
import 'package:e_commerce_disinfectant/utils/constant/routers_const.dart';
import 'package:e_commerce_disinfectant/utils/constant/string_const.dart';
import 'package:e_commerce_disinfectant/view/details/detail_page.dart';

class ListPage extends GetView<HomeController> {
  String title = 'Nature';

  ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var argu = Get.arguments;
    return Scaffold(backgroundColor: ColorConst.whiteColor, body: createUi());
  }

  Widget createUi() {
    return Column(
      children: [getAppBarWithBackBtn(title: title), getCateg()],
    );
  }

  Widget getCateg() {
    return Expanded(
      child: getStaggered(
          height: 280,
          crossAxisCount: 2,
          itemCount: productBean().length,
          widget: (context, index) {
            var item = productBean()[index];
            return _categoryList(item);
          }),
    );
  }

  Widget _categoryList(CategoryBean item) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 3,
      child: InkWell(
        onTap: () {
          Get.toNamed(RoutersConst.productDetails);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            getCacheImage(
                url: item.url.toString(), height: 220),
            const SizedBox(height: 5),
            Container(
                margin: const EdgeInsets.only(left: 5),
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    getTxtBlackColor(
                        msg: item.name.toString(), fontWeight: FontWeight.bold),
                    getTxtBlackColor(
                        msg: "${StringConst.RUPEE_SYMBOL} 250",
                        fontWeight: FontWeight.bold),
                  ],
                )),
            Container(
              alignment: Alignment.topLeft,
              child: RatingBar.builder(
                itemSize: 12.0,
                initialRating: 8 / 2,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: getBackgrountRate(2),
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ),
            Container(
                margin: const EdgeInsets.only(left: 5),
                alignment: Alignment.topLeft,
                child: getTxtGreyColor(
                    msg: StringConst.dummyTxtVSmall, fontSize: 14, maxLines: 1))
          ],
        ),
      ),
    );
  }
}
