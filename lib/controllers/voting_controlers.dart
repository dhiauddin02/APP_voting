import 'package:get/get.dart';

class VotingController extends GetxController {
  RxInt totalVoting = 0.obs;
  RxBool disabledNext = false.obs;
  RxBool disabledVoting = true.obs;

  RxList<RxMap<String, dynamic>> dataVoting = [
    {'nama': 'Irwansyah', 'suara': 0, 'foto': 'assets/calon1.jpg'}.obs,
    {'nama': 'Zulfahmi', 'suara': 0, 'foto': 'assets/calon2.jpg'}.obs,
    {'nama': 'Muhammad Ilham', 'suara': 0, 'foto': 'assets/calon3.jpg'}.obs,
  ].obs;

  void countTotal() {
    totalVoting++;
  }
}
