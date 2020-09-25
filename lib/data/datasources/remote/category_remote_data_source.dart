import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../../core/core.dart';
import '../../../domain/domain.dart';
import '../../models/models.dart';

abstract class CategoryRemoteDataSource {
  Future<List<CategoryEntity>> getCategoryList();
  Future<CategorySaveResEntity> saveCategory(
      CategorySaveReqModel categorySaveReqModel);
  Future<CategoryDeleteResEntity> deleteCategory(
      CategoryDeleteReqEntity categoryDeleteReqEntity);
}

class CategoryRemoteDataSourceImpl extends CategoryRemoteDataSource {
  final CustomHttp _customHttp;

  CategoryRemoteDataSourceImpl({@required CustomHttp customHttp})
      : assert(customHttp != null),
        _customHttp = customHttp;

  @override
  Future<List<CategoryEntity>> getCategoryList() async {
    final response = await _customHttp.getRequest(path: CATEGORY);
    return CategoryResultModel.fromJson(response).data;
  }

  @override
  Future<CategorySaveResEntity> saveCategory(
      CategorySaveReqModel reqModel) async {
    var body = json.encode(reqModel);
    final response = await _customHttp.postRequest(path: CATEGORY, body: body);
    return CategorySaveResModel.fromJson(response);
  }

  @override
  Future<CategoryDeleteResEntity> deleteCategory(
      CategoryDeleteReqEntity categoryDeleteReqEntity) async {
    var id = categoryDeleteReqEntity.id;
    final response = await _customHttp.deleteRequest(path: '$CATEGORY/$id');
    return CategoryDeleteResModel.fromJson(response);
  }
}
