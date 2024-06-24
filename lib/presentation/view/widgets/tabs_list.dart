import 'package:caed_technical_challenge/core/preferences/app_constants.dart';
import 'package:caed_technical_challenge/core/preferences/app_ui_texts.dart';
import 'package:caed_technical_challenge/domain/models/box.dart';
import 'package:caed_technical_challenge/domain/models/package.dart';
import 'package:caed_technical_challenge/presentation/view/widgets/box_data.dart';
import 'package:caed_technical_challenge/presentation/view/widgets/box_status.dart';
import 'package:caed_technical_challenge/presentation/view/widgets/packages_list.dart';
import 'package:flutter/material.dart';

class TabsList extends StatelessWidget {
  const TabsList({
    Key? key,
    required this.tabController,
    required this.box,
  }) : super(key: key);

  final TabController? tabController;
  final BoxModel box;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height - 500,
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              TabBar(
                controller: tabController,
                indicatorColor: Colors.black,
                tabs: [
                  Tab(
                    icon: Text(
                      UITexts.tabLabelPackages,
                      style: const TextStyle(
                          fontSize: 14, color: labelGraySecondaryColor),
                    ),
                  ),
                  Tab(
                      icon: Text(
                    UITexts.tabLabelStatus,
                    style: const TextStyle(
                        fontSize: 14, color: labelGraySecondaryColor),
                  )),
                  Tab(
                      icon: Text(
                    UITexts.tabLabelDados,
                    style: const TextStyle(
                        fontSize: 14, color: labelGraySecondaryColor),
                  )),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: TabBarView(controller: tabController, children: [
                  PackagesList(packages: box.packages),
                  BoxStatus(box: box),
                  BoxData(box: box),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
