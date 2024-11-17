import 'package:flutter/material.dart';
import 'package:flutter_bloc_clean_arch_firebase/core/configs/assets/app_vectors.dart';
import 'package:flutter_bloc_clean_arch_firebase/presentation/home/page/home.dart';
import 'package:flutter_bloc_clean_arch_firebase/presentation/intro/pages/get_started.dart';
import 'package:flutter_svg/svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: SvgPicture.asset(AppVectors.logo)));
  }

  Future<void> redirect() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>HomePage()));
  }
}
