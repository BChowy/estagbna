import 'package:estagabna/else/size_config.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowDialogBox extends StatefulWidget {
  const ShowDialogBox({Key? key}) : super(key: key);

  @override
  State<ShowDialogBox> createState() => _ShowDialogBoxState();
}

class _ShowDialogBoxState extends State<ShowDialogBox> {
  _sendingMails() async {
    var url = Uri.parse("mailto:bushrashodari.com");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _openTwitter() async {
    var url = Uri.parse("https://twitter.com/BChowy");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      alignment: Alignment.center,
      title: const Text('عن التطبيق'),

      content: SizedBox(
        width: SizeConfig.safeBlockHorizontal * 50,
        child: Column(
          children: [
            Text(
              'اللّهم اجعل هذا التطبيق صدقة جارية عني وعن والديّ وعن أخوتي وعن المسلمين الأحياء منهم والأموات.',
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 3,
            ),
            Text('هذا التطبيق تحت التطوير المستمر.',
                style: (Theme.of(context).textTheme.bodyText1)
                    ?.apply(backgroundColor: Theme.of(context).primaryColor)),
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        IconButton(
            onPressed: _openTwitter,
            icon: Image.asset('assets/images/twitter-logo.png')),
        IconButton(
          onPressed: _sendingMails,
          icon: Image.asset('assets/images/gmail-logo.png'),
        ),
      ],
    );
  }
}
