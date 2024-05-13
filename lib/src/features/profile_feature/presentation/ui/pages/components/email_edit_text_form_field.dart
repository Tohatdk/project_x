import 'package:flutter/material.dart';
import 'package:project_x/src/features/profile_feature/presentation/view_models/email_edit_view_model.dart';

class EmailEditTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final EmailEditViewModel viewModel;

  const EmailEditTextFormField({
    super.key,
    required this.viewModel,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Введите email',
        labelText: 'Email',
        errorText: viewModel.errorMessage,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
