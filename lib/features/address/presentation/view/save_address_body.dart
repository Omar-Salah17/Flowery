import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/di/di.dart';
import 'package:flowery/core/provider/app_config_provider.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/features/address/presentation/cubit/address_cubit.dart';
import 'package:flowery/features/address/presentation/widgets/address_item.dart';
import 'package:flowery/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SaveAddressBody extends StatelessWidget {
  const SaveAddressBody({super.key});

  @override
  Widget build(BuildContext context) {
    final appConfigProvider = getIt<AppConfigProvider>();
    var addressCubit = AddressCubit();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          LocaleKeys.savedAddress.tr(),
          style: AppTextStyles.instance.textStyle20.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: BlocProvider(
              create: (context) => addressCubit..getLoggedUserAddress(),
              child: BlocBuilder<AddressCubit, AddressState>(
                buildWhen:
                    (previous, current) =>
                        previous != current && current is AddressSuccess,
                builder: (context, state) {
                  if (state is AddressLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: PalletsColors.mainColorBase,
                      ),
                    );
                  } else if (state is AddressError) {
                    return Center(
                      child: Text(
                        state.errorMessage,
                        style: AppTextStyles.instance.textStyle16.copyWith(
                          color: Colors.red,
                        ),
                      ),
                    );
                  } else if (state is AddressSuccess) {
                    final addressList = state.addressList;
                    return state.addressList!.isEmpty
                        ? Center(
                          child: Text(
                            'List is empty',
                            style: AppTextStyles.instance.textStyle16.copyWith(
                              color: PalletsColors.gray,
                            ),
                          ),
                        )
                        : ListView.builder(
                          itemCount: state.addressList!.length,
                          itemBuilder: (context, index) {
                            return AddressItem(address: addressList![index]);
                          },
                        );
                  }
                  return Container();
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
              onPressed: () {},
              child: Text(LocaleKeys.addNewAddress.tr()),
            ),
          ),
        ],
      ),
    );
  }
}
