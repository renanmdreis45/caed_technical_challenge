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
        height: MediaQuery.of(context).size.height - 520,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
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
                    flex: quantRecebidos,
                    child: SizedBox(
                      height: 40,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: receivedPackagesColor,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    flex: quantRecebidosFaltantes,
                    child: SizedBox(
                      height: 40,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: missingPackagesColor,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
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
                  Expanded(
                    flex: quantDevolvidos,
                    child: const SizedBox(
                      height: 40,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: returnedPackagesColor,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    flex: quantDevolvidosFaltantes,
                    child: const SizedBox(
                      height: 40,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: missingPackagesColor,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            SizedBox(
              height: 10,
              width: 10,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: legendColor,
                    borderRadius: const BorderRadius.all(Radius.circular(1))),
              ),
            ),
            SizedBox(width: 5,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5,),
                Text(
                  type,
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                ),
                const SizedBox(
                  height: 1,
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
            style: const TextStyle(color: percentPackagesColor, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
