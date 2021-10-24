import 'package:at_chat_flutter/utils/init_chat_service.dart' as chats;
import 'package:at_contacts_flutter/at_contacts_flutter.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:at_contact/at_contact.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:at_common_flutter/at_common_flutter.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:at_common_flutter/services/size_config.dart';
import 'package:at_contacts_flutter/services/contact_service.dart';
import 'package:at_contacts_flutter/utils/colors.dart';
import 'package:at_contacts_flutter/utils/text_strings.dart';
import 'package:at_contacts_flutter/widgets/add_contacts_dialog.dart';
import 'package:at_contacts_flutter/widgets/bottom_sheet.dart';
import 'package:at_contacts_flutter/widgets/custom_list_tile.dart';
import 'package:at_contacts_flutter/widgets/custom_search_field.dart';
import 'package:at_contacts_flutter/widgets/error_screen.dart';
import 'package:at_contacts_flutter/widgets/horizontal_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'chats_screen.dart';

class ContactScreen extends StatefulWidget {
  static final String id = '/contact';
  const ContactScreen({Key? key}) : super(key: key);

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return ContactsScreen(
      onSendIconPressed: (String atsign) => _goToChat(context, atsign),
    );
  }

  void _goToChat(BuildContext context, String atsign) {
    chats.setChatWithAtSign(atsign);
    Navigator.of(context).pushNamed(ChatsScreen.id, arguments: atsign);
  }
}
