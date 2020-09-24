import 'package:dartz/dartz.dart';
import 'package:clean_architecture_templates/core/errors/failure.dart';
import 'package:clean_architecture_templates/data/models/category/category_save_req_model.dart';
import 'package:clean_architecture_templates/domain/entities/category_entity.dart';
import 'package:clean_architecture_templates/domain/entities/category_save_req_entity.dart';
import 'package:clean_architecture_templates/domain/entities/category_save_res_entity.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
  Future<Either<Failure, CategorySaveResEntity>> saveCategory(
      CategorySaveReqModel reqEntity);
}
