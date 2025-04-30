import 'package:flutter/material.dart';
import 'package:zinggerr/config/app_asset.dart';
import 'package:zinggerr/config/app_colors.dart';
import 'package:zinggerr/config/app_text.dart';
import 'package:zinggerr/main.dart';
import 'package:zinggerr/utils/ui_helper.dart';
import 'package:zinggerr/widgets/custom_buton.dart';
import 'package:zinggerr/widgets/custom_scaffold.dart';
import 'package:zinggerr/widgets/custom_status_bar_widget.dart';
import 'package:zinggerr/widgets/custom_text_field.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  String selectedGender = 'Male';
  String selectedStatus = 'Active';
  String selectedRole = '';
  bool isPassObs = true;

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StatusBarCustom(
      child: CustomScaffold(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UIHelpers.verticalSpace(20),
                Image.asset(AppAssets.logo, height: 60),
                UIHelpers.verticalSpace(20),
                Text('Create User',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: AppColors.primaryColor)),
                UIHelpers.verticalSpace(30),
                DropdownButtonFormField<String>(
                  value: selectedRole.isEmpty ? null : selectedRole,
                  hint: Text('Select Role'),
                  onChanged: (value) => setState(() => selectedRole = value!),
                  items: ['Admin', 'Teacher', 'Student']
                      .map((role) => DropdownMenuItem(
                            value: role,
                            child: Text(role),
                          ))
                      .toList(),
                ),
                UIHelpers.verticalSpace(15),
                CustomTextFormWidget(
                  hintText: 'Full Name',
                  controller: fullNameController,
                  validator: (val) =>
                      val!.isEmpty ? 'Please enter full name' : null,
                ),
                UIHelpers.verticalSpace(15),
                CustomTextFormWidget(
                  hintText: 'Username',
                  controller: usernameController,
                  validator: (val) =>
                      val!.isEmpty ? 'Please enter username' : null,
                ),
                UIHelpers.verticalSpace(15),
                CustomTextFormWidget(
                  hintText: 'Phone',
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  validator: (val) =>
                      val!.isEmpty ? 'Please enter phone number' : null,
                ),
                UIHelpers.verticalSpace(15),
                CustomTextFormWidget(
                  hintText: 'Email',
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) =>
                      val!.isEmpty ? 'Please enter email' : null,
                ),
                UIHelpers.verticalSpace(15),
                CustomTextFormWidget(
                  hintText: 'Password',
                  controller: passwordController,
                  isObs: isPassObs,
                  validator: (val) =>
                      val!.isEmpty ? 'Please enter password' : null,
                  suffixWidget: InkWell(
                    onTap: () {
                      setState(() {
                        isPassObs = !isPassObs;
                      });
                    },
                    child: Icon(
                      isPassObs
                          ? Icons.visibility_outlined
                          : Icons.visibility_off,
                    ),
                  ),
                ),
                UIHelpers.verticalSpace(20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Gender:',
                        style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
                UIHelpers.verticalSpace(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    UIHelpers.horizontalSpace(10),
                    ...['Male', 'Female', 'Other'].map((gender) {
                      return Row(
                        children: [
                          Radio<String>(
                            value: gender,
                            groupValue: selectedGender,
                            onChanged: (val) =>
                                setState(() => selectedGender = val!),
                            activeColor: AppColors.primaryColor,
                          ),
                          Text(gender,
                              style: Theme.of(context).textTheme.bodySmall),
                        ],
                      );
                    }),
                  ],
                ),
                UIHelpers.verticalSpace(10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Status:',
                        style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
                UIHelpers.verticalSpace(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    UIHelpers.horizontalSpace(10),
                    ...['Active', 'Inactive'].map((status) {
                      return Row(
                        children: [
                          Radio<String>(
                            value: status,
                            groupValue: selectedStatus,
                            onChanged: (val) =>
                                setState(() => selectedStatus = val!),
                            activeColor: AppColors.primaryColor,
                          ),
                          Text(status,
                              style: Theme.of(context).textTheme.bodySmall),
                        ],
                      );
                    }),
                  ],
                ),
                UIHelpers.verticalSpace(20),
                CustomButton(
                  text: 'Submit',
                  ontap: () {
                    // Handle submit logic
                  },
                ),
                UIHelpers.verticalSpace(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
