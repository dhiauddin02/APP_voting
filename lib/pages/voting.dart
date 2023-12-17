import 'dart:html';

import 'package:aplikasi_voting/controllers/voting_controlers.dart';
import 'package:aplikasi_voting/pages/hasil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../widgets/voteUser.dart';

class VotingPage extends StatelessWidget {
  VotingController votingC = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 134, 33, 26),
        leading: Padding(
          padding: const EdgeInsets.all(5),
          child: Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/logopolicy.png'))),
          ),
        ),
        title: Text('Voting Ketua Umum Policy Periode 2022-2023'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  //scrollDirection: Axis.horizontal,
                  itemCount: votingC.dataVoting.length,
                  itemBuilder: ((context, index) => Obx(() => widgetVoting(
                        nama: votingC.dataVoting[index]['nama'],
                        foto: votingC.dataVoting[index]['foto'],
                        jumlah: index,
                        isHidden: true,
                        isHiddenVote: false,
                      )))),
            ),
            SizedBox(
              height: 120,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Obx(() => Text(
                          '${votingC.totalVoting}',
                          style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                    Text(
                      'Total Voting',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.defaultDialog(
                        title: 'Warning!',
                        middleText: 'Apakah Anda Yakin Ingin Menutup Voting?',
                        textConfirm: 'yes',
                        textCancel: 'cancel',
                        onConfirm: () => Get.offAll(HasilPage()));
                  },
                  child: Text('Tutup voting'),
                  style: ElevatedButton.styleFrom(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(0)),
                ),
                Obx(() => ElevatedButton(
                    onPressed: votingC.disabledNext.isTrue
                        ? () {
                            votingC.disabledVoting.toggle();
                            votingC.disabledNext.toggle();
                          }
                        : null,
                    child: Text('voting next >>'))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
