import 'package:delshop/routes/app_routers.gr.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'
    show FontAwesomeIcons, FaIcon;
import '../../../../shared/theme.dart';
import '../bloc/register_bloc.dart';
import '../bloc/register_event.dart';
import '../bloc/register_state.dart';
import '../shared/custom_text_form_field.dart';
import '../shared/custom_filled_button.dart';
import '../../data/models/user_model.dart';

// this is the login page
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const String routeName = '/register';
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool obsecureText = true;
  IconData icon = Icons.visibility;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: BlocConsumer<RegisterBloc, RegisterState>(
          listener: (context, state) {
            // on success delete navigator stack and push to home
            if (state is RegisterLoadedState) {
              AutoRouter.of(context).pushAndPopUntil(
                const HomeScreen(),
                predicate: (_) => false,
              );
            } else if (state is RegisterErrorState) {

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.message,
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is RegisterLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  const SizedBox(
                    width: 150,
                    height: 150,
                    child: Image(
                      image: AssetImage('assets/images/tokobahagia.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Create Account",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: dark,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(children: [
                            // name input
                            CustomTextFormField(
                              prefixIcon: Icon(
                                Icons.person,
                                color: softGray,
                              ),
                              hintText: "Name",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Harap masukkan nama Anda';
                                } else if (value.length < 3) {
                                  return 'Nama minimal harus terdiri dari 3 karakter';
                                }
                                return null;
                              },
                              controller: _nameController,
                              onSaved: (value) => _nameController.text = value!,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // email input
                            CustomTextFormField(
                              prefixIcon: Icon(
                                Icons.email,
                                color: softGray,
                              ),
                              hintText: "Email",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Harap masukkan email Anda';
                                } else if (!value.contains('@')) {
                                  return 'Harap masukkan email yang valid';
                                }
                                return null;
                              },
                              controller: _emailController,
                              onSaved: (value) =>
                                  _emailController.text = value!,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // phone input
                            CustomTextFormField(
                              prefixIcon: Icon(
                                Icons.phone,
                                color: softGray,
                              ),
                              hintText: "Phone",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Harap masukkan nomor telepon Anda';
                                } else if (value.length < 10) {
                                  return 'Nomor telepon minimal harus terdiri atas 10 digit';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.phone,
                              controller: _phoneController,
                              onSaved: (value) =>
                                  _phoneController.text = value!,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
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
                              obscureText: obsecureText,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Harap masukkan kata sandi Anda';
                                } else if (value.length < 6) {
                                  return 'Kata sandi minimal harus terdiri dari 6 karakter';
                                }
                                return null;
                              },
                              controller: _passwordController,
                              onSaved: (value) =>
                                  _passwordController.text = value!,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomFilledButton(
                              gradient: gradient,
                              text: "Register",
                              onPressed: _register,
                            ),
                            const SizedBox(
                              height: 10,
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
                              "Sudah memiliki akun?",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                color: dark,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: _showLoginPage,
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  color: chocolate,
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

  void _showLoginPage() {
    AutoRouter.of(context).replace(const LoginScreen());
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<RegisterBloc>(context).add(
        RegisterEvent.onRegisterTapped(
          user: User(
            email: _emailController.text,
            password: _passwordController.text,
            phone: _phoneController.text,
            name: _nameController.text,
          ),
        ),
      );
    }
  }

  void _googleRegister() {
    BlocProvider.of<RegisterBloc>(context).add(
      const RegisterEvent.onGoogleRegisterTapped(),
    );
  }

  void _facebookRegister() {
    BlocProvider.of<RegisterBloc>(context).add(
      const RegisterEvent.onFacebookRegisterTapped(),
    );
  }
}
