import 'package:campus/models/student_list_model/student_list_model.dart';
import 'package:campus/screens/home/ui_state.dart';
import 'package:campus/services/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stdentsListProvider =
    StateNotifierProvider<HomeNotifier, UiState<List<StudentListModel>>>((ref) {
  return HomeNotifier();
});

class HomeNotifier extends StateNotifier<UiState<List<StudentListModel>>> {
  HomeNotifier() : super(UiState.initial()) {
    init();
  }

  init({pageKey}) async {
    Client _client = Client();

    var _endpointProvider = StudentsService(_client.init());
    List<StudentListModel> data = await _endpointProvider.fetchAll();
    state = UiState.loaded(data);
    // print(data);

    // return data;
  }
}
