import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection/container_injection.dart';
import 'view/blocs/category/category_bloc.dart';
import 'view/pages/category/category_page.dart';

class AppIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: BlocProvider<CategoryBloc>(
        child: CategoryPage(),
        create: (context) => sl<CategoryBloc>(),
      ),
    );
  }
}
