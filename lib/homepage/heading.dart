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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: SizeConfig.blockSizeVertical * 2,
        ),
        SizedBox(
          width: SizeConfig()
              .textSize('فاستجبنا له', Theme.of(context).textTheme.headline1,
                  context)
              .width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                  child: Divider(
                thickness: 10,
                color: Theme.of(context).cardColor,
              )),
              Text('فاسْتَجَبْنَا لَهُ',
                  style: Theme.of(context).textTheme.headline1),
            ],
          ),
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical * 3,
        ),
        Text('ادْعُونِي أَسْتَجِبْ لَكُمْ - غافر',
            style: Theme.of(context).textTheme.headline5),
        SizedBox(
          height: SizeConfig.blockSizeVertical * 2,
        ),
        Text('وَاذْكُرْ رَبَّكَ إِذَا نَسِيتَ - الكهف',
            style: Theme.of(context).textTheme.headline5),
        SizedBox(
          height: SizeConfig.blockSizeVertical * 3,
        ),
      ],
    ));
  }
}
