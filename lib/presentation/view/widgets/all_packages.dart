import 'package:caed_technical_challenge/presentation/view/pages/home/home_page.dart';
import 'package:caed_technical_challenge/presentation/view/view_model/bloc/box/box_bloc.dart';
import 'package:caed_technical_challenge/presentation/view/view_model/bloc/box/box_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllPackages extends StatelessWidget {
  const AllPackages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BoxBloc, BoxState>(
      builder: (context, state) {
        // print(state);
        if (state is BoxDone) {
          return HomePage(
            box: state.box!,
          );
        } else if (state is BoxLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return const SizedBox();
      },
    );
  }
}
