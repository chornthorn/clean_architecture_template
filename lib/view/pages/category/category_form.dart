import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/category_save_req_entity.dart';
import '../../blocs/category/category_bloc.dart';

class CategoryFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Category'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(),
            Container(
              padding: EdgeInsets.only(top: 50),
              child: FlatButton(
                onPressed: () {
                  CategorySaveReqEntity data = CategorySaveReqEntity();
                  data.name = "jkhkjjkhg";
                  BlocProvider.of<CategoryBloc>(context).add(
                    SaveCategoryEvent(data: data),
                  );
                },
                child: Text('Add'),
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
