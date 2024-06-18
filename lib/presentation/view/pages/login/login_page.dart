import 'package:caed_technical_challenge/common/utils/page_utils.dart';
import 'package:caed_technical_challenge/preferences/app_paths.dart';
import 'package:caed_technical_challenge/presentation/view/pages/home/home_page.dart';
import 'package:caed_technical_challenge/presentation/view/view_model/bloc/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc? _bloc;
  final _loginGlobalKey = GlobalKey<ScaffoldState>();

  ScrollPhysics? physics;

  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  String? _emailError;
  String? _passwordError;

  @override
  void initState() {
    super.initState();
    _bloc = LoginBloc();
  }
  
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocListener<LoginBloc, UserLoginState>(
        bloc: _bloc,
        listener: (context, state) {
          if (state is LoginState) {
            if (state.hasError) {
              _emailError = state.emailError;
              _passwordError = state.passwordError;
            }
            if (state.logged) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => HomePage()), (_) => false);
            }
          }
        },
        child: BlocBuilder<LoginBloc, UserLoginState>(
          bloc: _bloc,
          builder: (context, state) {
            return SafeArea(
              child: Scaffold(
                backgroundColor: Colors.white,
                key: _loginGlobalKey,
                body: SingleChildScrollView(
                  physics: physics,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: 200),
                    child: Stack(
                      children: [
                        _buildHeaderImage(),
                        Container(
                          height: pageHeight(context),
                          padding: EdgeInsets.only(bottom: kToolbarHeight * .5),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              _buildLogoImage(),
                              _buildInputFields(state),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Container _buildHeaderImage() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImagesPath.caedBackground),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Center _buildLogoImage() {
    return Center(
      child: Image(
        width: 161,
        height: 39,
        image: AssetImage(ImagesPath.caedLogo),
      ),
    );
  }

  Widget _buildInputFields(UserLoginState state) {
    return Container(
      // constraints: contentBoxConstraints(),
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          // CustomTextField(
          //   placeholder: UITexts.loginFormUserPlaceholder.toUpperCase(),
          //   textInputType: TextInputType.emailAddress,
          //   controller: _emailController,
          //   // autofillHints: [AutofillHints.email],
          //   error: _emailError,
          //   textInputAction: TextInputAction.next,
          //   onChanged: (value) => this.setState(() => _emailError = null),
          // ),
          // Padding(padding: EdgeInsets.symmetric(vertical: 8)),
          // CustomTextField(
          //   obscureText: true,
          //   placeholder: UITexts.loginFormPasswordLabel.toUpperCase(),
          //   controller: _passwordController,
          //   error: _passwordError,
          //   onChanged: (value) => this.setState(() => _passwordError = null),
          // ),
          // _buildLoginButton(state),
        ],
      ),
    );
  }

  // Widget _buildLoginButton(LoginState state) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 24),
  //     child: Stack(
  //       children: [
  //         ActionButton(
  //           title: UITexts.loginFormActionButton,
  //           bgColor: Colors.white,
  //           textColor: Colors.black,
  //           action: () {
  //             if (state is LoginLoadingState) return;
  //             unfocusNode(context);
  //             _bloc!.add(LoginEvent(
  //               email: _emailController.text,
  //               password: _passwordController.text,
  //             ));
  //           },
  //         ),
  //         buttonProgressIndicator(state is LoginLoadingState),
  //       ],
  //     ),
  //   );
  // }
}
