import 'package:dartz/dartz.dart';

import '../../../core/core.dart';
import '../../domain.dart';

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
