import 'package:get/get.dart';
import 'package:mybills_app/model/data_model.dart';
import '../services/data_services.dart';

class Datacontroller extends GetxController {
  RxList<DataModel> list= <DataModel>[].obs;
  final service = Dataservices();
  var loading = false.obs;

  get Loading => loading.value;
  

  @override
  void onInit() {
    super.onInit();
    loaddata();
  }

  get newlist => list.where((e) => e.status==0?false:true).map((e) => e).toList();
  

  loaddata() async {
    loading.value;
    try {
      var info = service.getUsers();
      list.addAll(await info);
    } catch (e) {
      print('encounter error');
      print(e);
    } finally {
      loading.value = true;
    }
  }
}
