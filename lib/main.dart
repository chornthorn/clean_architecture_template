import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_architecture_templates/view/blocs/bloc_observer.dart';
import 'injection/container_injection.dart' as di;
import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  Bloc.observer = AppBlocObserver();
  runApp(AppIndex());
}
