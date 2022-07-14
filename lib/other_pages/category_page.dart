import 'package:flutter/material.dart';
import '../else/routeAnimation.dart';
import '../else/size_config.dart';
import '../main.dart';
import 'contents.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({
    Key? key,
    required this.fileName,
    required this.names,
  }) : super(key: key);

  final fileName;
  final names;
  @override
  State<CategoryPage> createState() =>
      _CategoryPageState(fileName: fileName, names: names);
}

class _CategoryPageState extends State<CategoryPage> {
  _CategoryPageState({
    Key? key,
    required this.fileName,
    required this.names,
  }) : super();
  final fileName;
  final names;
  @override
  Widget build(BuildContext context) {
    //Instanctiate object
    SizeConfig().init(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.keyboard_arrow_left_sharp),
            iconSize: 28,
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Center(
          child: SizedBox(
        width: SizeConfig.blockSizeHorizontal * 90,
        height: SizeConfig.blockSizeVertical * 90,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: SizeConfig()
                      .textSize(
                          fileName == 'assets/duaData.json'
                              ? 'الأدعية'
                              : 'الأذكار',
                          Theme.of(context).textTheme.headline1,
                          context)
                      .width,
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Positioned(
                          child: Divider(
                        thickness: 10,
                        color: Theme.of(context).primaryColor,
                      )),
                      Text(
                          fileName == 'assets/duaData.json'
                              ? 'الأدعية'
                              : 'الأذكار',
                          style: Theme.of(context).textTheme.headline1),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 70,
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1,
                        crossAxisSpacing: SizeConfig.blockSizeHorizontal * 1,
                        mainAxisSpacing: SizeConfig.blockSizeVertical * 3,
                      ),
                      itemCount: names.length,
                      itemBuilder: (context, index) {
                        return Card(
                            elevation: 0,
                            color: Colors.transparent,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Theme.of(context).primaryColor),
                              onPressed: () {
                                Navigator.of(context).push(CustomPageRoute(
                                    child: Contents(
                                      fileName: fileName,
                                      names: names[index],
                                    ),
                                    direction: AxisDirection.up));
                              },
                              child: Center(
                                  child: Text(
                                names[index],
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyText1,
                              )),
                            ));
                      }),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
