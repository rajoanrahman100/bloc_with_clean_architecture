import 'package:flutter/material.dart';
import 'package:flutter_bloc_clean_arch_firebase/common/common/helper/navigation_service.dart';
import 'package:flutter_bloc_clean_arch_firebase/common/common/widgets/appbar/app_bar.dart';
import 'package:flutter_bloc_clean_arch_firebase/common/common/widgets/button/basic_app_button.dart';
import 'package:flutter_bloc_clean_arch_firebase/data/model/auth/signin_user_req.dart';
import 'package:flutter_bloc_clean_arch_firebase/domain/usecase/auth/signin.dart';
import 'package:flutter_bloc_clean_arch_firebase/presentation/auth/pages/signup.dart';
import 'package:flutter_bloc_clean_arch_firebase/presentation/home/page/home.dart';
import 'package:flutter_bloc_clean_arch_firebase/service_locator.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/configs/assets/app_vectors.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signupText(context),
      appBar: BasicAppbar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _registerText(),
            const SizedBox(
              height: 50,
            ),
            _emailField(context),
            const SizedBox(
              height: 20,
            ),
            _passwordField(context),
            const SizedBox(
              height: 20,
            ),
            BasicAppButton(
                onPressed: () async {
                  var result = await sl<SigninUseCase>()
                      .call(params: SignInUserReq(email: _email.text.toString(), password: _password.text.toString()));
                  result.fold((l) {
                    var snackbar = SnackBar(
                      content: Text(l,style: const TextStyle(color: Colors.white),),
                      behavior: SnackBarBehavior.floating,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  }, (r) {
                    NavigationService().navigatePushReplacement(context, const HomePage());
                  });
                },
                title: 'Sign In')
          ],
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      'Sign In',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      textAlign: TextAlign.center,
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _email,
      decoration: const InputDecoration(hintText: 'Enter Email').applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _password,
      decoration: const InputDecoration(hintText: 'Password').applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _signupText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Not A Member? ',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          TextButton(
              onPressed: () {
                NavigationService().navigatePush(context, SignupPage());
              },
              child: const Text('Register Now'))
        ],
      ),
    );
  }
}
