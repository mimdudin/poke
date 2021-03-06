import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitThreeBounce(
        color: Colors.tealAccent,
        size: 15,
      ),
    );
  }
}

class LoadingProgressList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitThreeBounce(
        color: Colors.teal[500],
        size: 40,
      ),
    );
  }
}
