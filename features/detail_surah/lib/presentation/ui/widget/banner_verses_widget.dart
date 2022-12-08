import 'package:common/utils/provider/preference_settings_provider.dart';
import 'package:dependencies/show_up_animation/show_up_animation.dart';
import 'package:flutter/material.dart';
import 'package:quran/domain/entities/detail_surah_entity.dart';
import 'package:resources/styles/color.dart';
import 'package:resources/styles/text_styles.dart';

class BannerVersesWidget extends StatelessWidget {
  final DetailSurahEntity surah;
  final PreferenceSettingsProvider prefSetProvider;

  const BannerVersesWidget({
    super.key,
    required this.surah,
    required this.prefSetProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ShowUpAnimation(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(
              vertical: 30.0,
              horizontal: 64.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              gradient: const LinearGradient(
                colors: [
                  kLinearPurple1,
                  kLinearPurple2,
                ],
              ),
              boxShadow: [
                prefSetProvider.isDarkTheme
                    ? const BoxShadow()
                    : const BoxShadow(
                        blurRadius: 20,
                        spreadRadius: 0.1,
                        offset: Offset(0, 10),
                        color: kLinearPurple1,
                      ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  surah.name.transliteration.id,
                  style: kHeading6.copyWith(
                    fontSize: 26.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  surah.name.translation.id,
                  style: kHeading6.copyWith(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10.0),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.0),
                  child: Divider(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      surah.revelation.id,
                      style: kHeading6.copyWith(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 5.0),
                    Icon(
                      Icons.circle,
                      color: Colors.white.withOpacity(0.5),
                      size: 5,
                    ),
                    const SizedBox(width: 5.0),
                    Text(
                      '${surah.numberOfVerses} Ayat',
                      style: kHeading6.copyWith(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30.0),
                Image.asset(
                  'assets/basmallah.png',
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: ShowUpAnimation(
            child: Image.asset(
              'assets/quran_opacity.png',
              width: 280,
              opacity: const AlwaysStoppedAnimation(0.3),
            ),
          ),
        ),
      ],
    );
  }
}
