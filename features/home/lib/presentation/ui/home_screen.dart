import 'package:common/utils/provider/preference_settings_provider.dart';
import 'package:common/utils/route_observer/route_observer.dart';
import 'package:common/utils/state/view_data_state.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:dependencies/provider/provider.dart';
import 'package:dependencies/show_up_animation/show_up_animation.dart';
import 'package:detail_surah/presentation/cubits/last_read/last_read_cubit.dart';
import 'package:flutter/material.dart';
import 'package:home/presentation/bloc/bloc.dart';
import 'package:home/presentation/ui/widget/banner_last_read_widget.dart';
import 'package:home/presentation/ui/widget/list_surah_widget.dart';
import 'package:resources/constant/named_routes.dart';
import 'package:resources/styles/color.dart';
import 'package:resources/styles/text_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with RouteAware {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<HomeBloc>().add(FetchSurah());
      context.read<LastReadCubit>().getLastRead();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
    context.read<LastReadCubit>().getLastRead();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PreferenceSettingsProvider>(
      builder: (context, prefSetProvider, _) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 32.0, horizontal: 28.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShowUpAnimation(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            prefSetProvider.isDarkTheme
                                ? 'assets/icon_quran_white.png'
                                : 'assets/icon_quran.png',
                            width: 28.0,
                          ),
                          const SizedBox(width: 6.0),
                          Text(
                            'Quran App',
                            style: kHeading6.copyWith(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () => Navigator.pushNamed(
                                context, NamedRoutes.bookmarkScreen),
                            child: Image.asset(
                              prefSetProvider.isDarkTheme
                                  ? 'assets/icon_bookmark_white.png'
                                  : 'assets/icon_bookmark.png',
                              width: 16.0,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          InkWell(
                            onTap: () => prefSetProvider
                                .enableDarkTheme(!prefSetProvider.isDarkTheme),
                            borderRadius: BorderRadius.circular(10.0),
                            child: Icon(
                              prefSetProvider.isDarkTheme
                                  ? Icons.light_mode_sharp
                                  : Icons.dark_mode_sharp,
                              size: 24.0,
                              color: prefSetProvider.isDarkTheme
                                  ? Colors.white
                                  : kPurplePrimary,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 28.0),
                    ShowUpAnimation(
                      child: Text(
                        "Assalamu'alaikum",
                        style: kHeading6.copyWith(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: prefSetProvider.isDarkTheme
                              ? kGrey.withOpacity(0.9)
                              : kGrey.withOpacity(0.7),
                          letterSpacing: 0.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 2.0),
                    ShowUpAnimation(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Ahlan Wa Sahlan',
                            style: kHeading6.copyWith(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w700,
                              color: prefSetProvider.isDarkTheme
                                  ? Colors.white
                                  : kBlackPurple,
                              letterSpacing: 0.0,
                            ),
                          ),
                          Text(
                            ' 🙏',
                            style: kHeading6.copyWith(
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 22.0),
                    const BannerLastReadWidget(),
                    const SizedBox(height: 24.0),
                    ShowUpAnimation(
                      child: Text(
                        'Surah',
                        style: kHeading6.copyWith(
                          fontSize: 18.0,
                          color: prefSetProvider.isDarkTheme
                              ? Colors.white
                              : kDarkPurple,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    ShowUpAnimation(
                      child: SizedBox(
                        width: 40,
                        child: Divider(
                          thickness: 2,
                          color: prefSetProvider.isDarkTheme
                              ? kPurplePrimary
                              : kDarkPurple,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        final status = state.statusSurah.status;

                        if (status.isLoading) {
                          return Center(
                              child: CircularProgressIndicator(
                            color: prefSetProvider.isDarkTheme
                                ? Colors.white
                                : kPurplePrimary,
                          ));
                        } else if (status.isNoData) {
                          return Center(child: Text(state.statusSurah.message));
                        } else if (status.isError) {
                          return Center(child: Text(state.statusSurah.message));
                        } else if (status.isHasData) {
                          final surah = state.statusSurah.data ?? [];
                          return ShowUpAnimation(
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height / 2.1,
                              child: ListSurahWidget(
                                surah: surah,
                                prefSetProvider: prefSetProvider,
                              ),
                            ),
                          );
                        } else {
                          return const Center(child: Text('Error BLoC'));
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
