import 'package:flowery/features/profile/about_us/data/Models/Content.dart';
import 'package:flowery/features/profile/about_us/data/Models/Style.dart';
import 'package:flowery/features/profile/terms_and_conditions/presentation/viewModel/terms_and_conditions_state.dart';
import 'package:flowery/features/profile/terms_and_conditions/presentation/viewModel/terms_and_conditions_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TermsAndConditionsScreenbody extends StatelessWidget {
  const TermsAndConditionsScreenbody({super.key});

  @override
  Widget build(BuildContext context) {
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';
    final viewModel = context.read<TermsAndConditionsViewModel>();

    return BlocBuilder<TermsAndConditionsViewModel, TermsAndConditionsState>(
      builder: (context, state) {
        // Debug print to verify state
        debugPrint('Current state: $state');

        if (state is TermsAndConditionsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is TermsAndConditionsFailureState) {
          return Center(child: Text(state.errorMessage));
        }

        if (state is TermsAndConditionsSuccessState) {
          final termsAndConditions = state.termsAndConditionsModel;

          // Debug print to verify data
          debugPrint(
            'Data items count: ${termsAndConditions.termsAndConditions?.length ?? 0}',
          );

          if (termsAndConditions.termsAndConditions == null ||
              termsAndConditions.termsAndConditions!.isEmpty) {
            return const Center(child: Text('No terms available'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: termsAndConditions.termsAndConditions!.length,
            itemBuilder: (context, index) {
              final appSection = termsAndConditions.termsAndConditions![index];

              // Debug print for each item
              debugPrint('Building section: ${appSection.section}');

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Skip title only for "title" section
                    if (appSection.section != "title" &&
                        appSection.title != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          isEnglish
                              ? appSection.title!.en ?? ""
                              : appSection.title!.ar ?? "",
                          style: TextStyle(
                            fontSize:
                                (appSection.style?.fontSize ?? 18).toDouble(),
                            fontWeight: viewModel.getFontWeight(
                              appSection.style?.fontWeight,
                            ),
                            color: viewModel.getColor(appSection.style?.color),
                          ),
                        ),
                      ),

                    // Section content
                    if (appSection.content != null)
                      _buildContentWidget(
                        appSection.content!,
                        appSection.style,
                        context,
                      ),
                  ],
                ),
              );
            },
          );
        }

        return const Center(child: Text('Initializing...'));
      },
    );
  }

  Widget _buildContentWidget(
    Content content,
    Style? style,
    BuildContext context,
  ) {
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';
    final viewModel = context.read<TermsAndConditionsViewModel>();
    final contentStyle = style;

    if (content.isList) {
      final contentList = isEnglish ? content.enList : content.arList;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
            contentList
                ?.map(
                  (text) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: (contentStyle?.fontSize ?? 14).toDouble(),
                        fontWeight: viewModel.getFontWeight(
                          contentStyle?.fontWeight,
                        ),
                        color: viewModel.getColor(contentStyle?.color),
                      ),
                    ),
                  ),
                )
                .toList() ??
            [],
      );
    } else {
      return Text(
        isEnglish ? content.en ?? '' : content.ar ?? '',
        style: TextStyle(
          fontSize: (contentStyle?.fontSize ?? 14).toDouble(),
          fontWeight: viewModel.getFontWeight(contentStyle?.fontWeight),
          color: viewModel.getColor(contentStyle?.color),
        ),
      );
    }
  }
}
