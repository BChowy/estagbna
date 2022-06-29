import 'package:flutter/material.dart';
import '../size_config.dart';
import '../data_model.dart';
import '../info_API.dart';

class Dua extends StatefulWidget {
  const Dua({Key? key}) : super(key: key);

  @override
  _DuaState createState() => _DuaState();
}

class _DuaState extends State<Dua> {
  List<String> getData(DataModel? data) {
    List<String> cateNameList = [];
    //List<Object> cateIdList = [];
    int length = data?.category.length ?? 0;
    for (var i = 0; i < length; i++) {
      final detail = data?.category.elementAt(i);
      cateNameList.add(detail?.name ?? '');
      //cateIdList.add(detail?.cateid ?? '');
      //print(detail?.cateid);
    }
    return cateNameList;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Expanded(
      child: ListView(padding: EdgeInsets.zero,
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
                  onTap: () {},
                  child: Row(children: [
                    Text('إظهار الكل',
                        style: Theme.of(context).textTheme.caption),
                    const Padding(
                      padding: EdgeInsets.only(top: 2),
                      child: Icon(
                        Icons.keyboard_arrow_left_sharp,
                        size: 20,
                      ),
                    ),
                  ]),
                ),
              ],
            )),
          ),
          FutureBuilder<DataModel>(
              future: InfoAPI('assets/duaData.json').getDataLocally(context),
              builder: (context, snapshot) {
                final data = snapshot.data;
                final List<String> list = getData(data);

                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).primaryColor,
                  ),
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
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              //clipBehavior: Clip.antiAlias,
                              color: Theme.of(context).cardColor,
                              child: TextButton(
                                onPressed: () {},
                                child: Center(
                                    child: Text(
                                  list[index],
                                  style: Theme.of(context).textTheme.bodyText1,
                                )),
                              ));
                        },
                      )),
                );
              }), Padding(
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
                  onTap: () {},
                  child: Row(children: [
                    Text('إظهار الكل',
                        style: Theme.of(context).textTheme.caption),
                    const Padding(
                      padding: EdgeInsets.only(top: 2),
                      child: Icon(
                        Icons.keyboard_arrow_left_sharp,
                        size: 20,
                      ),
                    ),
                  ]),
                ),
              ],
            )),
          ),
          FutureBuilder<DataModel>(
              future: InfoAPI('assets/athkarData.json').getDataLocally(context),
              builder: (context, snapshot) {
                final data = snapshot.data;
                final List<String> list = getData(data);

                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).primaryColor,
                  ),
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
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              //clipBehavior: Clip.antiAlias,
                              color: Theme.of(context).cardColor,
                              child: TextButton(
                                onPressed: () {},
                                child: Center(
                                    child: Text(
                                  list[index],
                                  style: Theme.of(context).textTheme.bodyText1,
                                )),
                              ));
                        },
                      )),
                );
              })
        ],
      ),
    );
  }
}
