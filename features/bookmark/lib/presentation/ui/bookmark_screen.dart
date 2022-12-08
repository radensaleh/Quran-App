import 'package:bookmark/presentation/bloc/bloc.dart';
import 'package:bookmark/presentation/ui/widget/verses_widget.dart';
import 'package:common/utils/provider/preference_settings_provider.dart';
import 'package:common/utils/state/view_data_state.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:dependencies/provider/provider.dart';
import 'package:dependencies/show_up_animation/show_up_animation.dart';
import 'package:flutter/material.dart';
import 'package:resources/styles/color.dart';
import 'package:resources/styles/text_styles.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() => context.read<BookmarkBloc>().add(FetchBookmark()));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PreferenceSettingsProvider>(
      builder: (context, prefSetProvider, _) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 32.0, horizontal: 28.0),
              child: BlocBuilder<BookmarkBloc, BookmarkState>(
                builder: (context, state) {
                  final status = state.statusBookmark.status;

                  if (status.isLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: prefSetProvider.isDarkTheme
                            ? Colors.white
                            : kPurplePrimary,
                      ),
                    );
                  } else if (status.isError) {
                    return Center(child: Text(state.statusBookmark.message));
                  } else if (status.isHasData) {
                    final bookmark = state.statusBookmark.data;

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
                                'Bookmark Ayat',
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
                        bookmark!.isEmpty
                            ? Expanded(
                                flex: 1,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ShowUpAnimation(
                                        child: Image.asset(
                                          'assets/no_data.png',
                                          width: 80.0,
                                        ),
                                      ),
                                      const SizedBox(height: 10.0),
                                      ShowUpAnimation(
                                        child: Text(
                                          'Bookmark Kosong',
                                          style: kHeading6.copyWith(
                                            fontSize: 18.0,
                                            color: prefSetProvider.isDarkTheme
                                                ? kLinearPurple1
                                                : kPurplePrimary,
                                            letterSpacing: 0,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 50.0),
                                    ],
                                  ),
                                ),
                              )
                            : Expanded(
                                child: SingleChildScrollView(
                                  child: ShowUpAnimation(
                                    child: Column(
                                      children: bookmark.map((item) {
                                        return VersesWidget(
                                          bookmark: item,
                                          prefSetProvider: prefSetProvider,
                                        );
                                      }).toList(),
                                    ),
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
