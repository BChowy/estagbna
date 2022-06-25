import 'package:flutter/material.dart';
import '../size_config.dart';

import 'package:estagabna/homepage/dua.dart';
import 'heading.dart';
import 'favorite_btn.dart';

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
          leading: IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
          elevation: 0,
        ),
        body: Center(
          child: SizedBox(
              width: SizeConfig.blockSizeHorizontal * 90,
              height: SizeConfig.blockSizeVertical * 90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  Heading(),
                  FavoriteBtn(),
                  Dua(),
                ],
              )),
        ));
  }
}
