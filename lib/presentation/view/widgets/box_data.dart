import 'package:caed_technical_challenge/core/common/utils/package_utils.dart';
import 'package:caed_technical_challenge/domain/models/box.dart';
import 'package:caed_technical_challenge/core/preferences/app_constants.dart';
import 'package:caed_technical_challenge/core/preferences/app_ui_texts.dart';
import 'package:flutter/material.dart';

class BoxData extends StatelessWidget {
  const BoxData({
    Key? key,
    required this.box,
  }) : super(key: key);

  final BoxModel box;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeader(),
        Expanded(
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 6,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return _buildPackageData(box, index);
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

Widget _buildPackageData(BoxModel box, int index) {
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
          _buildPackageInfo(box, index),
        ],
      )
    ]),
  );
}

Widget _buildPackageInfo(BoxModel box, int index) {
  switch (index) {
    case 0:
      return Text(
        box.codigo.toUpperCase(),
        style: defaultTextStyle(),
      );

    case 1:
      return Text(
        box.pontoEntrega.toUpperCase(),
        style: defaultTextStyle(),
      );

    case 2:
      return Text(
        box.municipio.toUpperCase(),
        style: defaultTextStyle(),
      );

    case 3:
      return Text(
        box.escola.toUpperCase(),
        style: defaultTextStyle(),
      );

    case 4:
      return Text(
        box.etapa.toUpperCase(),
        style: defaultTextStyle(),
      );

    case 5:
      return Text(
        box.componente.toUpperCase(),
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
