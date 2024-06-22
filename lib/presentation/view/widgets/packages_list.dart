import 'package:caed_technical_challenge/domain/model/package.dart';
import 'package:caed_technical_challenge/core/preferences/app_constants.dart';
import 'package:caed_technical_challenge/core/preferences/app_ui_texts.dart';
import 'package:flutter/material.dart';

class PackagesList extends StatelessWidget {
  const PackagesList({
    Key? key,
    required this.packages,
  }) : super(key: key);

  final List<PackageModel> packages;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeader(),
        Expanded(
          child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            itemCount: packages.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return _buildPackage(packages[index]);
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        ),
      ],
    );
  }
}

Widget _buildHeader() {
  return Container(
    padding: const EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 5),
    child: Column(children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.filter_list,
            color: Colors.black,
            size: 20,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            UITexts.headerLabelPackagesList,
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),
        ],
      )
    ]),
  );
}

Widget _buildPackage(PackageModel package) {
  return Container(
    padding: const EdgeInsets.all(5.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              package.id,
              style: const TextStyle(fontSize: 12, color: idPackageLabel),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                SizedBox(
                  height: 6,
                  width: 57,
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: package.isReceived
                              ? receivedPackagesColor
                              : missingPackagesColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)))),
                ),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  height: 6,
                  width: 57,
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: package.isReturned
                              ? returnedPackagesColor
                              : missingPackagesColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)))),
                ),
              ],
            )
          ],
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_forward_ios,
              size: 15,
              color: Colors.black,
            )),
      ],
    ),
  );
}
