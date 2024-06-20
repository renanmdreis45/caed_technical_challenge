import 'package:caed_technical_challenge/common/utils/package_utils.dart';
import 'package:caed_technical_challenge/domain/model/package.dart';
import 'package:caed_technical_challenge/preferences/app_constants.dart';
import 'package:caed_technical_challenge/preferences/app_ui_texts.dart';
import 'package:flutter/material.dart';

class PackagesData extends StatelessWidget {
  const PackagesData({
    Key? key,
    required this.package,
  }) : super(key: key);

  final PackageModel package;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeader(),
        Expanded(
          child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            itemCount: 6,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return _buildPackageData(package, index);
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
    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        UITexts.boxDataLabel,
        style: const TextStyle(color: Colors.black, fontSize: 18),
      ),
    ),
  );
}

Widget _buildPackageData(PackageModel package, int index) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
    child: Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            packagesLabel[index],
            style: const TextStyle(fontSize: 12, color: labelGrayPrimaryColor),
          ),
          const SizedBox(
            width: 5,
          ),
          _buildPackageInfo(package, index),
        ],
      )
    ]),
  );
}

Widget _buildPackageInfo(PackageModel package, int index) {
  switch (index) {
    case 0:
      return Text(
        package.id.toUpperCase(),
        style: defaultTextStyle(),
      );

    case 1:
      return Text(
        package.pontoEntrega.toUpperCase(),
        style: defaultTextStyle(),
      );

    case 2:
      return Text(
        package.municipio.toUpperCase(),
        style: defaultTextStyle(),
      );

    case 3:
      return Text(
        package.escola.toUpperCase(),
        style: defaultTextStyle(),
      );

    case 4:
      return Text(
        package.etapa.toUpperCase(),
        style: defaultTextStyle(),
      );

    case 5:
      return Text(
        package.componente.toUpperCase(),
        style: defaultTextStyle(),
      );

    default:
      return Text(
        UITexts.packageInfoUnavailable,
        style: defaultTextStyle(),
      );
  }
}

TextStyle defaultTextStyle() {
  return const TextStyle(fontSize: 12, color: Colors.black);
}
