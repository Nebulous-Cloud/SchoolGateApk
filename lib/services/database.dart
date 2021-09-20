import 'package:SchoolGate/models/user_asset.dart';
import 'package:SchoolGate/services/tokeniser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid });
  Tokeniser tokeniser = new Tokeniser();

  // reference a collection
  final CollectionReference tableCollection = FirebaseFirestore.instance.collection('asset');

  Future updateUserData(String name) async {
    return await tableCollection.doc(uid).set({
      'name' : name
    });
  }

  List<UserAsset> _userAssetFromSnapshot(QuerySnapshot snapshot) {
    List<UserAsset> assetsToFilter = snapshot.docs.map((doc){
      if (doc.id == uid) {
        return UserAsset (
          name: doc.get('name') ?? '',
          id: doc.id,
          studentName: doc.get('studentName') ?? '',
          timeslot: tokeniser.tokeniseToTimeslots(doc.get('timetable')),
          gradeslot: tokeniser.tokeniseToGradeslot(doc.get('grades')),
          scheduleslot: tokeniser.tokeniseToScheduleslot(doc.get('schedule'))
        );
      } else {
        return UserAsset(
        name: 'nill',
        timeslot: [],
        gradeslot: [],
        scheduleslot: []
        );
      }
    }).toList();
    List<UserAsset> correctAsset = [];
    for (int i = assetsToFilter.length - 1; i >= 0; i--) {
      if (assetsToFilter[i].name != 'nill') {
        correctAsset.add(assetsToFilter[i]);
      }
    }
    return correctAsset;
  }

  // stream
  Stream<List<UserAsset>> get userAsset {
    return tableCollection.snapshots().map((_userAssetFromSnapshot));
  }
}