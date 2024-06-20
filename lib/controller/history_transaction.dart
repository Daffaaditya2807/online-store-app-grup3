import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:online_app_final_project/model/transaction_history.dart';

class HistoryTransaction extends GetxController {
  var historyTrans = <HistoryTransaksiModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchTransactionHistory();
  }

  void fetchTransactionHistory() async {
    final databaseReference =
        FirebaseDatabase.instance.ref().child('transactionHistory');
    databaseReference.once().then((DatabaseEvent event) {
      List<HistoryTransaksiModel> temphHistory = [];
      final dataSnapshot = event.snapshot;
      if (dataSnapshot.value != null) {
        Map<dynamic, dynamic> values =
            dataSnapshot.value as Map<dynamic, dynamic>;
        var sortedEntries = values.entries.toList()
          ..sort((a, b) => b.key.compareTo(a.key));
        sortedEntries.forEach((entry) {
          var value = entry.value;
          if (value['uid'] == "3i3wEYEYMvVCz9X6V09RXF7eljz1") {
            temphHistory.add(HistoryTransaksiModel.fromJson(
                Map<String, dynamic>.from(value)));
          }
        });
      }
      historyTrans.value = temphHistory;
    });
  }
}
