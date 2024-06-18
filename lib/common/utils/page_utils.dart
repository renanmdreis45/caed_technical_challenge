import 'package:flutter/material.dart';

double pageHeight(BuildContext context) =>
    MediaQuery.of(context).size.height - statusBarHeight(context);

double statusBarHeight(BuildContext context) =>
    MediaQuery.of(context).viewPadding.top -
    MediaQuery.of(context).viewPadding.bottom;