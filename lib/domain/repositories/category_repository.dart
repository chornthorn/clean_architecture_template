import 'package:dartz/dartz.dart';
import '../../core/core.dart';
import '../../data/data.dart';
import '../domain.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
  Future<Either<Failure, CategorySaveResEntity>> saveCategory(
      CategorySaveReqModel reqEntity);
}
