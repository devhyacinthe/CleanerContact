import 'package:cleaner_contact/constants/colors.dart';
import 'package:cleaner_contact/widgets/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

class BodyWidget extends StatefulWidget {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  List<Contact>? _contacts;
  bool _permissionDenied = false;

  @override
  void initState() {
    super.initState();
    _fetchContacts();
  }

  Future _fetchContacts() async {
    if (!await FlutterContacts.requestPermission(readonly: true)) {
      setState(() => _permissionDenied = true);
    } else {
      final contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);
      print(contacts);
      setState(() => _contacts = contacts);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_permissionDenied) {
      return const Center(child: Text('Permission denied'));
    }

    if (_contacts == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return SingleChildScrollView(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: _contacts!.length,
        itemBuilder: (context, index) {
          return ContactWidget(
              name: _contacts![index].displayName,
              numero: (_contacts![index].phones.isNotEmpty)
                  ? (_contacts![index].phones.first.number)
                  : "---",
              image: _contacts![index].photo);
        },
      ),
    );
  }
}
