import 'package:dependencies/bloc/bloc.dart';
import 'package:dependencies/show_up_animation/show_up_animation.dart';
import 'package:detail_surah/presentation/cubits/last_read/last_read_cubit.dart';
import 'package:flutter/material.dart';
import 'package:resources/styles/color.dart';
import 'package:resources/styles/text_styles.dart';

class BannerLastReadWidget extends StatelessWidget {
  const BannerLastReadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ShowUpAnimation(
          child: Container(
            padding: const EdgeInsets.all(22.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  kLinearPurple1,
                  kLinearPurple2,
                ],
              ),
            ),
            child: BlocBuilder<LastReadCubit, LastReadState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShowUpAnimation(
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icon_readme.png',
                            width: 20,
                          ),
                          const SizedBox(width: 6.0),
                          Text(
                            'Last Read',
                            style: kHeading6.copyWith(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 22.0),
                    ShowUpAnimation(
                      child: Text(
                        state.data.isEmpty ? '-' : state.data[0].surah,
                        style: kHeading6.copyWith(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 2.0),
                    Row(
                      children: [
                        ShowUpAnimation(
                          child: Text(
                            state.data.isEmpty ? '-' : state.data[0].revelation,
                            style: kHeading6.copyWith(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(width: 4.0),
                        ShowUpAnimation(
                          child: Icon(
                            Icons.circle,
                            color: Colors.white.withOpacity(0.8),
                            size: 4,
                          ),
                        ),
                        const SizedBox(width: 4.0),
                        ShowUpAnimation(
                          child: Text(
                            state.data.isEmpty
                                ? '-'
                                : '${state.data[0].numberOfVerses} Ayat',
                            style: kHeading6.copyWith(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        Positioned(
          bottom: -30.0,
          right: -36.0,
          child: ShowUpAnimation(
            child: Image.asset(
              'assets/quran.png',
              width: 220,
            ),
          ),
        ),
      ],
    );
  }
}
