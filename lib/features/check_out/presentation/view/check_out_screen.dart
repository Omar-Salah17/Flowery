import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/core/utils/custom_button.dart';
import 'package:flowery/core/utils/custom_text_form_fieled.dart';
import 'package:flowery/core/utils/helper_functions/url_luncher.dart';
import 'package:flowery/features/cart/presentation/view/widgets/price_row.dart';
import 'package:flowery/features/check_out/data/models/shipping_address_model.dart';
import 'package:flowery/features/check_out/presentation/view/widgets/app_bar.dart';
import 'package:flowery/features/check_out/presentation/view_model/check_out_cubit.dart';
import 'package:flowery/features/check_out/presentation/view_model/check_out_state.dart';
import 'package:flowery/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum PaymentMethod { cashOnDelivery, creditCard }

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  PaymentMethod _selectedMethod = PaymentMethod.cashOnDelivery;
  bool isSwitched = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 130),
        child: CheckOutAppBar(),
      ),
      body: Stack(
        children: [
          // Scrollable content
          SingleChildScrollView(
            padding: const EdgeInsets.only(
              bottom: 180,
            ), // space for the checkout section
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 24, color: const Color(0xFFEAEAEA)),
                buildDeliveryAddress(),
                Container(height: 24, color: const Color(0xFFEAEAEA)),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LocaleKeys.paymentMethod.tr(),
                        style: AppTextStyles.instance.textStyle18.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildPaymentOption(
                        title: LocaleKeys.cashOnDelivery.tr(),
                        value: PaymentMethod.cashOnDelivery,
                      ),
                      _buildPaymentOption(
                        title: LocaleKeys.creditCard.tr(),
                        value: PaymentMethod.creditCard,
                      ),
                    ],
                  ),
                ),
                Container(height: 24, color: const Color(0xFFEAEAEA)),
                Row(
                  children: [
                    Switch(
                      activeColor: Colors.white,
                      activeTrackColor: Colors.pink,
                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor: Colors.grey,
                      value: isSwitched,
                      onChanged:
                          _selectedMethod == PaymentMethod.creditCard
                              ? (value) {
                                setState(() {
                                  isSwitched = value;
                                });
                              }
                              : null,
                    ),
                    Text(
                      LocaleKeys.itIsAGift.tr(),
                      style: AppTextStyles.instance.textStyle18.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                if (isSwitched == true) buildIsGiftSection(),
                const SizedBox(height: 20),
              ],
            ),
          ),

          // Fixed Checkout section
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8,
                    color: Colors.black12,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PriceRow(title: LocaleKeys.subTotal.tr(), value: "100 EGP"),
                  PriceRow(title: LocaleKeys.deliveryFee.tr(), value: "10 EGP"),
                  const Divider(thickness: 1),
                  PriceRow(
                    title: LocaleKeys.total.tr(),
                    value: "110 EGP",
                    titleFontWeight: FontWeight.w500,
                    valueFontWeight: FontWeight.w500,
                    valueColor: PalletsColors.blackBase,
                    titleColor: PalletsColors.blackBase,
                  ),
                  const SizedBox(height: 12),
                  BlocConsumer<CheckOutCubit, CheckOutState>(
                    listener: (context, state) {
                      if (state is CheckOutLoading) {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder:
                              (_) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                        );
                      } else {
                        Navigator.of(
                          context,
                          rootNavigator: true,
                        ).pop(); // Close loading dialog
                      }



                      if (state is CreditCheckOutSuccess) {
                        if (state.session.checkoutSession.url != null &&
                            state.session.checkoutSession.url!.isNotEmpty) {
                          launchCustomUrl(context, state.session.checkoutSession.url);
                        }
                        print(
                          "Credit Checkout URL: ${state.session.checkoutSession.url}",
                        );
                      } else if (state is CashCheckOutSuccess) {
                        // Show success message
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Order placed successfully!'),
                          ),
                        );
                      } else if (state is CheckOutFailure) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(state.error)));
                      }
                    },
                    builder: (context, state) {
                      return CustomElevatedButton(
                        text: LocaleKeys.checkout.tr(),
                        isPink: true,
                        onTap: () {
                          final cubit = context.read<CheckOutCubit>();

                          final shippingAddress = ShippingAddressModel(
                            city: "Cairo",
                            phone: "0123456789",
                            street: 'october',
                            lat: 'mm',
                            long: 'mm',
                          );

                          if (_selectedMethod == PaymentMethod.cashOnDelivery) {
                            cubit.cashCheckout(shippingAddress);
                          } else {
                            cubit.creditCheckout(shippingAddress);
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox buildIsGiftSection() {
    return SizedBox(
      height: 170,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isSwitched == true)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  CustomTextFormFieled(
                    textEditingController: nameController,
                    labelText: LocaleKeys.name.tr(),
                    hintText: LocaleKeys.enterName.tr(),
                    shouldObscureText: false,
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormFieled(
                    textEditingController: phoneController,
                    labelText: LocaleKeys.phoneNumber.tr(),
                    hintText: LocaleKeys.enterPhoneNumber.tr(),
                    shouldObscureText: false,
                  ),
                ],
              ),
            )
          else
            Expanded(
              child: Container(
                width: double.infinity,
                color: const Color(0xFFEAEAEA),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPaymentOption({
    required String title,
    required PaymentMethod value,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: RadioListTile<PaymentMethod>(
        controlAffinity: ListTileControlAffinity.trailing,
        title: Text(title, style: AppTextStyles.instance.textStyle16),
        value: value,
        groupValue: _selectedMethod,
        activeColor: PalletsColors.mainColorBase,
        onChanged: (PaymentMethod? newValue) {
          setState(() {
            _selectedMethod = newValue!;
            if (newValue == PaymentMethod.cashOnDelivery) {
              nameController.clear();
              phoneController.clear();
              isSwitched = false;
            }
          });
        },
      ),
    );
  }

  Container buildDeliveryAddress() {
    return Container(
      height: 272,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.deliveryAddress.tr(),
            style: AppTextStyles.instance.textStyle18,
          ),
          const Spacer(),
          OutlinedButton(
            style: const ButtonStyle(
              side: WidgetStatePropertyAll(
                BorderSide(color: PalletsColors.white70),
              ),
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '+ ',
                  style: AppTextStyles.instance.textStyle30.copyWith(
                    color: PalletsColors.mainColorBase,
                  ),
                ),
                Text(
                  LocaleKeys.addNew.tr(),
                  style: AppTextStyles.instance.textStyle18.copyWith(
                    color: PalletsColors.mainColorBase,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

    }

