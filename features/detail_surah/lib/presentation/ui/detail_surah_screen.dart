import 'package:common/utils/provider/preference_settings_provider.dart';
import 'package:common/utils/state/view_data_state.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:dependencies/provider/provider.dart';
import 'package:dependencies/show_up_animation/show_up_animation.dart';
import 'package:detail_surah/presentation/bloc/bloc.dart';
import 'package:detail_surah/presentation/cubits/last_read/last_read_cubit.dart';
import 'package:detail_surah/presentation/ui/widget/banner_verses_widget.dart';
import 'package:detail_surah/presentation/ui/widget/verses_widget.dart';
import 'package:flutter/material.dart';
import 'package:resources/styles/color.dart';
import 'package:resources/styles/text_styles.dart';

class DetailSurahScreen extends StatefulWidget {
  final int id;

  const DetailSurahScreen({super.key, required this.id});

  @override
  State<DetailSurahScreen> createState() => _DetailSurahScreenState();
}

class _DetailSurahScreenState extends State<DetailSurahScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<DetailSurahBloc>().add(FetchDetailSurah(id: widget.id));
      context.read<LastReadCubit>().getLastRead();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PreferenceSettingsProvider>(
      builder: (context, prefSetProvider, _) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
              child: BlocBuilder<DetailSurahBloc, DetailSurahState>(
                builder: (context, state) {
                  final status = state.statusDetailSurah.status;

                  if (status.isLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: prefSetProvider.isDarkTheme
                            ? Colors.white
                            : kPurplePrimary,
                      ),
                    );
                  } else if (status.isNoData) {
                    return Center(child: Text(state.statusDetailSurah.message));
                  } else if (status.isError) {
                    return Center(child: Text(state.statusDetailSurah.message));
                  } else if (status.isHasData) {
                    final surah = state.statusDetailSurah.data;

                    if (context.read<LastReadCubit>().state.data.isEmpty) {
                      context.read<LastReadCubit>().addLastRead(surah!);
                    } else {
                      context.read<LastReadCubit>().updateLastRead(surah!);
                    }

                    return Column(
                      children: [
                        ShowUpAnimation(
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () => Navigator.pop(context),
                                child: const Icon(
                                  Icons.arrow_back,
                                  size: 24.0,
                                  color: kGrey,
                                ),
                              ),
                              const SizedBox(width: 18.0),
                              Text(
                                surah.name.transliteration.id,
                                style: kHeading6.copyWith(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: prefSetProvider.isDarkTheme
                                      ? Colors.white
                                      : kPurpleSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24.0),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                BannerVersesWidget(
                                  surah: surah,
                                  prefSetProvider: prefSetProvider,
                                ),
                                const SizedBox(height: 30.0),
                                ShowUpAnimation(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: surah.verses.length,
                                          itemBuilder: (context, index) {
                                            return VersesWidget(
                                              verses: surah.verses[index],
                                              prefSetProvider: prefSetProvider,
                                              surah:
                                                  surah.name.transliteration.id,
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const Center(child: Text('Error BLoC'));
                  }
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
