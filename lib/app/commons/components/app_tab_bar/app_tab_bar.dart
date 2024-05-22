import 'package:bokk_yonn/app/commons/components/app_text/app_text.dart';
import 'package:bokk_yonn/app/commons/constantes/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTabBar extends StatelessWidget {
  final Widget? firstContent;
  final Widget? secondContent;
  AppTabBar({
    super.key,
    required this.firstContent,
    required this.secondContent
});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Column(
          children: [
            TabBar(
              indicatorColor: mainColor,
              labelColor: mainColor,
              dividerColor: Colors.transparent,
              unselectedLabelColor: Colors.grey ,
              padding: EdgeInsets.symmetric(horizontal: Get.width / 5.5),
              tabs: <Widget>[
                Tab(
                  child: AppText(
                    labelle:"Dakar",
                    size: 17,
                  ),
                ),
                Tab(
                  child: AppText(
                    labelle:"Interurbains",
                    size: 17,
                  ),
                )
              ],
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  Center(
                    child: firstContent,
                  ),
                  Center(
                    child: secondContent,
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}
