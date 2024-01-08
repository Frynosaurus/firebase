import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/model/character_model.dart';
import 'package:flutter/material.dart';

class AddCharacterViewModel with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void addCharacter(BuildContext context, name, String gender) async {
    Character character = Character(name, gender);
    await _firestore.collection('characters').doc().set(character.toMap());
    if (context.mounted) {
      Navigator.pop(context);
    }
  }
}
