import '../size_config.dart';
import 'package:flutter/material.dart';

class Heading extends StatefulWidget {
  const Heading({Key? key}) : super(key: key);

  @override
  _HeadingState createState() => _HeadingState();
}

class _HeadingState extends State<Heading> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return (Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text('فاسْتَجَبْنَا لَهُ',
            textDirection: TextDirection.rtl,
            overflow: TextOverflow.ellipsis, //what?
            style: Theme.of(context).textTheme.headline1),
        SizedBox(
          height: SizeConfig.blockSizeVertical * 3,
        ),
        Text('ادْعُونِي أَسْتَجِبْ لَكُمْ - غافر',
            textDirection: TextDirection.rtl,
            overflow: TextOverflow.ellipsis, //what?
            style: Theme.of(context).textTheme.headline5),
        SizedBox(
          height: SizeConfig.blockSizeVertical * 2,
        ),
        Text('وَاذْكُرْ رَبَّكَ إِذَا نَسِيتَ - الكهف',
            textDirection: TextDirection.rtl,
            overflow: TextOverflow.ellipsis, //what?
            style: Theme.of(context).textTheme.headline5),
        SizedBox(
          height: SizeConfig.blockSizeVertical * 3,
        ),
      ],
    ));
  }
}
