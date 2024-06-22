import 'package:caed_technical_challenge/core/common/utils/chart_utils.dart';
import 'package:caed_technical_challenge/core/preferences/app_constants.dart';
import 'package:caed_technical_challenge/core/preferences/app_ui_texts.dart';
import 'package:flutter/material.dart';

class PackageChart extends StatelessWidget {
  const PackageChart({
    Key? key,
    required this.quantRecebidos,
    required this.porcentagemRecebidos,
    required this.quantRecebidosFaltantes,
    required this.porcentagemRecebidosFaltantes,
    required this.quantDevolvidos,
    required this.porcentagemDevolvidos,
    required this.quantDevolvidosFaltantes,
    required this.porcentagemDevolvidosFaltantes,
  }) : super(key: key);

  final int quantRecebidos;
  final int porcentagemRecebidos;
  final int quantRecebidosFaltantes;
  final int porcentagemRecebidosFaltantes;
  final int quantDevolvidos;
  final int porcentagemDevolvidos;
  final int quantDevolvidosFaltantes;
  final int porcentagemDevolvidosFaltantes;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: EdgeInsets.all(5.0),
        height: 300,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(5.0),
              margin: const EdgeInsets.only(right: 10),
              width: (MediaQuery.of(context).size.width * 3) / 4,
              decoration: const BoxDecoration(
                color: chartBgColor,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(UITexts.chartTitleReceivedPackages),
                ),
                Row(children: [
                  Expanded(
                    child: SizedBox(
                      width: double.maxFinite,
                      height: 40,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: receivedPackagesColor,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: missingPackagesColor,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                    ),
                  ),
                ]),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    packagesDataRow(
                        UITexts.chartLabelReceivedPackages,
                        receivedPackagesColor,
                        quantRecebidos,
                        porcentagemRecebidos),
                    packagesDataRow(
                        UITexts.chartLabelMissingPackages,
                        missingPackagesColor,
                        quantRecebidosFaltantes,
                        porcentagemRecebidosFaltantes)
                  ],
                ),
              ]),
            ),
            Container(
              padding: const EdgeInsets.all(5.0),
              margin: const EdgeInsets.only(left: 10),
              width: (MediaQuery.of(context).size.width * 3) / 4,
              decoration: const BoxDecoration(
                color: chartBgColor,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(UITexts.chartTitleReturnedPackages),
                ),
                Row(children: [
                  SizedBox(
                    width: 182,
                    height: 40,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: returnedPackagesColor,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                    width: 58,
                    height: 40,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: missingPackagesColor,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                ]),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    packagesDataRow(
                        UITexts.chartLabelReturnedPackages,
                        returnedPackagesColor,
                        quantDevolvidos,
                        porcentagemDevolvidos),
                    packagesDataRow(
                        UITexts.chartLabelMissingPackages,
                        missingPackagesColor,
                        quantDevolvidosFaltantes,
                        porcentagemDevolvidosFaltantes)
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Map<String, double> get packages_proportions => {
    "recebidos": getPackagesProportions(quantRecebidosFaltantes, quantRecebidos)["complementares"]!,
    "recebidos_faltantes": getPackagesProportions(quantRecebidosFaltantes, quantRecebidos)["faltantes"]!,
    "devolvidos": getPackagesProportions(quantDevolvidosFaltantes, quantDevolvidos)["complementares"]!,
    "devolvidos_faltantes": getPackagesProportions(quantDevolvidosFaltantes, quantDevolvidos)["faltantes"]!,
  };

  Widget packagesDataRow(
      String type, Color legendColor, int quantidade, int percent) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(2),
          child: Row(children: [
            SizedBox(
              height: 10,
              width: 10,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: legendColor,
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
              ),
            ),
            Column(
              children: [
                Text(
                  type,
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '$quantidade pacotes',
                  style: const TextStyle(color: labelGrayPrimaryColor, fontSize: 14),
                ),
              ],
            ),
          ]),
        ),
        Container(
          padding: const EdgeInsets.all(2),
          child: Text(
            '$percent%',
            style: const TextStyle(color: percentPackagesColor, fontSize: 16),
          ),
        )
      ],
    );
  }
}
