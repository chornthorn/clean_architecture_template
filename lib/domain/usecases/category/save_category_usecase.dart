import 'package:dartz/dartz.dart';
import 'package:clean_architecture_templates/core/errors/failure.dart';
import 'package:clean_architecture_templates/core/usecases/usecase.dart';
import 'package:clean_architecture_templates/data/models/category/category_save_req_model.dart';
import 'package:clean_architecture_templates/domain/entities/category_save_req_entity.dart';
import 'package:clean_architecture_templates/domain/entities/category_save_res_entity.dart';
import 'package:clean_architecture_templates/domain/repositories/category_repository.dart';

class SaveCategoryListUseCase
    implements UseCase<CategorySaveResEntity, CategorySaveReqEntity> {
  final CategoryRepository repository;

  SaveCategoryListUseCase(this.repository);
  @override
  Future<Either<Failure, CategorySaveResEntity>> call(
      CategorySaveReqEntity reqEntity) async {
    return await repository.saveCategory(reqEntity);
  }
}
