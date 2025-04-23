import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/config/routes_name.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/core/utils/custom_button.dart';
import 'package:flowery/core/utils/custom_text_form_fieled.dart';
import 'package:flowery/core/utils/helper_functions/snack_bar.dart';
import 'package:flowery/features/cart/data/models/cart_model/cart_response.dart';
import 'package:flowery/features/cart/presentation/view%20model/cubit/cart_cubit.dart';
import 'package:flowery/features/cart/presentation/view/widgets/price_row.dart';
import 'package:flowery/features/check_out/data/models/shipping_address_model.dart';
import 'package:flowery/features/check_out/presentation/view/widgets/address.dart';
import 'package:flowery/features/check_out/presentation/view/widgets/app_bar.dart';
import 'package:flowery/features/check_out/presentation/view/widgets/payment_web_view_screen.dart';
import 'package:flowery/features/check_out/presentation/view_model/check_out_cubit.dart';
import 'package:flowery/features/check_out/presentation/view_model/check_out_state.dart';
import 'package:flowery/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../address/presentation/cubit/address_cubit.dart';
import '../../../cart/presentation/view model/cubit/cart_state.dart';

enum PaymentMethod { cashOnDelivery, creditCard }

class CheckOutScreen extends StatefulWidget {
   CheckOutScreen({super.key,required this.cart});

  final CartResponse cart;

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  PaymentMethod _selectedMethod = PaymentMethod.cashOnDelivery;
  bool isSwitched = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  int selectedAddressIndex =0;


  @override
  Widget build(BuildContext context) {
    final addressCubit = context.read<AddressCubit>();
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LocaleKeys.deliveryAddress.tr(),
                        style: AppTextStyles.instance.textStyle18,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .3,
                        child: BlocProvider(
                          create:
                              (context) => addressCubit..getLoggedUserAddress(),
                          child: BlocBuilder<AddressCubit, AddressState>(
                            buildWhen:
                                (previous, current) =>
                            previous != current &&
                                current is AddressSuccess,
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
                                    style: AppTextStyles.instance.textStyle16
                                        .copyWith(color: Colors.red),
                                  ),
                                );
                              } else if (state is AddressSuccess) {
                                return state.addressList!.isEmpty
                                    ? Center(
                                  child: Text(
                                    'List is empty',
                                    style: AppTextStyles.instance.textStyle16
                                        .copyWith(color: PalletsColors.gray),
                                  ),
                                )
                                    : ListView.builder(
                                  itemCount: state.addressList!.length,
                                  itemBuilder: (context, index) {
                                    final address = state.addressList![index];
                                    String addressName = '';
                                    if (index == 0) {
                                      addressName = LocaleKeys.home.tr();
                                    } else if (index == 1) {
                                      addressName =  LocaleKeys.office.tr();;
                                    } else {
                                      addressName = address.city ?? "";
                                    }
                                    return AddressCard(
                                      title: addressName,
                                      subtitle: address.street ?? '',
                                      onEdit: () {
                                        /// change this after merge ti edit address screen
                                        Navigator.pushNamed(
                                          context,
                                          RoutesName.saveAddressScreen,
                                        );
                                      },
                                      isSelected:
                                      selectedAddressIndex == index,
                                      onSelect: () {
                                        setState(() {
                                          selectedAddressIndex = index;
                                        });
                                      },
                                    );
                                  },
                                );
                              }
                              return Container();
                            },
                          ),
                        ),
                      ),
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
                ),
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
                  PriceRow(title: LocaleKeys.subTotal.tr(), value:widget.cart.cart!.totalPrice.toString()),
                  PriceRow(title: LocaleKeys.deliveryFee.tr(), value: "10 ${LocaleKeys.egp.tr()}"),
                  const Divider(thickness: 1),
                  PriceRow(
                    title: LocaleKeys.total.tr(),
                    value: "${widget.cart.cart!.totalPrice!+10}",
                    titleFontWeight: FontWeight.w500,
                    valueFontWeight: FontWeight.w500,
                    valueColor: PalletsColors.blackBase,
                    titleColor: PalletsColors.blackBase,
                  ),
                  const SizedBox(height: 12),
                  BlocConsumer<CheckOutCubit, CheckOutState>(
                    listener: (context, state) async {
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
                        final url = state.session.checkoutSession.url;

                        if (url != null && url.isNotEmpty) {
                          // Launch the payment URL
                           await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaymentWebViewScreen(url: url),
                            ),
                          );
                           showDialog(
                             context: context,
                             barrierDismissible: false,
                             builder: (_) => const Center(child: CircularProgressIndicator()),
                           );
                           await context.read<CartCubit>().getUserCart();
                          final cartState = context.read<CartCubit>().state;

                          if (cartState is CartSuccess &&
                              cartState.cartResponse.cart?.cartItems?.isEmpty == true) {
                            print('cartResponse.cart?.cartItems?');
                            Navigator.pushReplacementNamed(context, RoutesName.layout);
                            showSnackBar(context, 'Payment Successful');
                          }else
                            {Navigator.pop(context);
                            showErrorSnackBar(context, ' Payment Failed');}
                        }

                        print("Credit Checkout URL: $url");
                      }
                      else if (state is CashCheckOutSuccess) {
                        // Show success message
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Order placed successfully!'),
                          ),
                        );
                        Navigator.pushReplacementNamed(context, RoutesName.layout);
                      } else if (state is CheckOutFailure) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(state.error)));
                      }
                    },
                    builder: (context, state) {
                      return CustomElevatedButton(
                        text: LocaleKeys.placeOrder.tr(),
                        isPink: true,
                          onTap: () {
                            final cubit = context.read<CheckOutCubit>();
                            final addressState = addressCubit.state;

                            // ✅ Check if cart is empty
                            if (widget.cart.cart?.cartItems == null || widget.cart.cart!.cartItems!.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Your cart is empty!")),
                              );
                              return;
                            }

                            // ✅ Check if there's at least one address selected
                            if (addressState is AddressSuccess &&
                                addressState.addressList != null &&
                                addressState.addressList!.isNotEmpty) {
                              final selectedAddress = addressState.addressList![selectedAddressIndex];

                              final shippingAddress = ShippingAddressModel(
                                city: selectedAddress.city,
                                phone: selectedAddress.phone,
                                street: selectedAddress.street,
                                lat: selectedAddress.lat,
                                long: selectedAddress.long,
                              );
                              if (_selectedMethod == PaymentMethod.cashOnDelivery) {
                                cubit.cashCheckout(shippingAddress);
                              } else  {
                                 cubit.creditCheckout(shippingAddress);
                              ;


                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Please select a delivery address.")),
                              );
                            }
                          }

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


}
