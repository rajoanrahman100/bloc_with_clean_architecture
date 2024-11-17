import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_arch_firebase/common/common/helper/navigation_service.dart';
import 'package:flutter_bloc_clean_arch_firebase/common/common/widgets/button/basic_app_button.dart';
import 'package:flutter_bloc_clean_arch_firebase/core/configs/assets/app_vectors.dart';
import 'package:flutter_bloc_clean_arch_firebase/core/configs/theme/app_colors.dart';
import 'package:flutter_bloc_clean_arch_firebase/presentation/auth/pages/signin_or_signup.dart';
import 'package:flutter_bloc_clean_arch_firebase/presentation/choose_mode/bloc/theme_cubit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../core/configs/assets/app_images.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.chooseModeBG),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.15),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40.0,
              vertical: 40.0,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    AppVectors.logo,
                  ),
                ),
                const Spacer(),
                const Text("Choose Mode",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18)),
                const Gap(20.0),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
                        },
                        child: ClipOval(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  color: const Color(0xff30393C).withOpacity(0.5), shape: BoxShape.circle),
                              child: SvgPicture.asset(
                                AppVectors.moon,
                                fit: BoxFit.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Dark Mode',
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17, color: AppColors.grey),
                      )
                    ],
                  ),
                  const Gap(20.0),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.read<ThemeCubit>().updateTheme(ThemeMode.light);
                        },
                        child: ClipOval(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  color: const Color(0xff30393C).withOpacity(0.5), shape: BoxShape.circle),
                              child: SvgPicture.asset(
                                AppVectors.sun,
                                fit: BoxFit.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Light Mode',
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17, color: AppColors.grey),
                      )
                    ],
                  ),
                ]),
                const Gap(20.0),
                BasicAppButton(
                    onPressed: () {
                      NavigationService().navigatePush(context, const SignupOrSigninPage());
                    },
                    title: 'Continue')
              ],
            ),
          )
        ],
      ),
    );
  }
}
