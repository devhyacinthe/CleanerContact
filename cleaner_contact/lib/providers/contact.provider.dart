import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

class ContactProvider extends ChangeNotifier {
  List<Contact> _contactsList = [];
  final List<Contact> _selectedContacts = [];

  List<Contact> get contactsList => _contactsList;
  List<Contact> get selectedContacts => _selectedContacts;

  void setContactsList(List<Contact> contacts) {
    _contactsList = contacts;
    notifyListeners();
  }

  Future<void> deleteContactsOnList(Contact contact) async {
    await contact.delete();
    _contactsList.remove(contact);
    _selectedContacts.remove(contact);
    notifyListeners();
  }

  void addToSelectedContacts(Contact contact) {
    _selectedContacts.add(contact);
    notifyListeners();
  }

  Contact getContactFromIndex(int index) {
    return _contactsList[index];
  }

  void removeToSelectedContacts(Contact contact) {
    _selectedContacts.remove(contact);
    notifyListeners();
  }

  Future<void> deleteSelectedContact() async {
    if (await FlutterContacts.requestPermission()) {
      for (Contact contact in _selectedContacts) {
        await contact.delete();

        _contactsList.remove(contact);
      }

      _selectedContacts.clear();
    }
  }
}
