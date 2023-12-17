import 'package:aplikasi_voting/controllers/voting_controlers.dart';
import 'package:aplikasi_voting/widgets/voteUser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HasilPage extends StatelessWidget {
  VotingController votingC = Get.find();

  @override
  Widget build(BuildContext context) {
    VotingController votingC = Get.find();
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 134, 33, 26),
          title: Text('Hasil Voting'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Center(
              child: Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  //scrollDirection: Axis.horizontal,
                  itemCount: votingC.dataVoting.length,
                  itemBuilder: ((context, index) => Obx(() => widgetVoting(
                        nama: votingC.dataVoting[index]['nama'],
                        foto: votingC.dataVoting[index]['foto'],
                        jumlah: index,
                        isHidden: false,
                        isHiddenVote: true,
                      )))),
            ),
          ),
        ));
  }
}
