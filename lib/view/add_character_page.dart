import 'package:firebase/view/common/common_text_field.dart';
import 'package:firebase/view_model/add_character_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCharacterPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  AddCharacterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Character'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                _buildEmailTextField(),
                const SizedBox(height: 16),
                _buildPasswordTextField(),
              ],
            ),
            _buildAddCharacterButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailTextField() {
    return CommonTextField(
      controller: _nameController,
      label: 'Name',
    );
  }

  Widget _buildPasswordTextField() {
    return CommonTextField(
      controller: _genderController,
      label: 'Gender',
    );
  }

  Widget _buildAddCharacterButton(BuildContext context) {
    AddCharacterViewModel viewModel = Provider.of(
      context,
      listen: false,
    );
    return ElevatedButton(
      child: const Text('Add Character'),
      onPressed: () {
        viewModel.addCharacter(
          context,
          _nameController.text.trim(),
          _genderController.text.trim(),
        );
      },
    );
  }
}
