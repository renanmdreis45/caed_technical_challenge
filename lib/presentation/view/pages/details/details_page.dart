import 'package:caed_technical_challenge/core/common/utils/package_utils.dart';
import 'package:caed_technical_challenge/domain/models/box.dart';
import 'package:caed_technical_challenge/core/preferences/app_constants.dart';
import 'package:caed_technical_challenge/core/preferences/app_ui_texts.dart';
import 'package:caed_technical_challenge/domain/models/package.dart';
import 'package:caed_technical_challenge/presentation/view/widgets/package_status.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    Key? key,
    required this.package,
  }) : super(key: key);

  final PackageModel package;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context, package),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(UITexts.packageLabelStatus, style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),),
            ),
            Center(child: PackageStatus(package: package))
          ],
        ),
      ),
    );
  }

    PreferredSizeWidget _buildAppBar(BuildContext context, PackageModel package) {
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
        '${UITexts.packageLabelDetailsTitle} ${package.id.toUpperCase()}',
        style: const TextStyle(color: defaultHeaderColor, fontSize: 20),
      )),
    );
  }
}


