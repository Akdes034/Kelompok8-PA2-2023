import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'
    show FontAwesomeIcons;

import '../../../../routes/app_routers.gr.dart';
import '../../../../shared/theme.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_states.dart';
import '../shared/custom_text_form_field.dart';
import '../shared/custom_filled_button.dart';
import '../../data/models/user_model.dart';

// this is the login page
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = '/login';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool obsecureText = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  IconData icon = Icons.visibility;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            // on success delete navigator stack and push to home
            if (state is LoginLoadedState) {
              AutoRouter.of(context).pushAndPopUntil(
                const HomeScreen(),
                predicate: (_) => false,
              );
            } else if (state is LoginErrorState) {
              _showSnackBar(state.message);
            }
          },
          builder: (context, state) {
            if (state is LoginLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0.20),
                    child: const SizedBox(
                      height: 300,
                      width: 300,
                      child: Image(
                        image: AssetImage('assets/images/logo.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal:15,vertical: 20),
                    color: white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          "Selamat Datang di Toko Bahagia",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const SizedBox(height: 5),
                        Form(
                          key: _formKey,
                          child: Column(children: [
                            // email input
                            CustomTextFormField(
                              hintText: "Email",
                              prefixIcon: Icon(
                                Icons.email,
                                color: softGray,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                } else if (!value.contains('@')) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                              controller: _emailController,
                              onSaved: (value) =>
                                  _emailController.text = value!,
                            ),
                            const SizedBox(height: 10),
                            // password input
                            CustomTextFormField(
                              hintText: "Password",
                              prefixIcon: Icon(
                                Icons.lock,
                                color: softGray,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    obsecureText = !obsecureText;
                                    icon = obsecureText
                                        ? Icons.visibility
                                        : Icons.visibility_off;
                                  });
                                },
                                icon: Icon(
                                  icon,
                                  color: softGray,
                                ),
                              ),
                              controller: _passwordController,
                              obscureText: obsecureText,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                } else if (value.length < 6) {
                                  return 'Password must be at least 6 characters';
                                }
                                return null;
                              },
                              onSaved: (value) =>
                                  _passwordController.text = value!,
                            ),
                            const SizedBox(height: 10),

                            const SizedBox(height: 10),
                            CustomFilledButton(
                              gradient: gradient,
                              text: "Login",
                              onPressed: _login,
                            ),
                          ]),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                color: dark,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: _showRegisterPage,
                              child: Text(
                                "Register",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _showForgotPasswordPage() {
    // AutoRouter.of(context).push(const ForgotPasswordRoute());
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<LoginBloc>(context).add(
        LoginEvent.onLoginTapped(
          user: User(
            email: _emailController.text,
            password: _passwordController.text,
          ),
        ),
      );
    }
  }

  void _googleLogin() {
    BlocProvider.of<LoginBloc>(context).add(
      const LoginEvent.onGoogleLoginTapped(),
    );
  }

  void _facebookLogin() {
    BlocProvider.of<LoginBloc>(context).add(
      const LoginEvent.onFacebookLoginTapped(),
    );
  }

  void _showRegisterPage() {
    AutoRouter.of(context).push(const RegisterScreen());
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
