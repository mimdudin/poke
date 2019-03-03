import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../utils/loading_progress.dart';
import '../models/poke.dart';

class DetailsPoke extends StatelessWidget {
  final Poke poke;

  DetailsPoke(this.poke);

  // final Property property;

  // const DetailScreen(this.property);

//   _launchURL(BuildContext context, String url) async {
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
// //      throw 'Could not launch $url';
//       Scaffold.of(context).showSnackBar(SnackBar(content: Text("Can't Load: $url")));
//     }
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      // bottomNavigationBar: Container(
      //   color: Theme.of(context).primaryColor,
      //   child: Row(
      //     children: <Widget>[
      //       Expanded(
      //         child: Builder(
      //           builder: (context) => FlatButton.icon(
      //             onPressed: () {
      //               _launchURL(context, property.listerUrl);
      //             },
      //             icon: Icon(Icons.launch),
      //             label: Text("Visit Listing"),
      //             textColor: Colors.white,
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: IconButton(
            icon: Icon(Icons.keyboard_arrow_left, size: 40,),
            onPressed: () {
              Navigator.of(context).pop(context);
            },
          ),
            pinned: true,
            floating: false,
            expandedHeight: 256,
            backgroundColor: Colors.yellowAccent[100],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  // Image.network(
                  //   property.imgUrl,
                  //   fit: BoxFit.cover,
                  // ),
                  Hero(
                      tag: poke?.id,
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        height: 200,
                        placeholder: LoadingProgress(),
                        imageUrl: poke.img ?? "",
                        errorWidget: Container(
                            padding: EdgeInsets.all(20),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Container(
                                child: Icon(
                                  Icons.broken_image,
                                  color: Colors.deepOrange,
                                ),
                              ),
                            )),
                        fadeInCurve: Curves.fastOutSlowIn,
                      )),
                  // Container(
                  //   color: Colors.greenAccent,
                  // ),
                  // This gradient ensures that the toolbar icons are distinct
                  // against the background image.
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.0, -1.0),
                        end: Alignment(0.0, -0.4),
                        colors: <Color>[Color(0x60000000), Color(0x00000000)],
                      ),
                    ),
                  ),
                  // Positioned(
                  //   bottom: 20,
                  //   left: 0,
                  //   child: Container(
                  //     padding: const EdgeInsets.symmetric(
                  //         vertical: 8, horizontal: 16),
                  //     color: Color.fromRGBO(255, 255, 255, 0.5),
                  //     child: Row(
                  //       children: <Widget>[
                  //         Padding(
                  //           padding: const EdgeInsets.only(right: 8.0),
                  //           child: Icon(
                  //             FontAwesomeIcons.tag,
                  //             size: 20,
                  //             color: Theme.of(context).accentColor,
                  //           ),
                  //         ),
                  //         Text(
                  //           property.priceFormatted,
                  //           style: Theme.of(context).textTheme.title,
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 4.0),
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    poke.name ?? "Unknown",
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontSize: 20),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              SizedBox(width: 5),
                              Container(
                                child: Text(
                                  "Height: ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subhead
                                      .copyWith(fontSize: 13),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "15.0",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subhead
                                      .copyWith(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: <Widget>[
                              SizedBox(width: 5),
                              Container(
                                child: Text(
                                  "Weight: ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subhead
                                      .copyWith(fontSize: 13),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "22.0",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subhead
                                      .copyWith(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            child: Text(
                              "Skills:",
                              style: Theme.of(context)
                                  .textTheme
                                  .subhead
                                  .copyWith(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic),
                            ),
                          ),
                          SizedBox(height: 4),
                          Container(
                              child: Row(
                            children: <Widget>[
                              Container(
                                  padding: EdgeInsets.symmetric(horizontal: 4),
                                  child: Icon(
                                    FontAwesomeIcons.fireAlt,
                                    color: Colors.redAccent,
                                    size: 20,
                                  )),
                              Container(
                                  padding: EdgeInsets.symmetric(horizontal: 4),
                                  child: Icon(
                                    FontAwesomeIcons.feather,
                                    color: Colors.blueGrey,
                                    size: 20,
                                  )),
                              Container(
                                  padding: EdgeInsets.symmetric(horizontal: 4),
                                  child: Icon(
                                    FontAwesomeIcons.dove,
                                    color: Colors.blueAccent[100],
                                    size: 20,
                                  )),
                            ],
                          ))
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 4.0),
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "Summary",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle
                          .copyWith(fontSize: 15.0),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 5),
                      Icon(
                        FontAwesomeIcons.candyCane,
                        size: 15,
                        color: Colors.teal,
                      ),
                      SizedBox(width: 10),
                      Container(
                        child: Text(
                          "Candy Count: ",
                          style: Theme.of(context)
                              .textTheme
                              .subhead
                              .copyWith(fontSize: 13),
                        ),
                      ),
                      Container(
                        child: Text(
                          "22.0",
                          style: Theme.of(context).textTheme.subhead.copyWith(
                              fontSize: 13, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 5),
                      Icon(
                        FontAwesomeIcons.egg,
                        size: 15,
                        color: Colors.yellow,
                      ),
                      SizedBox(width: 10),
                      Container(
                        child: Text(
                          "Egg: ",
                          style: Theme.of(context)
                              .textTheme
                              .subhead
                              .copyWith(fontSize: 13),
                        ),
                      ),
                      Container(
                        child: Text(
                          "18 Km",
                          style: Theme.of(context).textTheme.subhead.copyWith(
                              fontSize: 13, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 5),
                      Icon(
                        FontAwesomeIcons.spa,
                        size: 15,
                        color: Colors.indigoAccent,
                      ),
                      SizedBox(width: 10),
                      Container(
                        child: Text(
                          "Spawn Chance: ",
                          style: Theme.of(context)
                              .textTheme
                              .subhead
                              .copyWith(fontSize: 13),
                        ),
                      ),
                      Container(
                        child: Text(
                          "1.36",
                          style: Theme.of(context).textTheme.subhead.copyWith(
                              fontSize: 13, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 5),
                      Icon(
                        FontAwesomeIcons.route,
                        size: 15,
                        color: Colors.lime,
                      ),
                      SizedBox(width: 10),
                      Container(
                        child: Text(
                          "Average Spawns: ",
                          style: Theme.of(context)
                              .textTheme
                              .subhead
                              .copyWith(fontSize: 13),
                        ),
                      ),
                      Container(
                        child: Text(
                          "136",
                          style: Theme.of(context).textTheme.subhead.copyWith(
                              fontSize: 13, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 5),
                      Icon(
                        Icons.timelapse,
                        size: 15,
                        color: Colors.blueGrey,
                      ),
                      SizedBox(width: 10),
                      Container(
                        child: Text(
                          "Spawn Time: ",
                          style: Theme.of(context)
                              .textTheme
                              .subhead
                              .copyWith(fontSize: 13),
                        ),
                      ),
                      Container(
                        child: Text(
                          "01:51",
                          style: Theme.of(context).textTheme.subhead.copyWith(
                              fontSize: 13, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 5),
                      Icon(
                        FontAwesomeIcons.handPointer,
                        size: 15,
                        color: Colors.cyan,
                      ),
                      SizedBox(width: 10),
                      Container(
                        child: Text(
                          "Multipliers: ",
                          style: Theme.of(context)
                              .textTheme
                              .subhead
                              .copyWith(fontSize: 13),
                        ),
                      ),
                      Container(
                        child: Text(
                          "1.63",
                          style: Theme.of(context).textTheme.subhead.copyWith(
                              fontSize: 13, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(child: Text(", ")),
                      Container(
                        child: Text(
                          "2.48",
                          style: Theme.of(context).textTheme.subhead.copyWith(
                              fontSize: 13, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 5),
                      Icon(
                        FontAwesomeIcons.starHalfAlt,
                        size: 15,
                        color: Colors.amber,
                      ),
                      SizedBox(width: 10),
                      Container(
                        child: Text(
                          "Weakness: ",
                          style: Theme.of(context)
                              .textTheme
                              .subhead
                              .copyWith(fontSize: 13),
                        ),
                      ),
                      Container(
                        child: Text(
                          "Ground",
                          style: Theme.of(context).textTheme.subhead.copyWith(
                              fontSize: 13, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(child: Text(", ")),
                      Container(
                        child: Text(
                          "Physics",
                          style: Theme.of(context).textTheme.subhead.copyWith(
                              fontSize: 13, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 5),
                      Icon(
                        FontAwesomeIcons.leaf,
                        size: 15,
                        color: Colors.lightGreen,
                      ),
                      SizedBox(width: 10),
                      Container(
                        child: Text(
                          "Next Evolution: ",
                          style: Theme.of(context)
                              .textTheme
                              .subhead
                              .copyWith(fontSize: 13),
                        ),
                      ),
                      Container(
                        child: Text(
                          "Nidorina",
                          style: Theme.of(context).textTheme.subhead.copyWith(
                              fontSize: 13, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(child: Text(", ")),
                      Container(
                        child: Text(
                          "Nidoqueen",
                          style: Theme.of(context).textTheme.subhead.copyWith(
                              fontSize: 13, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]))
        ],
      ),
    );
  }
}
