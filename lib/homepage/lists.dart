import 'package:estagabna/else/routeAnimation.dart';
import 'package:flutter/material.dart';
import '../else/size_config.dart';
import '../model/data_model.dart';
import '../model/info_API.dart';
import '../other_pages/category_page.dart';
import '../other_pages/contents.dart';

class ContentList extends StatefulWidget {
  const ContentList({Key? key}) : super(key: key);

  @override
  _ContentListState createState() => _ContentListState();
}

class _ContentListState extends State<ContentList> {
  final duaFilePath = 'assets/duaData.json';
  final athkarFilePath = 'assets/athkarData.json';

  List<String> getData(DataModel? data) {
    List<String> cateNameList = [];
    int length = data?.category.length ?? 0;
    for (var i = 0; i < length; i++) {
      final detail = data?.category.elementAt(i);
      cateNameList.add(detail?.name ?? '');
      //print(detail?.cateid);
    }
    return cateNameList;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Expanded(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          FutureBuilder<DataModel>(
              future: InfoAPI(duaFilePath).getDataLocally(context),
              builder: (context, snapshot) {
                final data = snapshot.data;
                final List<String> list = getData(data);

                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.blockSizeVertical * 2),
                      child: (Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'الأدعية',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                CustomPageRoute(
                                    child: CategoryPage(
                                  fileName: duaFilePath,
                                  names: list,
                                )),
                              );
                            },
                            child: Row(children: [
                              Text('إظهار الكل',
                                  style: Theme.of(context).textTheme.caption),
                              Padding(
                                padding: const EdgeInsets.only(top: 2),
                                child: Icon(
                                  Icons.keyboard_arrow_left_sharp,
                                  size: 20,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ]),
                          ),
                        ],
                      )),
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical * 20,
                      // width: double.infinity,

                      child: GridView.count(
                          crossAxisCount: 1,
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 10.0),
                          scrollDirection: Axis.horizontal,
                          childAspectRatio: 1,
                          physics: const AlwaysScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: List.generate(
                            list.length,
                            (index) {
                              return Card(
                                  color: Colors.transparent,
                                  elevation: 0,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .push(CustomPageRoute(
                                              child: Contents(
                                                fileName: duaFilePath,
                                                names: list[index],
                                              ),
                                              direction: AxisDirection.up));
                                    },
                                    child: Center(
                                        child: Text(
                                      list[index],
                                      textAlign: TextAlign.center,
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    )),
                                  ));
                            },
                          )),
                    ),
                  ],
                );
              }),
          FutureBuilder<DataModel>(
              future: InfoAPI(athkarFilePath).getDataLocally(context),
              builder: (context, snapshot) {
                final data = snapshot.data;
                final List<String> list = getData(data);

                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.blockSizeVertical * 2),
                      child: (Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'الأذكار',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          InkWell(
                            onTap: () => {
                              Navigator.of(context).push(CustomPageRoute(
                                  child: CategoryPage(
                                fileName: athkarFilePath,
                                names: list,
                              ))),
                            },
                            child: Row(children: [
                              Text('إظهار الكل',
                                  style: Theme.of(context).textTheme.caption),
                              Padding(
                                padding: const EdgeInsets.only(top: 2),
                                child: Icon(
                                  Icons.keyboard_arrow_left_sharp,
                                  size: 20,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ]),
                          ),
                        ],
                      )),
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical * 20,
                      // width: double.infinity,

                      child: GridView.count(
                          crossAxisCount: 1,
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 10.0),
                          scrollDirection: Axis.horizontal,
                          childAspectRatio: 1,
                          physics: const AlwaysScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: List.generate(
                            list.length,
                            (index) {
                              return Card(
                                  elevation: 0,
                                  color: Colors.transparent,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .push(CustomPageRoute(
                                              child: Contents(
                                                fileName: athkarFilePath,
                                                names: list[index],
                                              ),
                                              direction: AxisDirection.up));
                                    },
                                    child: Center(
                                        child: Text(
                                      list[index],
                                      textAlign: TextAlign.center,
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    )),
                                  ));
                            },
                          )),
                    ),
                  ],
                );
              })
        ],
      ),
    );
  }
}
