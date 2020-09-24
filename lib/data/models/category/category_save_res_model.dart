import 'package:clean_architecture_templates/domain/entities/category_save_res_entity.dart';

class CategorySaveResModel extends CategorySaveResEntity {
  CategorySaveResModel({
    this.statusMessage,
  });

  final String statusMessage;

  factory CategorySaveResModel.fromJson(Map<String, dynamic> json) =>
      CategorySaveResModel(
        statusMessage: json["status_message"],
      );

  Map<String, dynamic> toJson() => {
        "status_message": statusMessage,
      };
}
