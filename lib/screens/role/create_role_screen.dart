import 'package:flutter/material.dart';
import 'package:zinggerr/config/app_colors.dart';
import 'package:zinggerr/widgets/custom_app_bar.dart';
import 'package:zinggerr/widgets/custom_buton.dart';
import 'package:zinggerr/widgets/custom_scaffold.dart';
import 'package:zinggerr/widgets/custom_status_bar_widget.dart';
import 'package:zinggerr/widgets/custom_text_field.dart';

class CreateRoleScreen extends StatelessWidget {
  CreateRoleScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final _displayNameController = TextEditingController();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StatusBarCustom(
      child: CustomScaffold(
        appBar: const CustomAppBar(
          title: 'Create Role',
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Display Name',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: AppColors.textColor,
                                  ),
                            ),
                            const SizedBox(height: 4),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  CustomTextFormWidget(
                    hintText: 'Enter Display Name',
                    controller: _displayNameController,
                    validator: (value) =>
                        validateSimple(value ?? '', fieldName: 'Display Name'),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: AppColors.textColor,
                                  ),
                            ),
                            const SizedBox(height: 4),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  CustomTextFormWidget(
                    hintText: 'Enter Name',
                    controller: _nameController,
                    validator: (value) =>
                        validateSimple(value ?? '', fieldName: 'Name'),
                    onChanged: (value) {
                      if (value != null) {
                        _nameController.text = value.replaceAll(' ', '');
                        _nameController.selection = TextSelection.fromPosition(
                          TextPosition(offset: _nameController.text.length),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Description',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: AppColors.textColor,
                                  ),
                            ),
                            const SizedBox(height: 4),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  CustomTextFormWidget(
                    hintText: 'Enter Description...',
                    controller: _descriptionController,
                    maxLines: 3,
                    validator: (value) =>
                        validateSimple(value ?? '', fieldName: 'Description'),
                  ),
                  const SizedBox(height: 24),
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomButton(
                      text: 'Submit',
                      ontap: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          // Submit form logic here
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
