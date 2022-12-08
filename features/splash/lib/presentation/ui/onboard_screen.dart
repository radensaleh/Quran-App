import 'package:common/utils/provider/preference_settings_provider.dart';
import 'package:dependencies/provider/provider.dart';
import 'package:dependencies/show_up_animation/show_up_animation.dart';
import 'package:flutter/material.dart';
import 'package:resources/constant/named_routes.dart';
import 'package:resources/styles/color.dart';
import 'package:resources/styles/text_styles.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 80.0),
        child: Center(
          child: Column(
            children: [
              ShowUpAnimation(
                child: Text(
                  'Quran App',
                  style: kHeading6.copyWith(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              ShowUpAnimation(
                child: Text(
                  'Pelajari Quran dan\nBacalah sekali setiap hari',
                  textAlign: TextAlign.center,
                  style: kHeading6.copyWith(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                    color: kGrey.withOpacity(0.8),
                  ),
                ),
              ),
              const SizedBox(height: 40.0),
              Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    children: [
                      ShowUpAnimation(
                        child: Image.asset(
                          'assets/quran_onboard.png',
                        ),
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    child: ShowUpAnimation(
                      child: InkWell(
                        onTap: () => Navigator.pushNamedAndRemoveUntil(
                            context, NamedRoutes.homeScreen, (route) => false),
                        borderRadius: BorderRadius.circular(28.0),
                        child: Container(
                          margin: const EdgeInsets.all(2.0),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40.0,
                            vertical: 18.0,
                          ),
                          decoration: BoxDecoration(
                            color: kMikadoYellow,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Consumer<PreferenceSettingsProvider>(
                            builder: (context, prefSetProvider, _) {
                              return Text(
                                ' Mulai Yuk! ',
                                style: kHeading6.copyWith(
                                    color: prefSetProvider.isDarkTheme
                                        ? kBlackPurple
                                        : Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600),
                              );
                            },
                          ),
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
    );
  }
}
