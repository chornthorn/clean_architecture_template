import 'package:get_it/get_it.dart';
import 'package:clean_architecture_templates/core/networks/http.dart';
import 'package:clean_architecture_templates/data/datasources/remote/category_remote_data_source.dart';
import 'package:clean_architecture_templates/data/repositories/category_repository_impl.dart';
import 'package:clean_architecture_templates/domain/repositories/category_repository.dart';
import 'package:clean_architecture_templates/domain/usecases/category/get_category_list_usecase.dart';
import 'package:clean_architecture_templates/domain/usecases/category/save_category_usecase.dart';
import 'package:clean_architecture_templates/view/blocs/category/category_bloc.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  // core
  sl.registerLazySingleton(() => CustomHttp());
  // blocs
  sl.registerLazySingleton(
    () => CategoryBloc(
      getCategoryListUseCase: sl(),
      saveCategoryListUseCase: sl(),
    ),
  );

  // use case
  sl.registerLazySingleton(() => GetCategoryListUseCase(sl()));
  sl.registerLazySingleton(() => SaveCategoryListUseCase(sl()));

  // repository
  sl.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(categoryRemoteDataSource: sl()),
  );

  // data
  sl.registerLazySingleton<CategoryRemoteDataSource>(
    () => CategoryRemoteDataSourceImpl(customHttp: sl()),
  );
}
