import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/core/utils/custom_text_form_fieled.dart';
import 'package:flowery/core/utils/helper_functions/snack_bar.dart';
import 'package:flowery/features/address/data/models/area_model.dart';
import 'package:flowery/features/address/data/models/governorate_model.dart';
import 'package:flowery/features/address/data/models/logged_user_address_model.dart';
import 'package:flowery/features/address/data/models/user_address_data.dart';
import 'package:flowery/features/address/presentation/view/widgets/area_drop_down_box.dart';
import 'package:flowery/features/address/presentation/view/widgets/city_drop_down_box.dart';
import 'package:flowery/features/address/presentation/view_model/address_details_cubit/address_details_cubit.dart';
import 'package:flowery/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class AddressDetailsScreenBody extends StatefulWidget {
   AddressDetailsScreenBody({super.key, required this.address});
  final Addresses address;


  @override
  State<AddressDetailsScreenBody> createState() =>
      _AddressDetailsScreenBodyState();
}

class _AddressDetailsScreenBodyState extends State<AddressDetailsScreenBody> {
  CityModel? selectedCity;
  AreaModel? selectedArea;
  List<CityModel> citiesList = [];
  List<AreaModel> areasList = [];
  bool isLoading = false;


  @override
  void initState() {
    super.initState();
    loadData();

    }

  Future<void> loadData() async {
    setState(() => isLoading = true);
    citiesList = await CityModel.getCitiesFromAssets(context);
    areasList = await AreaModel.getAreaFromAssets(context);
    if (citiesList.isNotEmpty) selectedCity = citiesList[0];
    if (areasList.isNotEmpty) selectedArea = areasList[0];
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {

    final cubit = context.read<AddressDetailsCubit>();

    log('widgit.address:${widget.address.id}');
    if(widget.address.id != null){

      cubit.id=widget.address.id;
      cubit.address.text = widget.address.street ?? '';
      cubit.phoneNumber.text = widget.address.phone ?? '';
      cubit.recipientNameController.text = widget.address.username ?? '';

    }


    if (isLoading) {
      return const Center(child: CircularProgressIndicator(color: PalletsColors.mainColorBase,));
    }

    return BlocConsumer<AddressDetailsCubit, AddressDetailsState>(
      listener: (context, state) {
        if (state is AddressDetailsLocationUpdated) {
          if (state.city != null) {
            final newCity = citiesList.firstWhere(
              (city) => city.nameEn.toLowerCase() == state.city?.toLowerCase(),
              orElse: () => citiesList[0],
            );
            selectedCity = newCity;
            setState(() {});
          }
          if (state.area != null) {
            final newArea = areasList.firstWhere(
              (area) => area.nameEn.toLowerCase() == state.area?.toLowerCase(),
              orElse: () => areasList[0],
            );
            selectedArea = newArea;
            setState(() {});
          }
        }
        if (state is AddAddressSucces) {
          showSnackBar(context, state.addAddressResponse.message ?? "Success");
          Navigator.pop(context);
        } else if (state is AddAddressFailure) {
          showErrorSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              spacing: 24.h,
              children: [
                SizedBox(
                  height: 145.h,
                  width: double.infinity,
                  child: GoogleMap(
                    onTap: (latlong) {
                      cubit.lat = latlong.latitude;
                      cubit.long = latlong.longitude;

                      cubit.markers = {
                        Marker(
                          markerId: const MarkerId("1"),
                          position: LatLng(cubit.lat!, cubit.long!),
                          draggable: true,
                          onDragEnd: (newPosition) {
                            cubit.lat = newPosition.latitude;
                            cubit.long = newPosition.longitude;
                            cubit.updateAddressFromMap(newPosition);
                          },
                        ),
                      };

                      cubit.updateAddressFromMap(latlong);
                      setState(() {});
                    },
                    markers: cubit.markers,
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                        cubit.lat ?? 30.033333,
                        cubit.long ?? 31.233334,
                      ),
                      zoom: 15,
                    ),
                    onMapCreated: (controller) {
                      cubit.mapController = controller;
                    },
                  ),
                ),

                CustomTextFormFieled(
                  textEditingController: cubit.address,
                  labelText: LocaleKeys.address.tr(),
                  hintText: LocaleKeys.enterAddress.tr(),
                  shouldObscureText: false,
                  onChanged: (_) async {
                    final fullAddress =
                        "${cubit.address.text}, ${selectedArea?.nameEn}, ${selectedCity?.nameEn}";
                    await cubit.updateMapFromAddress(fullAddress);
                  },
                ),
                CustomTextFormFieled(
                  textEditingController: cubit.phoneNumber,
                  labelText: LocaleKeys.phoneNumber.tr(),
                  hintText: LocaleKeys.enterPhoneNumber.tr(),
                  shouldObscureText: false,
                ),
                CustomTextFormFieled(
                  textEditingController: cubit.recipientNameController,
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
                        onChanged: (CityModel? value) async {
                          selectedCity = value;
                          final fullAddress =
                              "${cubit.address.text}, ${selectedArea?.nameEn}, ${selectedCity?.nameEn}";
                          await cubit.updateMapFromAddress(fullAddress);

                          setState(() {});
                        },
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: AreaDropDownBox(
                        selectedArea: selectedArea ?? areasList[0],
                        area: areasList,
                        onChanged: (AreaModel? value) async {
                          selectedArea = value;
                          final fullAddress =
                              "${cubit.address.text}, ${selectedArea?.nameEn}, ${selectedCity?.nameEn}";
                          await cubit.updateMapFromAddress(fullAddress);
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: PalletsColors.black30,
                  ),
                  onPressed: () async { log('${cubit.id}==================');
                   if(cubit.id == null)
                    {
                      log('addddddddd');
                      cubit.addAddress(
                          UserAddressData(
                            street: cubit.address.text.trim(),
                            phone: cubit.phoneNumber.text.trim(),
                            username: cubit.recipientNameController.text.trim(),
                            city: selectedCity?.nameEn ?? '',
                            lat: cubit.lat.toString(),
                            long: cubit.long.toString(),
                          )
                      );
                    } else{
                     log("Updateee");
                     await cubit.updateAddressUseCase(
                         UserAddressData(
                           street: cubit.address.text.trim(),
                           phone: cubit.phoneNumber.text.trim(),
                           username: cubit.recipientNameController.text.trim(),
                           city: selectedCity?.nameEn ?? '',
                           lat: cubit.lat.toString(),
                           long: cubit.long.toString(),
                         ), cubit.id

                     );
                    Navigator.pop(context);
                    showSnackBar(context, 'success');
                   }

                  },
                  child:
                      state is AddAddressLoading
                          ? const CircularProgressIndicator(
                            color: PalletsColors.white10,
                          )
                          : Text(LocaleKeys.saveAddress.tr()),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
