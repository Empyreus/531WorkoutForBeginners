import 'package:for_beginners_531/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:for_beginners_531/services/database.dart';
import 'package:provider/provider.dart';
import 'package:for_beginners_531/screens/home/weight_list.dart';
import 'package:for_beginners_531/models/weight.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Weight>>.value(
      value: DatabaseService().weights,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Brew Crew'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],
        ),
        body: WeightList()
      ),
    );
  }
}