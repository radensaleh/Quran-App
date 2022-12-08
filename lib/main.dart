import 'package:bookmark/presentation/bloc/bloc.dart';
import 'package:bookmark/presentation/ui/bookmark_screen.dart';
import 'package:common/utils/helper/preference_settings_helper.dart';
import 'package:common/utils/navigation/navigation.dart';
import 'package:common/utils/provider/preference_settings_provider.dart';
import 'package:common/utils/route_observer/route_observer.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:dependencies/get_it/get_it.dart';
import 'package:dependencies/provider/provider.dart';
import 'package:dependencies/shared_preferences/shared_preferences.dart';
import 'package:detail_surah/presentation/bloc/bloc.dart';
import 'package:detail_surah/presentation/cubits/bookmark_verses/bookmark_verses_cubit.dart';
import 'package:detail_surah/presentation/cubits/last_read/last_read_cubit.dart';
import 'package:detail_surah/presentation/ui/detail_surah_screen.dart';
import 'package:flutter/material.dart';
import 'package:home/presentation/bloc/home_bloc.dart';
import 'package:home/presentation/ui/home_screen.dart';
import 'package:quran_app/di/injections.dart';
import 'package:resources/constant/named_routes.dart';
import 'package:splash/presentation/ui/onboard_screen.dart';
import 'package:splash/presentation/ui/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Injections().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PreferenceSettingsProvider(
            preferenceSettingsHelper: PreferenceSettingsHelper(
              sharedPreferences: SharedPreferences.getInstance(),
            ),
          ),
        ),
      ],
      child: Consumer<PreferenceSettingsProvider>(
        builder: (context, prefSetProvider, _) {
          return MaterialApp(
            title: 'Quran App',
            theme: prefSetProvider.themeData,
            navigatorKey: navigatorKey,
            navigatorObservers: [routeObserver],
            debugShowCheckedModeBanner: false,
            initialRoute: NamedRoutes.splashScreen,
            routes: {
              NamedRoutes.splashScreen: (_) => SplashScreen(),
              NamedRoutes.onBoardScreen: (_) => const OnBoardScreen(),
              NamedRoutes.homeScreen: (_) => MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (_) => HomeBloc(
                          getSurahUsecase: sl(),
                        ),
                      ),
                      BlocProvider(
                        create: (_) => LastReadCubit(
                          getLastReadUsecase: sl(),
                          saveLastReadUsecase: sl(),
                          updateLastReadUsecase: sl(),
                        ),
                      ),
                    ],
                    child: const HomeScreen(),
                  ),
              NamedRoutes.detailScreen: (context) => MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (_) => DetailSurahBloc(
                          getDetailSurahUsecase: sl(),
                        ),
                      ),
                      BlocProvider(
                        create: (_) => LastReadCubit(
                          saveLastReadUsecase: sl(),
                          updateLastReadUsecase: sl(),
                          getLastReadUsecase: sl(),
                        ),
                      ),
                      BlocProvider(
                        create: (_) => BookmarkVersesCubit(
                            saveBookmarkVersesUseCase: sl(),
                            removeBookmarkVersesUsecase: sl(),
                            statusBookmarkVerseUsecase: sl()),
                      ),
                    ],
                    child: DetailSurahScreen(
                        id: ModalRoute.of(context)?.settings.arguments as int),
                  ),
              NamedRoutes.bookmarkScreen: (context) => MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (_) => BookmarkBloc(
                          getBookmarkVersesUsecase: sl(),
                        ),
                      ),
                      BlocProvider(
                        create: (context) => BookmarkVersesCubit(
                          removeBookmarkVersesUsecase: sl(),
                          saveBookmarkVersesUseCase: sl(),
                          statusBookmarkVerseUsecase: sl(),
                        ),
                      ),
                    ],
                    child: const BookmarkScreen(),
                  ),
            },
          );
        },
      ),
    );
  }
}
