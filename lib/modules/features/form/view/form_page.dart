import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [],
        ),
      ),
      
    );
  }
}

// RaisedButton(onPressed: () => _launchURL('xxx@gmail.com', 'Fl Email Test', 'Hello Flutter'),
// child: Text('Send mail'))


// final Uri _emailLaunchUri = Uri(
//   scheme: 'mailto',
//   path: 'smith@example.com',
//   queryParameters: {
//     'subject': 'Example Subject & Symbols are allowed!'
//   }
// );

// // ...

// // mailto:smith@example.com?subject=Example+Subject+%26+Symbols+are+allowed%21
// launch(_emailLaunchUri.toString());
//////////////////////////////
// _launchURL(String toMailId, String subject, String body) async {
//     var url = 'mailto:$toMailId?subject=$subject&body=$body';
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
//////////////////////////////
// _launchURL() async {
//   final url =
//       Uri.encodeFull('mailto:smith@example.org?subject=News&body=New plugin');
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }
//////////////////////////////