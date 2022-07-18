import 'package:estagabna/model/info_API.dart';
import 'package:flutter/material.dart';
import '../else/size_config.dart';
import '../model/data_model.dart';

class Contents extends StatefulWidget {
  const Contents({
    Key? key,
    required this.fileName,
    required this.names,
  }) : super(key: key);

  final fileName;
  final names;
  @override
  State<Contents> createState() => _ContentsState(
        fileName: fileName,
        names: names,
      );
}

class _ContentsState extends State<Contents> {
  _ContentsState({
    required this.fileName,
    required this.names,
    Key? key,
  }) : super();
  final fileName;
  final names;

  List<String> getData(DataModel? data) {
    List<String> contentList = [];
    int length = data?.category.length ?? 0;
    for (var i = 0; i < length; i++) {
      final detail = data?.category.elementAt(i);
      if (detail?.name == names) {
        int length2 = detail?.info.length ?? 0;
        for (var j = 0; j < length2; j++) {
          final contents = detail?.info.elementAt(j);

          contentList.add(contents?.desc ?? '');
        }
      }
      //cateIdList.add(detail?.cateid ?? '');
      //print(detail?.cateid);
    }
    return contentList;
  }

  @override
  Widget build(BuildContext context) {
    //Instanctiate object
    SizeConfig().init(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.keyboard_arrow_down_sharp),
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
        child: Column(
          children: [
            SizedBox(
              width: SizeConfig()
                  .textSize(
                      names, Theme.of(context).textTheme.headline1, context)
                  .width,
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  Positioned(
                      child: Divider(
                    thickness: 10,
                    color: Theme.of(context).primaryColor,
                  )),
                  Text(names, style: Theme.of(context).textTheme.headline1),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 5,
            ),
            FutureBuilder<DataModel>(
                future: InfoAPI(fileName).getDataLocally(context),
                builder: (context, snapshot) {
                  final data = snapshot.data;
                  final List<String> list = getData(data);

                  return Expanded(
                    child: SizedBox(
                      height: SizeConfig.blockSizeVertical * 80,
                      child: ListView(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 10.0),
                          scrollDirection: Axis.vertical,
                          physics: const AlwaysScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: List.generate(
                            list.length,
                            (index) {
                              return Center(
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 12.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.favorite_rounded,
                                                color: Colors.white,
                                              ),
                                              iconSize: 20,
                                            ),
                                          ),
                                          SizedBox(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15.0,
                                                  right: 15.0,
                                                  bottom: 15.0),
                                              child: Text(
                                                list[index],
                                                textAlign: TextAlign.justify,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          )),
                    ),
                  );
                }),
          ],
        ),
      )),
    );
  }
}
