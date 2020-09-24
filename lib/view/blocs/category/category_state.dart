part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();
}

class CategoryInitial extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryLoading extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryLoaded extends CategoryState {
  final List<CategoryEntity> categoryEntity;

  CategoryLoaded(this.categoryEntity);
  @override
  List<Object> get props => [categoryEntity];
}

class CategoryFailureState extends CategoryState {
  final String message;

  CategoryFailureState(this.message);

  @override
  List<Object> get props => [];
}

class CategorySaving extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategorySaveSuccess extends CategoryState {
  final CategorySaveResEntity categorySaveResEntity;

  CategorySaveSuccess(this.categorySaveResEntity);
  @override
  List<Object> get props => [categorySaveResEntity];
}
