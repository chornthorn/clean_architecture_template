import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/domain.dart';
import '../../blocs/blocs.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController categoryName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // BlocListener<CategoryBloc, CategoryState>(
            //   listener: (context, state) {
            //     if (state is CategorySaveSuccess) {
            //       Scaffold.of(context).showSnackBar(
            //         new SnackBar(
            //           content: new Text('Save Successfully!'),
            //           backgroundColor: Colors.green,
            //         ),
            //       );
            //     }
            //   },
            //   child: BlocBuilder<CategoryBloc, CategoryState>(
            //       builder: (context, state) {
            //     if (state is CategoryLoading) {
            //       return Center(child: CircularProgressIndicator());
            //     }
            //     if (state is CategoryLoaded) {
            //       return ListView.builder(
            //         shrinkWrap: true,
            //         physics: NeverScrollableScrollPhysics(),
            //         itemCount: state.categoryEntity.length,
            //         itemBuilder: (context, index) {
            //           var data = state.categoryEntity[index];
            //           return ListTile(
            //             title: Text(data.name),
            //             onLongPress: () {},
            //           );
            //         },
            //       );
            //     }
            //     return Container();
            //   }),
            // ),
            BlocConsumer<CategoryBloc, CategoryState>(
              listener: (context, state) {
                if (state is CategorySaveSuccess) {
                  Scaffold.of(context).showSnackBar(
                    new SnackBar(
                      content: new Text('Save Successfully!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(child: CircularProgressIndicator()),
                    ],
                  );
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
                        onLongPress: () {},
                      );
                    },
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          categoryName.clear();
          _buildFormCategory(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _buildFormCategory(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Positioned(
                right: -40.0,
                top: -40.0,
                child: InkResponse(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: CircleAvatar(
                    child: Icon(Icons.close),
                    backgroundColor: Colors.red,
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: TextFormField(
                          controller: categoryName,
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              hintText: 'Category name',
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        color: Colors.blue,
                        child: Text(
                          "Save",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _saveCategory();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _saveCategory() {
    CategorySaveReqEntity data = CategorySaveReqEntity();
    data.name = categoryName.text;
    BlocProvider.of<CategoryBloc>(context).add(
      SaveCategoryEvent(data: data),
    );
    Navigator.of(context).pop();

    BlocProvider.of<CategoryBloc>(context).add(GetCategoryListEvent());
  }
}
