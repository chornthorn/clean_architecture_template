import 'package:dartz/dartz.dart';

import '../../../core/core.dart';
import '../../entities/entities.dart';
import '../../repositories/repositories.dart';

class GetCategoryListUseCase
    implements UseCase<List<CategoryEntity>, NoParams> {
  final CategoryRepository repository;

  GetCategoryListUseCase(this.repository);
  @override
  Future<Either<Failure, List<CategoryEntity>>> call(NoParams params) async {
    return await repository.getCategories();
  }
}
