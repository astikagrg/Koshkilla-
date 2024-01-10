import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../core/common/custom_textformfield.dart';
import '../viewmodel/auth_view_model.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final gap = const SizedBox(height: 12);
  final confPasswordController = TextEditingController();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final fkey = GlobalKey<FormState>();

  checkCameraPermission() async {
    if (await Permission.camera.request().isRestricted ||
        await Permission.camera.request().isDenied) {
      await Permission.camera.request();
    }
  }

  File? _img;
  //gallery ra camera ko lagi
  Future _browseImage(WidgetRef ref, ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image != null) {
        setState(() {
          _img = File(image.path);
        });
        final authState = ref.read(authViewModelProvider.notifier);
        // ignore: use_build_context_synchronously
        authState.uploadProfilePicture(_img!, context);
      } else {
        return;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    checkCameraPermission();
    final authState = ref.watch(authViewModelProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        title: const Text(
          'SIGNUP',
          style: TextStyle(
            fontSize: 33,
            color: Colors.purple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: fkey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.grey[300],
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      builder: (context) => Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                _browseImage(ref, ImageSource.camera);
                                // Navigator.pop(context);
                                // Upload image it is not null
                              },
                              icon: const Icon(Icons.camera),
                              label: const Text('Camera'),
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                                _browseImage(ref, ImageSource.gallery);
                                // Navigator.pop(context);
                              },
                              icon: const Icon(Icons.image),
                              label: const Text('Gallery'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: _img == null
                        ? const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 200,
                          )
                        : Image(
                            image: FileImage(_img!),
                          ),
                  ),
                ),
                // first name field
                customTextField(
                  usernameController,
                  'Username',
                  (value) {
                    if (value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                ),

                gap,
                // email field
                customTextField(
                  emailController,
                  'Email',
                  (value) {
                    if (value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                gap,

                // password field
                customTextField(
                  passwordController,
                  'Password',
                  (value) {
                    if (value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),

                gap,

                // confirm password field
                customTextField(
                  confPasswordController,
                  'Confirm Password',
                  (value) {
                    if (value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value != passwordController.text) {
                      return 'Password does not match';
                    }
                    return null;
                  },
                ),
                gap,
                // signup btn

                if (authState.isLoading) ...{
                  const CircularProgressIndicator(
                    color: Colors.purple,
                  )
                } else ...{
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 89, 23, 108)),
                          alignment: Alignment.center,
                        ),
                        onPressed: () {
                          if (fkey.currentState!.validate()) {
                            final authStateNotifer =
                                ref.read(authViewModelProvider.notifier);
                            authStateNotifer.registerUser(
                              context: context,
                              email: emailController.text,
                              password: passwordController.text,
                              username: usernameController.text,
                              image: authState.imageName,
                            );
                          }
                          // if (fkey.currentState!.validate()) {
                          //   showSnackBar(
                          //     context: context,
                          //     message: 'Please wait...',
                          //   );
                          // }
                        },
                        child: const Text('SIGNUP'),
                      ),
                    ),
                  ),
                },

                // Login btn
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    SizedBox(
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
                          // Navigator.pop(context);
                        },
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'Login',
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
        ),
      ),
    );
  }
}
