import 'package:aplikasi_voting/controllers/voting_controlers.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class widgetVoting extends StatelessWidget {
  VotingController votingC = Get.find();
  String? nama;
  String? foto;
  int jumlah;
  bool isHidden;
  bool isHiddenVote;

  widgetVoting(
      {required this.nama,
      required this.foto,
      required this.jumlah,
      required this.isHidden,
      required this.isHiddenVote});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                image: AssetImage('$foto'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20)),
        ),
        SizedBox(
          height: 20,
        ),
        Obx(() => Visibility(
              visible: isHiddenVote,
              child: Text(
                '${votingC.dataVoting[jumlah]['suara']}',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )),
        SizedBox(
          height: 20,
        ),
        Text(
          '$nama',
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          height: 10,
        ),
        Obx(() => Visibility(
              visible: isHidden,
              child: ElevatedButton(
                  onPressed: votingC.disabledVoting.value
                      ? () {
                          votingC.dataVoting[jumlah]['suara']++;

                          print(jumlah);
                          votingC.disabledVoting.toggle();
                          votingC.disabledNext.toggle();
                          votingC.countTotal();
                        }
                      : null,
                  child: Text('pilih')),
            ))
      ],
    );
  }
}
