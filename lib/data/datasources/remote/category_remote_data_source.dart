import 'dart:convert';
import 'package:flutter/foundation.dart';
import '../../../core/core.dart';
import '../../../domain/domain.dart';
import '../../models/models.dart';

abstract class CategoryRemoteDataSource {
  Future<List<CategoryEntity>> getCategoryList();
  Future<CategorySaveResEntity> saveCategory(
      CategorySaveReqModel categorySaveReqModel);
}

class CategoryRemoteDataSourceImpl extends CategoryRemoteDataSource {
  final CustomHttp customHttp;

  CategoryRemoteDataSourceImpl({@required this.customHttp});

  @override
  Future<List<CategoryEntity>> getCategoryList() async {
    final response = await customHttp.getRequest(path: CATEGORY);
    print(response);
    return CategoryResultModel.fromJson(response).data;
  }

  @override
  Future<CategorySaveResEntity> saveCategory(
      CategorySaveReqModel reqModel) async {
    var body = json.encode(reqModel);
    final response = await customHttp.postRequest(path: CATEGORY, body: body);
    print(response);
    return CategorySaveResModel.fromJson(response);
  }
}
