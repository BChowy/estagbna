import 'package:estagabna/homepage/dialog.dart';
import 'package:estagabna/main.dart';
import 'package:flutter/material.dart';
import '../else/size_config.dart';
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
            icon: Icon(MyApp.of(context).dark
                ? Icons.light_mode_outlined
                : Icons.dark_mode_outlined),
            iconSize: 28,
            onPressed: () {
              setState(() {
                MyApp.of(context).changeTheme(!MyApp.of(context).dark);
                MyApp.of(context).saveTheme();
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.info_outline_rounded),
            iconSize: 28,
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => const ShowDialogBox());
            },
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
              child: Image.asset(
                'assets/images/motif-2.png',
                color: MyApp.of(context).dark ? null : Colors.black,
              ),
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
                 // FavoriteBtn(),
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
