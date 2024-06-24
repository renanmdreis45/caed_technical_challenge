import 'package:caed_technical_challenge/core/preferences/app_constants.dart';
import 'package:caed_technical_challenge/core/preferences/app_ui_texts.dart';
import 'package:caed_technical_challenge/domain/models/box.dart';
import 'package:caed_technical_challenge/domain/models/package.dart';
import 'package:caed_technical_challenge/presentation/view/widgets/box_data.dart';
import 'package:caed_technical_challenge/presentation/view/widgets/box_status.dart';
import 'package:caed_technical_challenge/presentation/view/widgets/packages_list.dart';
import 'package:flutter/material.dart';

class TabsList extends StatelessWidget {
  const TabsList(
      {Key? key,
      required this.tabController,
      required this.box,
      required this.currentIndex})
      : super(key: key);

  final TabController? tabController;
  final BoxModel box;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    print(currentIndex);
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
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
                height: currentIndex == 0 ? MediaQuery.of(context).size.height +
                    (15 * box.packages.length) : currentIndex == 1 ? MediaQuery.of(context).size.height - 50 : MediaQuery.of(context).size.height - 300,
                child: TabBarView(controller: tabController, children: [
                  Expanded(child: PackagesList(packages: box.packages)),
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
