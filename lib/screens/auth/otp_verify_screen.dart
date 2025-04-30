import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zinggerr/blocs/login/login_bloc.dart';
import 'package:zinggerr/config/app_asset.dart';
import 'package:zinggerr/config/app_colors.dart';
import 'package:zinggerr/config/app_text.dart';
import 'package:zinggerr/main.dart';
import 'package:zinggerr/utils/ui_helper.dart';
import 'package:zinggerr/widgets/custom_buton.dart';
import 'package:zinggerr/widgets/custom_scaffold.dart';
import 'package:zinggerr/widgets/custom_status_bar_widget.dart';
import 'package:zinggerr/widgets/custom_text_field.dart';
import 'package:country_picker/country_picker.dart';
import 'package:zinggerr/widgets/otp_filed.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.mobileNumber});
  final String mobileNumber;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final FocusNode focusNode = FocusNode();
  final TextEditingController otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return  StatusBarCustom( 
      child:  CustomScaffold( 
        child:  Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: screenWidth * .05),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(AppAssets.logo, height: 60),
                UIHelpers.verticalSpace(20),
                Text(
                  AppTexts.otpVerification,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: AppColors.primaryColor),
                ),
      
                UIHelpers.verticalSpace(30),
                Text(
                  '${AppTexts.otpSentTo} +${widget.mobileNumber}',
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
                UIHelpers.verticalSpace(30),
      
                /// OTP Fields
                OtpFields(
                  pinController: otpController,
                  focusNode: focusNode,
                  onChanged: (val) {},
                ),
                UIHelpers.verticalSpace(50),
      
                /// Submit Button
                CustomButton(
                  text: AppTexts.submit,
                  ontap: () {
                    debugPrint("Entered OTP: ${otpController.text}");
                  },
                ),
                UIHelpers.verticalSpace(10),
      
                Text(
                  AppTexts.didNotReceiveOtp,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
