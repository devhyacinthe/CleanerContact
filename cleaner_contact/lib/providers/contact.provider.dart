import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';

class ContactProvider extends ChangeNotifier {
  List<Contact> _contactsList = [];
  final List<Contact> _selectedContacts = [];

  List<Contact> get contactsList => _contactsList;
  List<Contact> get selectedContacts => _selectedContacts;

  void setContactsList(List<Contact> contacts) {
    _contactsList = contacts;
    notifyListeners();
  }
}
