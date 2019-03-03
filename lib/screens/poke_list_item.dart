import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/poke.dart';
import '../pages/details_poke.dart';
import '../utils/loading_progress.dart';

class PokeListItem extends StatelessWidget {
  final Poke poke;

  PokeListItem(this.poke);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Card(
          elevation: 2.0,
          color: Colors.white,
          // margin: EdgeInsets.all(5.0),
          child: ListTile(
              title: Text(
                poke.name ?? "Unknown",
                style: Theme.of(context).textTheme.title.copyWith(fontSize: 15),
              ),
              leading: Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[100], width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  child: CircleAvatar(
                    child: ClipOval(
                      child: Hero(
                          tag: poke?.id,
                          child: CachedNetworkImage(
                            width: 40.0,
                            height: 40.0,
                            fit: BoxFit.cover,
                            placeholder: LoadingProgress(),
                            imageUrl: poke.img ?? "",
                            errorWidget: Container(
                                height: 50,
                                width: 50,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    child: Icon(
                                      Icons.broken_image,
                                      size: 50,
                                      color: Colors.deepOrange,
                                    ),
                                  ),
                                )),
                            fadeInCurve: Curves.fastOutSlowIn,
                          )),
                    ),
                  )),
              subtitle: Text(
                poke.candy ?? "Unknown",
                style:
                    Theme.of(context).textTheme.caption.copyWith(fontSize: 13),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    poke.candyCount.toString() == "null" ||
                            poke.candyCount.toString() == "" ||
                            poke.candyCount.toString() == null
                        ? "-"
                        : poke.candyCount.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .subtitle
                        .copyWith(fontSize: 14),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    FontAwesomeIcons.candyCane,
                    size: 13,
                    color: Colors.teal,
                  ),
                ],
              )),
        ),
      ),
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => DetailsPoke(poke))),
    );
  }
}
