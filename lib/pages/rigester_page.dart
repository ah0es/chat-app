import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:chat_app/cubits/rigester/rigester_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constant.dart';
import '../widget/custom_bottom.dart';
import '../widget/custom_text_field.dart';
import 'chat_page.dart';

class RegisterPage extends StatelessWidget {
  String? email;
  static String id = 'RegisterPage';
  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RigesterCubit, RigesterState>(
        listener: (context, state) {
      if (state is RigesterLoading) {
        isLoading = true;
      } else if (state is RigesterSuccess) {
        isLoading = false;
        Navigator.pushNamed(context, ChatPage.id,arguments: email);
      } else if (state is RigesterFailure) {
        isLoading = false;
        showsnakbar(context, state.errorMessage);
      }
    }, builder: (context, state) {
      return BlurryModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 75,
                  ),
                  Image.asset(
                    'assets/images/scholar.png',
                    height: 100,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Scholarchat',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Pacifico',
                          fontSize: 32,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  const Row(
                    children: [
                      Text(
                        'RIGESTER',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    onchange: (data) {
                      email = data;
                    },
                    hintText: 'Email',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    onchange: (data) {
                      password = data;
                    },
                    hintText: 'Password',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomBottom(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<RigesterCubit>(context)
                            .regester(email: email!, password: password!);
                      }
                    },
                    text: 'REGISTER',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Alredey have an account',
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Text(
                          '  LOGIN',
                          style: TextStyle(color: Color(0xffD9F7FA)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  void showsnakbar(BuildContext context, String massage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(massage),
      ),
    );
  }
}
