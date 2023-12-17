import 'package:aplikasi_voting/controllers/voting_controlers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './pages/voting.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final votingC = Get.put(VotingController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: VotingPage(),
    );
  }
}
