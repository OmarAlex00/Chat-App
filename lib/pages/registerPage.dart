import 'package:chat_app/Cubits/register_cubit/register_cubit.dart';
import 'package:chat_app/constants.dart';
import 'package:chat_app/helper/showSnackBar.dart';
import 'package:chat_app/pages/ChatPage.dart';
import 'package:chat_app/widgets/CustomButton.dart';
import 'package:chat_app/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class registerPage extends StatelessWidget {
  static String id = 'RegisterPage';
  String? email;

  String? password;
  bool isloading = false;

  GlobalKey<FormState> formkey = GlobalKey();

  registerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isloading = true;
        }
        if (state is RegisterSuccess) {
          isloading = false;
          Navigator.pushReplacementNamed(context, ChatPage.id,
              arguments: email);
          ShowSnackBar(context, message: state.message);
        }
        if (state is RegisterFail) {
          isloading = false;
          ShowSnackBar(context, message: state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isloading,
          child: Scaffold(
            backgroundColor: kPrimaryColor,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Form(
                key: formkey,
                child: ListView(children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Image.asset(kLogo, height: 100),
                  const Center(
                    child: Text(
                      'Scholar Chat',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'pacifico'),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Sign up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  customFormField(
                    fieldname: 'Email',
                    placeholder: 'Enter your Email',
                    onchange: (index) {
                      email = index;
                    },
                  ),
                  const SizedBox(height: 10),
                  customFormField(
                    fieldname: 'Password',
                    placeholder: 'Enter your password',
                    onchange: (index) {
                      password = index;
                    },
                  ),
                  const SizedBox(height: 20),
                  customButton(
                      buttonName: 'Sign up',
                      ontap: () async {
                        if (formkey.currentState!.validate()) {
                          BlocProvider.of<RegisterCubit>(context)
                              .registerUser(email: email!, password: password!);
                        }
                      }),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          '  Login in now',
                          style: TextStyle(color: Color(0xffD9F6F3)),
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          ),
        );
      },
    );
  }
}
