import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import '../models/poke.dart';
import '../utils/constant.dart';

class PokeService extends Model {
  List<Poke> _pokeList = [];
  List<Poke> get pokeList => _pokeList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  int getPokeCount() {
    return _pokeList.length;
  }

  void addPokeToList(Poke poke) {
    return _pokeList.add(poke);
  }

  Future<List<Poke>> fetchPoke() async {
    _isLoading = true;
    notifyListeners();

    var response = await http.get(Constant.baseUrl);

    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body)['pokemon'];

      for (var json in responseBody) {
        print(json);

        var poke = new Poke(
          id: json['id'],
          nuM: json['num'],
          candyCount: json['candy_count'],
          spawnChance: json['spawn_chance'],
          avgSpawns: json['avg_spawns'],
          name: json['name'],
          img: json['img'],
          height: json['height'],
          weight: json['weight'],
          candy: json['candy'],
          egg: json['egg'],
          spawnTime: json['spawn_time'],
          type: json['type'],
          weaknesses: json['weakness'],
          multipliers: json['multipliers'],
          // nextEvo: NextEvolution.fromJson(json['next_evolution'])
        );

        addPokeToList(poke);

        _isLoading = false;
        notifyListeners();
      }
    } else {
      _isLoading = false;
      notifyListeners();
      throw Exception('failed to load data');
    }

    return _pokeList;
  }
}
