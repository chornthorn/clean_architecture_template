import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../core/core.dart';
import '../../domain/domain.dart';
import '../datasources/datasources.dart';
import '../models/models.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  final CategoryRemoteDataSource _categoryRemoteDataSource;

  CategoryRepositoryImpl(
      {@required CategoryRemoteDataSource categoryRemoteDataSource})
      : assert(categoryRemoteDataSource != null),
        _categoryRemoteDataSource = categoryRemoteDataSource;

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      final category = await _categoryRemoteDataSource.index();
      return Right(category);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, CategorySaveResEntity>> saveCategory(
      CategorySaveReqModel reqEntity) async {
    try {
      final category = await _categoryRemoteDataSource.store(reqEntity);
      return Right(category);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, CategoryDeleteResEntity>> deleteCategory(
      CategoryDeleteReqModel reqEntity) async {
    try {
      final result = await _categoryRemoteDataSource.delete(reqEntity);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
