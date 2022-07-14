import 'package:flutter/material.dart';
import '../else/size_config.dart';

class FavoriteBtn extends StatelessWidget {
  const FavoriteBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //width: double.infinity,
      height: SizeConfig.blockSizeVertical * 6,
      child: ElevatedButton(
          style:
              ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'المفضلة',
                style: Theme.of(context).textTheme.button,
              ),
              SizedBox(
                width: SizeConfig.blockSizeHorizontal * 2,
              ),
              const Icon(
                Icons.favorite,
                color: Colors.red,
                size: 16,
              ),
            ],
          )),
    );
  }
}
