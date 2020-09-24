import 'package:dartz/dartz.dart';
import 'package:clean_architecture_templates/core/errors/failure.dart';
import 'package:clean_architecture_templates/core/usecases/usecase.dart';
import 'package:clean_architecture_templates/domain/entities/category_entity.dart';
import 'package:clean_architecture_templates/domain/repositories/category_repository.dart';

class GetCategoryListUseCase
    implements UseCase<List<CategoryEntity>, NoParams> {
  final CategoryRepository repository;

  GetCategoryListUseCase(this.repository);
  @override
  Future<Either<Failure, List<CategoryEntity>>> call(NoParams params) async {
    return await repository.getCategories();
  }
}
