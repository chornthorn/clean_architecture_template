import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../core/core.dart';
import '../../domain/domain.dart';
import '../datasources/datasources.dart';
import '../models/models.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  final CategoryRemoteDataSource categoryRemoteDataSource;

  CategoryRepositoryImpl({@required this.categoryRemoteDataSource});
  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      final category = await categoryRemoteDataSource.getCategoryList();
      return Right(category);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, CategorySaveResEntity>> saveCategory(
      CategorySaveReqModel reqEntity) async {
    try {
      final category = await categoryRemoteDataSource.saveCategory(reqEntity);
      return Right(category);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
