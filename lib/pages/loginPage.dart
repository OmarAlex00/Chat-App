import 'package:chat_app/Cubits/chat_cubit/chat_cubit.dart';
import 'package:chat_app/Cubits/login_cubit/login_cubit.dart';
import 'package:chat_app/constants.dart';
import 'package:chat_app/helper/showSnackBar.dart';
import 'package:chat_app/pages/ChatPage.dart';
import 'package:chat_app/pages/registerPage.dart';
import 'package:chat_app/widgets/CustomButton.dart';
import 'package:chat_app/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class loginPage extends StatelessWidget {
  static String id = 'loginPage';

  String? email;

  String? password;
  bool isloading = false;

  GlobalKey<FormState> formkey = GlobalKey();

  loginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isloading = true;
        } else if (state is LoginSuccess) {
          BlocProvider.of<ChatCubit>(context).getMessage();
          ShowSnackBar(context, message: state.message);
          isloading = false;
          Navigator.pushReplacementNamed(context, ChatPage.id,
              arguments: email);
        } else if (state is LoginFail) {
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
                  const SizedBox(height: 100),
                  Image.asset(kLogo, height: 100),
                  const Center(
                      child: Text('Scholar Chat',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'pacifico'))),
                  const SizedBox(height: 100),
                  const Row(
                    children: [
                      Text(
                        'Sign in',
                        style: TextStyle(color: Colors.white, fontSize: 36),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  customFormField(
                    fieldname: 'Email',
                    placeholder: 'Enter your Email',
                    onchange: (value) {
                      email = value;
                    },
                  ),
                  const SizedBox(height: 10),
                  customFormField(
                    fieldname: 'Password',
                    placeholder: 'Enter your password',
                    onchange: (value) {
                      password = value;
                    },
                    secure: true,
                  ),
                  const SizedBox(height: 20),
                  customButton(
                    buttonName: 'Log in',
                    ontap: () async {
                      if (formkey.currentState!.validate()) {
                        BlocProvider.of<LoginCubit>(context)
                            .loginUser(email: email!, password: password!);
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account?',
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, registerPage.id);
                        },
                        child: const Text(
                          '  Register now',
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
