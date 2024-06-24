import 'package:caed_technical_challenge/core/common/utils/package_utils.dart';
import 'package:caed_technical_challenge/core/common/utils/package_utils.dart';
import 'package:caed_technical_challenge/core/preferences/app_constants.dart';
import 'package:caed_technical_challenge/core/preferences/app_ui_texts.dart';
import 'package:caed_technical_challenge/domain/models/box.dart';
import 'package:caed_technical_challenge/presentation/view/widgets/package_chart.dart';
import 'package:caed_technical_challenge/presentation/view/widgets/packages_list.dart';
import 'package:caed_technical_challenge/presentation/view/widgets/tabs_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.box}) : super(key: key);

  final BoxModel? box;


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  ScrollPhysics? physics;
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              PackageChart(
                quantRecebidos: widget.box!.recebidos,
                porcentagemRecebidos: calculaPorcentagem(widget.box!.recebidos, (widget.box!.recebidos + widget.box!.faltantesRecebimento)),
                quantRecebidosFaltantes: widget.box!.faltantesRecebimento,
                porcentagemRecebidosFaltantes: calculaPorcentagem(widget.box!.faltantesRecebimento, (widget.box!.faltantesRecebimento + widget.box!.recebidos)),
                quantDevolvidos: widget.box!.devolvidos,
                porcentagemDevolvidos: calculaPorcentagem(widget.box!.devolvidos, (widget.box!.devolvidos + widget.box!.faltantesDevolucao)),
                quantDevolvidosFaltantes: widget.box!.faltantesDevolucao,
                porcentagemDevolvidosFaltantes: calculaPorcentagem(widget.box!.faltantesDevolucao, (widget.box!.faltantesDevolucao + widget.box!.devolvidos)),
              ),
              const SizedBox(
                height: 20,
              ),
              TabsList(tabController: _tabController, box: widget.box!,)
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


