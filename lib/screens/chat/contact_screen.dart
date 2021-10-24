// import 'package:at_chat_flutter/utils/init_chat_service.dart' as chats;
// import 'package:at_contacts_flutter/at_contacts_flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:at_client/at_client.dart';

// import 'chats_screen.dart';

// class ContactScreen extends StatefulWidget {
//   static final String id = '/contact';
//   const ContactScreen({Key? key}) : super(key: key);

//   @override
//   _ContactScreenState createState() => _ContactScreenState();
// }

// class _ContactScreenState extends State<ContactScreen> {

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     var atClientManager = AtClientManager.getInstance();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return ContactsScreen(
//       context: context,
//       onSendIconPressed: (String atsign) => _goToChat(context, atsign),
//     );
//   }

//   void _goToChat(BuildContext context, String atsign) {
//     chats.setChatWithAtSign(atsign);
//     Navigator.of(context).pushNamed(ChatsScreen.id, arguments: atsign);
//   }
// }

import 'package:at_chat_flutter/utils/init_chat_service.dart';
import 'package:at_contacts_flutter/at_contacts_flutter.dart';
import 'package:flutter/material.dart';
import 'package:thecompany/screens/chat/chats_screen.dart';
import 'package:at_client/at_client.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ContactsScreen(
      context: context,
      onSendIconPressed: (String atsign) {
        setChatWithAtSign(atsign);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ChatsScreen(atsign)));
      },
    );
  }
}
