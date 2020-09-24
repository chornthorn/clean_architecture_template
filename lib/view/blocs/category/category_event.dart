part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();
}

class GetCategoryListEvent extends CategoryEvent {
  @override
  List<Object> get props => [];
}

class SaveCategoryEvent extends CategoryEvent {
  final CategorySaveReqEntity data;

  SaveCategoryEvent({this.data});
  @override
  List<Object> get props => [data];
}