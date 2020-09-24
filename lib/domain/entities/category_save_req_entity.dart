import 'package:equatable/equatable.dart';
import 'package:clean_architecture_templates/data/models/category/category_save_req_model.dart';

class CategorySaveReqEntity extends CategorySaveReqModel {
  String name;

  CategorySaveReqEntity({this.name});
}
