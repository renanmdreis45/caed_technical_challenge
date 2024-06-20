import 'package:caed_technical_challenge/preferences/app_constants.dart';
import 'package:caed_technical_challenge/preferences/app_paths.dart';
import 'package:caed_technical_challenge/preferences/app_ui_texts.dart';
import 'package:caed_technical_challenge/presentation/view/pages/home/home_page.dart';
import 'package:caed_technical_challenge/presentation/view/view_model/bloc/login/login_bloc.dart';
import 'package:caed_technical_challenge/presentation/view/widgets/action_button.dart';
import 'package:caed_technical_challenge/presentation/view/widgets/custom_text_field.dart';
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
                body: Container(
                  height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
                    physics: physics,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: 200),
                      child: Column(
                        children: [
                          _buildHeaderImage(),
                          _buildLogoImage(),
                          Container(
                            height: MediaQuery.of(context).size.height - 330,
                            margin: EdgeInsets.only(top: 50),
                            padding: EdgeInsets.only(bottom: kToolbarHeight * .5),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                _buildInputFields(state),
                              ],
                            ),
                          ),
                        ],
                      ),
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
      height: 300,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImagesPath.caedBackground),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Container _buildLogoImage() {
    return Container(
      child: Image(
        image: AssetImage(ImagesPath.caedLogo),
        width: 169,
        height: 31,
      ),
    );
  }

  Widget _buildInputFields(UserLoginState state) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          CustomTextField(
            label: UITexts.loginFormUserLabel,
            placeholder: UITexts.loginFormUserPlaceholder,
            textInputType: TextInputType.emailAddress,
            controller: _emailController,
            // autofillHints: [AutofillHints.email],
            error: _emailError,
            textInputAction: TextInputAction.next,
            onChanged: (value) => this.setState(() => _emailError = null),
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 8)),
          CustomTextField(
            label: UITexts.loginFormPasswordLabel,
            obscureText: true,
            placeholder: UITexts.loginFormPasswordPlaceholder,
            controller: _passwordController,
            error: _passwordError,
            onChanged: (value) => this.setState(() => _passwordError = null),
          ),
          const SizedBox(
            height: 30,
          ),
          _buildLoginButton(state),
        ],
      ),
    );
  }

  Widget _buildLoginButton(UserLoginState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Stack(
        children: [
          ActionButton(
            title: UITexts.loginFormActionButton,
            bgColor: loginButtonBgColor,
            textColor: Colors.black,
            width: MediaQuery.of(context).size.width,
            action: () {
              print(_emailController.text);
              print(_passwordController.text);
              _bloc!.add(LoginEvent(
                email: _emailController.text,
                password: _passwordController.text,
              ));
                            Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => HomePage()), (_) => false);
            },
          ),
        ],
      ),
    );
  }
}
