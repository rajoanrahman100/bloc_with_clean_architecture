import 'package:flutter/material.dart';
import 'package:flutter_bloc_clean_arch_firebase/common/common/widgets/button/basic_app_button.dart';
import 'package:flutter_bloc_clean_arch_firebase/core/configs/assets/app_images.dart';
import 'package:flutter_bloc_clean_arch_firebase/core/configs/assets/app_vectors.dart';
import 'package:flutter_bloc_clean_arch_firebase/core/configs/theme/app_colors.dart';
import 'package:flutter_bloc_clean_arch_firebase/presentation/choose_mode/pages/choose_mode.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.introBG),
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
                const Text("Enjoy Listening To Music",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18)),
                const Gap(20.0),
                const Text(
                  "Whether it's the rhythm of a favourite song or the soothing melodies that help us unwind, listening to music offers an escape from the pressures of life",
                  style: TextStyle(fontWeight: FontWeight.w500, color: AppColors.grey, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
                const Gap(20.0),
                BasicAppButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ChooseModePage()));
                    },
                    title: 'Get Started')
              ],
            ),
          )
        ],
      ),
    );
  }
}
