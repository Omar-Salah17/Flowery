import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/utils/application_theme.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/features/address/data/models/governorate_model.dart';
import 'package:flowery/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CityDropDownBox extends StatelessWidget {
  final CityModel selectedCity;
  final List<CityModel> cities;
  final ValueChanged<CityModel?> onChanged;

  const CityDropDownBox({
    super.key,
    required this.selectedCity,
    required this.cities,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<CityModel>(
       icon: const Icon(Icons.keyboard_arrow_down_rounded, color: PalletsColors.white90),
      value: selectedCity,
      onChanged: onChanged,
      isExpanded: true,
      items:
          cities
              .map(
                (e) => DropdownMenuItem<CityModel>(
                  value: e,
                  child: Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    e.nameEn,
                    style: ApplicationTheme.themeData.textTheme.bodyLarge
                        ?.copyWith(color: PalletsColors.white70),
                  ),
                ),
              )
              .toList(),

      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(16.r),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: PalletsColors.gray),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: PalletsColors.gray),
        ),
        labelText: LocaleKeys.city.tr(),
        labelStyle: ApplicationTheme.themeData.textTheme.bodySmall?.copyWith(
          color: PalletsColors.white90,
        ),
        hintText: LocaleKeys.city.tr(),
        hintStyle: ApplicationTheme.themeData.textTheme.bodyLarge?.copyWith(
          color: PalletsColors.white70,
        ),
      ),
    );
  }
}
