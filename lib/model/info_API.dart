import 'data_model.dart';
import 'package:flutter/material.dart';

class InfoAPI {
  final String filename;

  InfoAPI(this.filename);

  Future<DataModel> getDataLocally(BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString(filename);
    final DataModel = dataModelFromJson(data);
    return DataModel;
  }
}
