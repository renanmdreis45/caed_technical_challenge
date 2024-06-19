import 'package:caed_technical_challenge/preferences/app_constants.dart';
import 'package:caed_technical_challenge/preferences/app_ui_texts.dart';
import 'package:caed_technical_challenge/presentation/view/widgets/package_chart.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(5),
        child: SingleChildScrollView(
          physics: physics,
          child: Column(
              children: [
                PackageChart(
                  quantRecebidos: 1560,
                  porcentagemRecebidos: 75,
                  quantRecebidosFaltantes: 400,
                  porcentagemRecebidosFaltantes: 25,
                  quantDevolvidos: 1560,
                  porcentagemDevolvidos: 75,
                  quantDevolvidosFaltantes: 400,
                  porcentagemDevolvidosFaltantes: 25,
                )
              ],
            ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      toolbarHeight: 70,
      leadingWidth: 50,
      leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
              Icons.arrow_back,
              size: 36,
              color: defaultHeaderColor,
          )),
      title: Center(
          child: Text(
        UITexts.homePageTitle,
        style: const TextStyle(color: defaultHeaderColor, fontSize: 20),
      )),
    );
  }
}
