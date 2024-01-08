import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/model/character_model.dart';
import 'package:firebase/view/add_character_page.dart';
import 'package:firebase/view_model/add_character_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainViewModel with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final List<Character> _characters = [];

  List<Character> get characters => _characters;

  MainViewModel() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        _getCharacters();
      },
    );
  }

  void _getCharacters() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection('characters').get();

    for (QueryDocumentSnapshot<Map<String, dynamic>> documentSnapshot
        in snapshot.docs) {
      Character character = Character.fromMap(
        documentSnapshot.id,
        documentSnapshot.data(),
      );
      _characters.add(character);
    }
    notifyListeners();
  }

  void openAddCharacterPage(BuildContext context) {
    MaterialPageRoute pageRoute = MaterialPageRoute(
      builder: (context) => ChangeNotifierProvider(
        create: (context) => AddCharacterViewModel(),
        child: AddCharacterPage(),
      ),
    );
    Navigator.push(context, pageRoute);
  }
}
