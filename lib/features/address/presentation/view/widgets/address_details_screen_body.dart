import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/utils/application_theme.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/core/utils/custom_text_form_fieled.dart';
import 'package:flowery/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressDetailsScreenBody extends StatefulWidget {
  const AddressDetailsScreenBody({super.key});

  @override
  State<AddressDetailsScreenBody> createState() =>
      _AddressDetailsScreenBodyState();
}

class _AddressDetailsScreenBodyState extends State<AddressDetailsScreenBody> {
  late TextEditingController address;
  late TextEditingController phoneNumber;
  late TextEditingController recipientName;
  late TextEditingController city;
  late TextEditingController area;
  final List<String> cities = const ['Cairo', 'Giza', 'Alexandria'];
  String selectedCity = "Cairo";
  @override
  void initState() {
    super.initState();
    address = TextEditingController();
    phoneNumber = TextEditingController();
    recipientName = TextEditingController();
    city = TextEditingController();
    area = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        child: Column(
          spacing: 24.h,
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset("assets/images/map.png", fit: BoxFit.cover),
            ),
        
            CustomTextFormFieled(
              textEditingController: address,
              labelText: LocaleKeys.address.tr(),
              hintText: LocaleKeys.enterAddress.tr(),
              shouldObscureText: false,
            ),
            CustomTextFormFieled(
              textEditingController: phoneNumber,
              labelText: LocaleKeys.phoneNumber.tr(),
              hintText: LocaleKeys.enterPhoneNumber.tr(),
              shouldObscureText: false,
            ),
            CustomTextFormFieled(
              textEditingController: recipientName,
              labelText: LocaleKeys.recipientName.tr(),
              hintText: LocaleKeys.enterRecipientName.tr(),
              shouldObscureText: false,
            ),
            Row(
              children: [
                Expanded(
                  child: DropDownBox(
                    selectedCity: selectedCity,
                    cities: cities,
                    onChanged: (String? value) {
                      selectedCity = value ?? "cairo";
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: DropDownBox(
                    selectedCity: selectedCity,
                    cities: cities,
                    onChanged: (String? value) {
                      selectedCity = value ?? "cairo";
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DropDownBox extends StatelessWidget {
  final String selectedCity;
  final List<String> cities;
  final ValueChanged<String?> onChanged;

  const DropDownBox({
    super.key,
    required this.selectedCity,
    required this.cities,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedCity,
      onChanged: onChanged,
      items:
          cities.map((city) {
            return DropdownMenuItem(value: city, child: Text(city));
          }).toList(),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(16.r),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: PalletsColors.gray),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: PalletsColors.gray),
        ),
        labelText: LocaleKeys.city.tr(),
        labelStyle: ApplicationTheme.themeData.textTheme.bodySmall,
        hintText: LocaleKeys.city.tr(),
        hintStyle: ApplicationTheme.themeData.textTheme.bodyMedium?.copyWith(
          color: PalletsColors.white70,
        ),
      ),
    );
  }
}
