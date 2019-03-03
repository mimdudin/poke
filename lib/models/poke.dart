class Poke {
  dynamic id, candyCount, spawnChance, avgSpawns;
  String name, nuM, img, height, weight, candy, egg, spawnTime;
  List<dynamic> type, weaknesses;
  List<dynamic> multipliers;
  List<NextEvolution> nextEvo;

  Poke(
      {this.id,
      this.nuM,
      this.candyCount,
      this.spawnChance,
      this.avgSpawns,
      this.name,
      this.img,
      this.height,
      this.weight,
      this.candy,
      this.egg,
      this.spawnTime,
      this.type,
      this.weaknesses,
      this.multipliers,
      this.nextEvo});

  factory Poke.fromJson(Map<String, dynamic> json) {
    return Poke(
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
  }
}

class NextEvolution {
  String nuM, name;

  NextEvolution({this.nuM, this.name});

  factory NextEvolution.fromJson(Map<String, dynamic> json) {
    return NextEvolution(
      nuM: json['num'],
      name: json['name'],
    );
  }
}

//  {
//             "id": 1,
//             "num": "001",
//             "name": "Bulbasaur",
//             "img": "http://www.serebii.net/pokemongo/pokemon/001.png",
//             "type": [
//                 "Grass",
//                 "Poison"
//             ],
//             "height": "0.71 m",
//             "weight": "6.9 kg",
//             "candy": "Bulbasaur Candy",
//             "candy_count": 25,
//             "egg": "2 km",
//             "spawn_chance": 0.69,
//             "avg_spawns": 69,
//             "spawn_time": "20:00",
//             "multipliers": [
//                 1.58
//             ],
//             "weaknesses": [
//                 "Fire",
//                 "Ice",
//                 "Flying",
//                 "Psychic"
//             ],
//             "next_evolution": [
//                 {
//                     "num": "002",
//                     "name": "Ivysaur"
//                 },
//                 {
//                     "num": "003",
//                     "name": "Venusaur"
//                 }
//             ]
//         },
