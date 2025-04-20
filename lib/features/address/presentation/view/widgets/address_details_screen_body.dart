import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/utils/custom_text_form_fieled.dart';
import 'package:flowery/features/address/data/models/area_model.dart';
import 'package:flowery/features/address/data/models/governorate_model.dart';
import 'package:flowery/features/address/presentation/view/widgets/area_drop_down_box.dart';
import 'package:flowery/features/address/presentation/view/widgets/city_drop_down_box.dart';
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

  CityModel? selectedCity;
  AreaModel? selectedArea;
  List<CityModel> citiesList = [];
  List<AreaModel> areasList = [];

  @override
  void initState() {
    super.initState();
    address = TextEditingController();
    phoneNumber = TextEditingController();
    recipientName = TextEditingController();
    getCities();
    getAreas();
  }

  Future<void> getCities() async {
    citiesList = await CityModel.getCitiesFromAssets(context);
    if (citiesList.isNotEmpty) selectedCity = citiesList[0];
    setState(() {});
  }

  Future<void> getAreas() async {
    areasList = await AreaModel.getAreaFromAssets(context);
    if (areasList.isNotEmpty) selectedCity = citiesList[0];
    setState(() {});
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
                  child: CityDropDownBox(
                    selectedCity: selectedCity ?? citiesList[0],
                    cities: citiesList,
                    onChanged: (CityModel? value) {
                      selectedCity = value;
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: AreaDropDownBox(
                    selectedArea: selectedArea ?? areasList[0],
                    area: areasList,
                    onChanged: (AreaModel? value) {
                      selectedArea = value;
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
