import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:clean_architecture_templates/core/errors/failure.dart';
import 'package:clean_architecture_templates/core/usecases/usecase.dart';
import 'package:clean_architecture_templates/data/models/category/category_save_req_model.dart';
import 'package:clean_architecture_templates/domain/entities/category_entity.dart';
import 'package:clean_architecture_templates/domain/entities/category_save_req_entity.dart';
import 'package:clean_architecture_templates/domain/entities/category_save_res_entity.dart';
import 'package:clean_architecture_templates/domain/usecases/category/get_category_list_usecase.dart';
import 'package:clean_architecture_templates/domain/usecases/category/save_category_usecase.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc(
      {@required GetCategoryListUseCase getCategoryListUseCase,
      @required SaveCategoryListUseCase saveCategoryListUseCase})
      : assert(getCategoryListUseCase != null),
        assert(saveCategoryListUseCase != null),
        _getCategoryListUseCase = getCategoryListUseCase,
        _saveCategoryListUseCase = saveCategoryListUseCase,
        super(CategoryInitial());

  final GetCategoryListUseCase _getCategoryListUseCase;
  final SaveCategoryListUseCase _saveCategoryListUseCase;

  @override
  Stream<CategoryState> mapEventToState(
    CategoryEvent event,
  ) async* {
    if (event is GetCategoryListEvent) {
      yield CategoryLoading();
      final failureOrCategory = await _getCategoryListUseCase(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrCategory);
    }
    if (event is SaveCategoryEvent) {
      yield CategorySaving();
      CategorySaveReqEntity categorySaveReqModel =
          CategorySaveReqEntity(name: event.data.name);
      final failureOrCategory =
          await _saveCategoryListUseCase(categorySaveReqModel);
      yield* _eitherSaveOrErrorState(failureOrCategory);
      // yield failureOrCategory.fold(
      //   (l) => CategoryFailureState('error'),
      //   (r) => CategorySaveSuccess(r),
      // );
    }
  }

  Stream<CategoryState> _eitherLoadedOrErrorState(
      Either<Failure, List<CategoryEntity>> failureOrCategory) async* {
    yield failureOrCategory.fold(
      (l) => CategoryFailureState('error'),
      (r) => CategoryLoaded(r),
    );
  }

  Stream<CategoryState> _eitherSaveOrErrorState(
      Either<Failure, CategorySaveResEntity> failureOrCategory) async* {
    yield failureOrCategory.fold(
      (l) => CategoryFailureState('error'),
      (r) => CategorySaveSuccess(r),
    );
  }
}
