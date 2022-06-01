// import 'package:campus/models/student_list_model/student_list_model.dart';
import 'package:campus/models/student_list_model.dart';
// import 'package:campus/models/student_list_model/student_list_model.dart';
import 'package:campus/screens/home/ui_state.dart';
import 'package:campus/services/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final attendedCountProvider = Provider<int>((ref) {
  var count = ref.watch(stdentsListProvider);

  return ref.watch(stdentsListProvider).where((e) => e.isAttende!).length;
});

final notAttendedCountProvider = Provider<int>((ref) {
  var count = ref.watch(stdentsListProvider);

  return ref.watch(stdentsListProvider).where((e) => !e.isAttende!).length;
});
final stdentsListProvider =
    StateNotifierProvider<HomeNotifier, List<StudentListModel>>((ref) {
  return HomeNotifier();
});

class HomeNotifier extends StateNotifier<List<StudentListModel>> {
  HomeNotifier() : super([]) {
    init();
  }
  List<StudentListModel> data = [];

  init({pageKey}) async {
    Client _client = Client();

    var _endpointProvider = StudentsService(_client.init());
    data = await _endpointProvider.fetchAll();
    state = [...data];
    // state = UiState.loaded(data);
    // print(data);

    // return data;
  }

  edit({required id, required bool? isAttende}) {
    state = [
      for (final std in state)
        if (std.id == id)
          // print('they are the same ');
          std.copyWith(isAttende: isAttende)
        else
          std,
    ];

    // state = UiState.loaded(data);
  }
}
