import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_architecture_templates/view/blocs/category/category_bloc.dart';
import 'package:clean_architecture_templates/view/pages/category/category_page.dart';

import 'injection/container_injection.dart';

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
