import 'package:SchoolGate/screens/home/tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:SchoolGate/models/user_asset.dart';

class AssetList extends StatefulWidget {
  const AssetList({ Key? key }) : super(key: key);

  @override
  _AssetListState createState() => _AssetListState();
}

class _AssetListState extends State<AssetList> {
  @override
  Widget build(BuildContext context) {

    // final AuthService _auth = AuthService();

    final assets = Provider.of<List<UserAsset>>(context);
    UserAsset currentAsset = new UserAsset(timeslot: []);
    assets.forEach((asset) {
      currentAsset = asset;
    });
    return ListView.builder(
      itemCount: currentAsset.timeslot.length,
      itemBuilder: (context, index) {
        return Tile(slot: currentAsset.timeslot[index]);
      });
  }
}