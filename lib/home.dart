import 'package:flutter/material.dart';
import 'dart:async';
import 'package:scoped_model/scoped_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

import './services/poke_service.dart';
import './models/poke.dart';
import './utils/loading_progress.dart';
import './utils/no_poke_found.dart';
import './screens/poke_list_item.dart';

class Home extends StatefulWidget {
  final PokeService model;

  Home(this.model);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();

    loadData();
  }

  Future loadData() async {
    await widget.model.fetchPoke();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<PokeService>(
      builder: (context, child, model) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Poke",
              // style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          body: Container(
              child: model.isLoading
                  ? Center(
                      child: LoadingProgressList(),
                    )
                  : _buildPokeList(model)),
        );
      },
    );
  }

  Widget _buildPokeList(PokeService model) {
    return model.getPokeCount() == 0
        ? NoPokeFound()
        : ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: model.pokeList == null ? 0 : model.getPokeCount(),
            itemBuilder: (context, i) {
              var poke = model.pokeList[i];
              return PokeListItem(poke);
            },
          );
  }
}
