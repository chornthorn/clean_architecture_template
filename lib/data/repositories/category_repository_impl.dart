import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:clean_architecture_templates/core/errors/exception.dart';
import 'package:clean_architecture_templates/core/errors/failure.dart';
import 'package:clean_architecture_templates/data/datasources/remote/category_remote_data_source.dart';
import 'package:clean_architecture_templates/data/models/category/category_save_req_model.dart';
import 'package:clean_architecture_templates/domain/entities/category_entity.dart';
import 'package:clean_architecture_templates/domain/entities/category_save_req_entity.dart';
import 'package:clean_architecture_templates/domain/entities/category_save_res_entity.dart';
import 'package:clean_architecture_templates/domain/repositories/category_repository.dart';

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
