import 'package:flowery/features/profile/about_us/data/Models/AboutApp.dart';
import 'package:flowery/features/profile/about_us/data/Models/Content.dart';
import 'package:flowery/features/profile/about_us/data/Models/Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flowery/features/profile/about_us/presentation/viewmodel/about_us_state.dart';
import 'package:flowery/features/profile/about_us/presentation/viewmodel/about_us_viewModel.dart';
import 'package:flowery/features/profile/about_us/data/Models/About_us_model.dart';

class AboutUsScreenBody extends StatelessWidget {
  const AboutUsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';

    return BlocBuilder<AboutUsViewModel, AboutUsState>(
      builder: (context, state) {
        if (state is AboutUsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is AboutUsFailureState) {
          return Center(child: Text(state.errorMessage));
        } else if (state is AboutUsSuccessState) {
          final AboutUsModel aboutUs = state.aboutUs;
          return ListView.builder(
            itemCount: aboutUs.aboutApp?.length ?? 0,
            itemBuilder: (context, index) {
              final AboutApp appSection = aboutUs.aboutApp![index];

              // Special handling for the "title" section
              if (appSection.section == "title") {
                // Only show content without the title
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (appSection.content != null)
                        _buildContentWidget(appSection.content!, appSection.style, context),
                    ],
                  ),
                );
              }

              // Normal handling for all other sections
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (appSection.title != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          isEnglish
                              ? appSection.title?.en ?? ""
                              : appSection.title?.ar ?? "",
                          style: TextStyle(
                            fontSize: (appSection.style?.fontSize ?? 18).toDouble(),
                            fontWeight: context.read<AboutUsViewModel>().getFontWeight(appSection.style?.fontWeight),
                            color: context.read<AboutUsViewModel>().getColor(appSection.style?.color),
                          ),
                          textAlign: context.read<AboutUsViewModel>().getTextAlign(
                            isEnglish
                                ? appSection.style?.textAlign?.en
                                : appSection.style?.textAlign?.ar,
                          ),
                        ),
                      ),

                    if (appSection.section != null && appSection.title == null)
                      Text(
                        context.read<AboutUsViewModel>().getLocalizedTitle(appSection, isEnglish, context),
                        style: TextStyle(
                          fontSize: (appSection.style?.fontSize ?? 16).toDouble(),
                          fontWeight:context.read<AboutUsViewModel>().getFontWeight(appSection.style?.fontWeight),
                          color: context.read<AboutUsViewModel>().getColor(appSection.style?.color),
                        ),
                        textAlign: context.read<AboutUsViewModel>().getTextAlign(
                          isEnglish
                              ? appSection.style?.textAlign?.en
                              : appSection.style?.textAlign?.ar,
                        ),
                      ),

                    const SizedBox(height: 8.0),

                    if (appSection.content != null)
                      _buildContentWidget(appSection.content!, appSection.style, context),
                  ],
                ),
              );
            },
          );
        } else {
          return const Center(
            child: Text("No Data Available"),
          );
        }
      },
    );
  }

  }

  Widget _buildContentWidget(Content content, Style? style, BuildContext context) {
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';
    final contentStyle = style;

    if (content.isList) {
      // Handle list content
      final contentList = isEnglish ? content.enList : content.arList;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: contentList?.map((text) => Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            text,
            style: TextStyle(
              fontSize: (contentStyle?.fontSize ?? 14).toDouble(),
              fontWeight: context.read<AboutUsViewModel>().getFontWeight(contentStyle?.fontWeight),
              color: context.read<AboutUsViewModel>().getColor(contentStyle?.color),
            ),
            textAlign: context.read<AboutUsViewModel>().getTextAlign(
              isEnglish
                  ? contentStyle?.textAlign?.en
                  : contentStyle?.textAlign?.ar,
            ),
          ),
        )).toList() ?? [],
      );
    } else {
      // Handle single string content
      return Text(
        isEnglish ? content.en ?? '' : content.ar ?? '',
        style: TextStyle(
          fontSize: (contentStyle?.fontSize ?? 14).toDouble(),
          fontWeight: context.read<AboutUsViewModel>().getFontWeight(contentStyle?.fontWeight),
          color: context.read<AboutUsViewModel>().getColor(contentStyle?.color),
        ),
        textAlign: context.read<AboutUsViewModel>().getTextAlign(
          isEnglish
              ? contentStyle?.textAlign?.en
              : contentStyle?.textAlign?.ar,
        ),
      );
    }
  }


