import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:clean_architecture_templates/core/networks/http.dart';
import 'package:clean_architecture_templates/core/utils/path.dart';
import 'package:clean_architecture_templates/data/models/category/category_result_model.dart';
import 'package:clean_architecture_templates/data/models/category/category_save_req_model.dart';
import 'package:clean_architecture_templates/data/models/category/category_save_res_model.dart';
import 'package:clean_architecture_templates/domain/entities/category_entity.dart';
import 'package:clean_architecture_templates/domain/entities/category_save_res_entity.dart';

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
