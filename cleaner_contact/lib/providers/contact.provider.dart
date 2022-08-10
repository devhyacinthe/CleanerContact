import 'package:flutter/material.dart';

import '../models/contacts.model.dart';

class ContactProvider extends ChangeNotifier {
  final List<Contact> _contacts = [];
}
