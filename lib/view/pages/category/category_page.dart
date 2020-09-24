import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_architecture_templates/injection/container_injection.dart';
import 'package:clean_architecture_templates/view/blocs/category/category_bloc.dart';

import 'category_form.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
              if (state is CategoryLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is CategoryLoaded) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: state.categoryEntity.length,
                  itemBuilder: (context, index) {
                    var data = state.categoryEntity[index];
                    return ListTile(
                      title: Text(data.name),
                    );
                  },
                );
              }
              return Container();
            }),
            Container(
              child: FlatButton(
                  onPressed: () {
                    BlocProvider.of<CategoryBloc>(context)
                        .add(GetCategoryListEvent());
                  },
                  child: Text('Get all data')),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          MaterialPageRoute route = MaterialPageRoute(
              builder: (context) => BlocProvider<CategoryBloc>(
                    create: (context) => sl<CategoryBloc>(),
                    child: CategoryFormPage(),
                  ));
          Navigator.push(context, route);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
