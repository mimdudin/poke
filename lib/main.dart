import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './home.dart';
import './services/poke_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PokeService model = PokeService();
    return ScopedModel(
      model: model,
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        home: Home(model),
      ),
    );
  }
}
