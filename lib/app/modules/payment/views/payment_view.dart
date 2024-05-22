import 'dart:async';

import 'package:bokk_yonn/app/commons/components/app_bar/app_bar_view.dart';
import 'package:bokk_yonn/app/commons/components/app_button/app_button.dart';
import 'package:bokk_yonn/app/commons/components/app_text/app_text.dart';
import 'package:bokk_yonn/app/commons/constantes/colors/app_colors.dart';
import 'package:bokk_yonn/app/modules/payment/controllers/payment_controller.dart';
import 'package:bokk_yonn/app/views/views/payment_validate_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose desired payment method',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Column(
              children: [
                _buildPaymentMethodTile(
                    'KPay', 'assets/payment/kpay.png', controller),
                _buildPaymentMethodTile(
                    'VISA', 'assets/payment/visa.png', controller, '7539', '09/25'),
                _buildPaymentMethodTile(
                    'UPI/Net Banking', 'assets/payment/upi.png', controller),
                _buildPaymentMethodTile(
                    'Cash', 'assets/payment/cash.png', controller),
                _buildPaymentMethodTile(
                    'MasterCard', 'assets/payment/mastercard.png', controller, '5967', '09/25'),
              ],
            ),
            Spacer(),
            AppButton(
              width: Get.width,
              backgroundColor:  mainColor ,
              borderColor:  mainColor ,
              onPressed: (){
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (BuildContext context) {
                    return Container(
                      color: Colors.transparent,
                      child: Center(
                        child: SizedBox(
                          width: 60,
                          height: 60,
                          child: CircularProgressIndicator(
                            color: mainColor,
                          ),
                        )
                      ),
                    );
                  },
                );
                Timer(const Duration(seconds: 4), () {
                  Get.off(() => PaymentValidateView());
                });
              },
              child: AppText(
                labelle: "Payer",
                color: white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodTile(String method, String asset, PaymentController controller, [String? cardNumber, String? expiryDate]) {
    return Obx(() {
      return Container(
        decoration: BoxDecoration(
            color: greyTransparent,
          borderRadius: BorderRadius.circular(10)
        ),
        margin: EdgeInsets.all(8),
        height: 85,
        child: Center(
          child: ListTile(
            leading: Image.asset(asset, width: 40),
            title: Text(method),
            subtitle: cardNumber != null ? Text('**** **** **** $cardNumber\nExpires $expiryDate') : null,
            trailing: Radio(
              value: method,
              groupValue: controller.selectedPaymentMethod.value,
              onChanged: (value) {
                controller.selectPaymentMethod(value as String);
              },
            ),
            onTap: () {
              controller.selectPaymentMethod(method);
            },
          ),
        ),
      );
    });
  }
}
