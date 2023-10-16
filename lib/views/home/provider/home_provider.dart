import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:traker_app/services/shared_preferences_static.dart';

class HomeProvider extends ChangeNotifier {

  var collectionStatus = FirebaseFirestore.instance.collection("status");

  HomeProvider(){
    listenStatus();
  }

  bool _statusCar = true;
  bool get statusCar => _statusCar;
  set statusCar(bool value){
    _statusCar = value;
    notifyListeners();
  }

  Future listenStatus() async{

    if(SharedPreferencesLocal.trakerIdFirebase.isEmpty){

      var data = await collectionStatus.limit(1).get();
      if (data.size == 0) {
        collectionStatus.add({'status': true});
      }

      collectionStatus.snapshots().listen((event) {
        print(event);
      });
    }
  }

  Future updateStatus({required bool value}) async {
    // collectionStatus.doc('nuqIzxsdwu7Q7q1WCtYa').update({
    //   'title': titleController.text,
    //   'content': contentController.text
    // });
  }


}