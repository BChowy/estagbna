import 'package:flutter/material.dart';
import '../size_config.dart';

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
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Center(
          child: SizedBox(
        width: SizeConfig.blockSizeHorizontal * 90,
        height: SizeConfig.blockSizeVertical * 90,
        child: Column(
          children: [
            SizedBox(
              width: SizeConfig()
                  .textSize(
                      fileName == 'assets/duaData.json' ? 'الأدعية' : 'الأذكار',
                      Theme.of(context).textTheme.headline1,
                      context)
                  .width,
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  Positioned(
                      child: Divider(
                    thickness: 10,
                    /* indent: SizeConfig.blockSizeHorizontal * 20,
                    endIndent: SizeConfig.blockSizeHorizontal * 50, */
                    color: Theme.of(context).cardColor,
                  )),
                  Text(
                      fileName == 'assets/duaData.json' ? 'الأدعية' : 'الأذكار',
                      overflow: TextOverflow.ellipsis, //what?
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
                    crossAxisSpacing: SizeConfig.blockSizeHorizontal * 5,
                    mainAxisSpacing: SizeConfig.blockSizeVertical * 2,
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
                            style: Theme.of(context).textTheme.bodyText1,
                          )),
                        ));
                  }),
            ),
          ],
        ),
      )),
    );
  }
}
