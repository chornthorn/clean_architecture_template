import 'package:clean_architecture_templates/domain/entities/category_save_req_entity.dart';

class CategorySaveReqModel {
  CategorySaveReqModel({
    this.name,
  });

  final String name;

  factory CategorySaveReqModel.fromJson(Map<String, dynamic> json) =>
      CategorySaveReqModel(
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
      };
}
