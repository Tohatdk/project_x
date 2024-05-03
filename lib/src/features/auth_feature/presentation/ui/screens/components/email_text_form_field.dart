import 'package:flutter/material.dart';
import 'package:project_x/src/features/auth_feature/presentation/view_models/email_text_from_view_model.dart';

class EmailTextFormField extends StatelessWidget {
  final EmailFormViewModel viewModel;
  final TextEditingController controller;

  const EmailTextFormField({
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
        labelText: 'Email',
        prefixIcon: const Icon(Icons.email),
        errorText: viewModel.errorMessage,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide:
              BorderSide(color: Theme.of(context).primaryColor, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
