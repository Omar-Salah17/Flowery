import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/utils/application_theme.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/features/address/data/models/area_model.dart';
import 'package:flowery/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AreaDropDownBox extends StatelessWidget {
  final AreaModel selectedArea;
  final List<AreaModel> area;
  final ValueChanged<AreaModel?> onChanged;

  const AreaDropDownBox({
    super.key,
    required this.selectedArea,
    required this.area,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<AreaModel>(
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: PalletsColors.white90,
      ),
      value: selectedArea,
      onChanged: onChanged,
      isExpanded: true,
      items:
          area
              .map(
                (e) => DropdownMenuItem<AreaModel>(
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
        labelText: LocaleKeys.area.tr(),
        labelStyle: ApplicationTheme.themeData.textTheme.bodySmall?.copyWith(
          color: PalletsColors.white90,
        ),
        hintText: LocaleKeys.area.tr(),
        hintStyle: ApplicationTheme.themeData.textTheme.bodyLarge?.copyWith(
          color: PalletsColors.white70,
        ),
      ),
    );
  }
}
