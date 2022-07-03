import 'package:flutter/material.dart';
import '../size_config.dart';
import 'favorite_btn.dart';
import 'heading.dart';
import 'lists.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    //Instanctiate object
    SizeConfig().init(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline_rounded),
            iconSize: 28,
            onPressed: () {},
          ),
        ],
        elevation: 0,
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.1,
            child: Align(
              alignment: Alignment.topRight,
              child: Image.asset('assets/images/motif-8-flip.png'),
            ),
          ),
          Center(
            child: SizedBox(
              width: SizeConfig.blockSizeHorizontal * 90,
              height: SizeConfig.blockSizeVertical * 90,
              child: Flex(
                direction: Axis.vertical,
                children: const [
                  Heading(),
                  FavoriteBtn(),
                  ContentList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
