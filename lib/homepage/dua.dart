import 'package:flutter/material.dart';
import '../size_config.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class Dua extends StatefulWidget {
  const Dua({Key? key}) : super(key: key);

  @override
  _DuaState createState() => _DuaState();
}

class _DuaState extends State<Dua> {
  List _categories = [];
  List _desc = [];
  int i = 0;

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/duaData.json');
    final data = await json.decode(response);
    setState(() {
      //for (var category in data["dua"]![i].keys) {
      _categories = data['dua'];
      print(i);
      //  i += 1;
      //}
    });
  }

  @override
  void initState() {
    print('object');readJson();
    super.initState();
    
    
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 2),
          child: (Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {},
                child: Row(children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 2),
                    child: Icon(
                      Icons.keyboard_arrow_left_sharp,
                      size: 20,
                    ),
                  ),
                  Text('إظهار الكل', style: Theme.of(context).textTheme.caption)
                ]),
              ),
              Text(
                'الأدعية',
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          )),
        ),
        /* Container(
          color: Colors.amber,
          height: 30,
          child: ListView(),
        ) */
        _categories.isNotEmpty
            ? Expanded(
                child: ListView.builder(
                  itemCount: _categories.length,
                  itemBuilder: (context, index) {
                    return Container(width: SizeConfig.blockSizeHorizontal*5,
                      margin: const EdgeInsets.all(10),
                      child: Text(_categories[index]),
                    );
                  },
                ),
              )
            : Container(
                child: Text('nothing to show'),
              ),
      ],
    );
  }
}
