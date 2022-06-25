import 'package:flutter/material.dart';
import '../size_config.dart';

class FavoriteBtn extends StatelessWidget {
  const FavoriteBtn({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
          //width: double.infinity,
          height: SizeConfig.blockSizeVertical * 6,
          child: ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 16,
                  ),
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal * 2,
                  ),
                  Text(
                    'المفضلة',
                    style: Theme.of(context).textTheme.button,
                  ),
                ],
              )),
        );
  }
}