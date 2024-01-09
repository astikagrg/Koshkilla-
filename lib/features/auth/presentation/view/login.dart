import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kosh_killa_app/config/constants/app_routes.dart';
import 'package:kosh_killa_app/features/auth/presentation/viewmodel/auth_view_model.dart';

import '../../../../core/common/custom_textformfield.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final fkey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        title: const Text(
          'LOGIN',
          style: TextStyle(
            fontSize: 33,
            color: Colors.purple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: fkey,
              child: Column(
                children: [
                  customTextField(usernameController, "Username", (value) {
                    if (value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  }),
                  const SizedBox(
                    height: 30,
                  ),
                  customTextField(
                    passwordController,
                    'Password',
                    (value) {
                      if (value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                  ),

                  //forgot Pw:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.transparent),
                            elevation: MaterialStateProperty.all<double>(0),
                            shadowColor: MaterialStateProperty.all<Color>(
                                Colors.transparent),
                            alignment: Alignment.centerRight,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/forgotPwRoute');
                          },
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(color: Colors.purple),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // login btn
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 89, 23, 108)),
                          alignment: Alignment.center,
                        ),
                        onPressed: () async {
                          //          async {
                          if (fkey.currentState!.validate()) {
                            await ref
                                .read(authViewModelProvider.notifier)
                                .loginUser(
                                  context,
                                  usernameController.text,
                                  passwordController.text,
                                );
                          }
                        },
                        child: const Text('Login'),
                      ),
                    ),
                  ),

                  //SignUp btn
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      SizedBox(
                        // width: screenWidth * 0.4,
                        // height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.transparent),
                            elevation: MaterialStateProperty.all<double>(
                                0), // Set elevation to 0
                            shadowColor: MaterialStateProperty.all<Color>(Colors
                                .transparent), // Set shadow color to transparent),
                            alignment: Alignment.centerRight,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, AppRoute.registerRoute);
                          },
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(color: Colors.purple),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
