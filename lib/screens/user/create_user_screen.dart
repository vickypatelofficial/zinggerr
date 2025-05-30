import 'package:flutter/material.dart';
import 'package:zinggerr/config/app_asset.dart';
import 'package:zinggerr/config/app_colors.dart';
import 'package:zinggerr/config/app_text.dart';
import 'package:zinggerr/main.dart';
import 'package:zinggerr/utils/ui_helper.dart';
import 'package:zinggerr/widgets/custom_app_bar.dart';
import 'package:zinggerr/widgets/custom_background_widget.dart';
import 'package:zinggerr/widgets/custom_buton.dart';
import 'package:zinggerr/widgets/custom_scaffold.dart';
import 'package:zinggerr/widgets/custom_status_bar_widget.dart';
import 'package:zinggerr/widgets/custom_text_field.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

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

  String? _imagePath;
  Widget _buildOptionButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, size: 24),
            const SizedBox(width: 16),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Spacer(),
            Icon(
              Icons.chevron_right,
              color: Theme.of(context).colorScheme.outline,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final option = await showDialog<ImageSource>(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Upload Profile Picture',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildOptionButton(
                context,
                icon: Icons.camera_alt,
                label: 'Take Photo',
                onTap: () => Navigator.pop(context, ImageSource.camera),
              ),
              const SizedBox(height: 12),
              _buildOptionButton(
                context,
                icon: Icons.photo_library,
                label: 'Choose from Gallery',
                onTap: () => Navigator.pop(context, ImageSource.gallery),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
            ],
          ),
        ),
      ),
    );

    if (option != null) {
      final pickedFile = await picker.pickImage(source: option);
      if (pickedFile != null) {
        setState(() {
          _imagePath = pickedFile.path;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return StatusBarCustom(
      child: CustomScaffold(
        appBar: CustomAppBar(
          title: 'Add User',
        ),
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
                Container(
                  padding: const EdgeInsets.all(4), // Border width
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.primaryColor, // Border color
                      width: 2,
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius:
                            48, // Slightly less than container to account for border
                        backgroundImage: _imagePath != null
                            ? FileImage(File(_imagePath!)) as ImageProvider
                            : null,
                        child: _imagePath == null
                            ? const Icon(Icons.person,
                                size: 50, color: Colors.grey)
                            : null,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          onTap: _pickImage,
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: AppColors.black.withOpacity(0.5),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            child: const Icon(
                              Icons.camera_alt,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
