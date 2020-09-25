import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../../core/core.dart';
import '../../../domain/domain.dart';
import '../../models/models.dart';

abstract class CategoryRemoteDataSource {
  Future<List<CategoryEntity>> index();
  Future<CategorySaveResEntity> store(
      CategorySaveReqModel categorySaveReqModel);
  Future<CategoryDeleteResEntity> delete(
      CategoryDeleteReqEntity categoryDeleteReqEntity);
}

class CategoryRemoteDataSourceImpl extends CategoryRemoteDataSource {
  final CustomHttp _customHttp;

  CategoryRemoteDataSourceImpl({@required CustomHttp customHttp})
      : assert(customHttp != null),
        _customHttp = customHttp;

  @override
  Future<List<CategoryEntity>> index() async {
    final response = await _customHttp.getRequest(path: CATEGORY);
    return CategoryResultModel.fromJson(response).data;
  }

  @override
  Future<CategorySaveResEntity> store(CategorySaveReqModel reqModel) async {
    var body = json.encode(reqModel);
    final response = await _customHttp.postRequest(path: CATEGORY, body: body);
    return CategorySaveResModel.fromJson(response);
  }

  @override
  Future<CategoryDeleteResEntity> delete(
      CategoryDeleteReqModel categoryDeleteReqModel) async {
    var id = categoryDeleteReqModel.id;
    final response = await _customHttp.deleteRequest(path: '$CATEGORY/$id');
    return CategoryDeleteResModel.fromJson(response);
  }
}
