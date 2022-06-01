import 'dart:async';
import 'package:campus/models/student_list_model.dart';
import 'package:campus/screens/home/student_model/student_model.dart';
import 'package:open_file/open_file.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:campus/data/constants.dart';
import 'package:campus/screens/home_screen/fragments/file_reader.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:excel/excel.dart';

import 'package:campus/helpers/helpers.dart';
// import 'package:campus/models/student_list_model/student_list_model.dart';
import 'package:campus/screens/home_screen/fragments/students_fragment_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:swipe_refresh/swipe_refresh.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as xls;

class ViewStudentsFragment extends HookConsumerWidget {
  ViewStudentsFragment({Key? key}) : super(key: key);
  final _controller = StreamController<SwipeRefreshState>.broadcast();

  Stream<SwipeRefreshState> get _stream => _controller.stream;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var students = ref.watch(stdentsListProvider);
    var count = ref.watch(attendedCountProvider);
    var notAttende = ref.watch(notAttendedCountProvider);

    Future<void> _refresh() async {
      await Future<void>.delayed(const Duration(seconds: 3));
      // when all needed is done change state
      ref.refresh(stdentsListProvider);
      _controller.sink.add(SwipeRefreshState.hidden);
    }

    return Scaffold(
      body: CustomScrollView(
        primary: true,
        slivers: <Widget>[
          SliverAppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    ref.refresh(stdentsListProvider);
                  },
                  icon: const Icon(Icons.refresh)),
            ],
            title: Text('Students Attendance'),
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text("الحضور"),
                    Text(count.toString()),
                  ],
                ),
                Column(
                  children: [
                    Text("الغياب"),
                    Text(notAttende.toString()),
                  ],
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              width: getSize(context).width,
              height: getSize(context).height,
              child: ListView(
                  children: students
                      .map(
                        (e) => ProviderScope(
                          overrides: [
                            _currentStudent.overrideWithValue(e),
                          ],
                          child: StudentsAttendanceCard(e: e),
                        ),
                      )
                      .toList()),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("تسجيل حضور الطلبة"),
        onPressed: () {
          // print('clicked');

          /// ! creating excel file firstly
          var excel = Excel
              .createExcel(); // automatically creates 1 empty sheet: Sheet1

          Sheet sheetObject = excel['attendance of second stage'];

          var val = ref.watch(stdentsListProvider);
          genrateFile(val);
          // val.whenOrNull(
          //   loaded: (valu) async {
          //     // print('main');
          //     // print(valu);
          //     List<StudentListModel> data = valu;
          //     genrateFile(data);

          //     // print(data);

          //     //  valu.forEach((val) {
          //     //   var v = val as StudentListModel;
          //     // sheet.
          //     // });

          //     // valu.asMap().map((e) {
          //     //   var index = sheet.getLastRow();
          //     // });

          //     // print(data);
          //     // var cell = sheetObject.cell(CellIndex.indexByString("A1"));

          //     // final directory = await getApplicationDocumentsDirectory();

          //     // final path = await directory.path;
          //     // final file = File('$path/filename.xlsx');

          //     // file.writeAsBytes(excel.encode() as List<int>);
          //     // print(path);
          //     // OpenFile.open(path);
          //     // hpush(
          //     //   context,
          //     //   FileReaderPage(
          //     //     filePath: path,
          //     //   ),
          //     // );
          //   },
          // );

          // dynamic values support provided;
        },
      ),
    );
  }
}

genrateFile(List<StudentListModel> list) async {
  final xls.Workbook workbook = xls.Workbook(1);
  final xls.Worksheet sheet = workbook.worksheets[0];
  sheet.isRightToLeft = true;
//Display the workbook in Right-To-Left direction.
  workbook.isRightToLeft = true;

  sheet.getRangeByName('A3').setText(' اسم الطالب الرباعي واللقب');
  sheet.getRangeByName('B3').setText('حالة الحضور');
  final xls.Range range1 = sheet.getRangeByName('A1:E1');
  range1.merge();
  final xls.Range range2 = sheet.getRangeByName('A2:E2');
  range2.merge();
  sheet.getRangeByName('a1').setText('غيابات وحضور الطلبة');
  sheet.getRangeByName('a2').setText('يوم الاربعاء ٢٠٢٠ - ٥ - ٢٥');
  range1.cellStyle.hAlign = xls.HAlignType.center;
  range2.cellStyle.hAlign = xls.HAlignType.center;

  list.asMap().entries.map((e) {
    int idx = e.key;
    StudentListModel val = e.value;
    // print(idx);
    sheet.getRangeByName('A1').columnWidth = 25;
    sheet.getRangeByName('B1').columnWidth = 12;

    // sheet.getRangeByName('A1').setText('غيابات وحضور الطلبة ')
    sheet.getRangeByName('A${(idx + 4)}').setText(
        '${val.firstName} ${val.secondName} ${val.thirdName} ${val.forthName} ${val.family}');

    sheet
        .getRangeByName('B${(idx + 4)}')
        .setText((val.isAttende!) ? "حاضر" : "غائب");
  }).toList();
  final List<int> bytes = workbook.saveAsStream();
  print('workbook');
  final directory = await getApplicationDocumentsDirectory();

  final Future<File> file =
      File('${directory.path}/noaman.xlsx').writeAsBytes(bytes);
  // print(file);
  print(directory.path);
  try {
    await OpenFile.open('${directory.path}/noaman.xlsx').catchError((err) {
      print('Error: $err'); // Prints 401.
    });
  } catch (e) {
    print(e);
  }
  workbook.dispose();
}

final _currentStudent =
    Provider<StudentListModel>((ref) => throw UnimplementedError());
// // final _currentStudentNotifier = StateNotifierProvider((ref) {
// //   return StudentListModel();
// // });
// final counterStateProvider = StateNotifierProvider<StudentListModel>((ref) {
//   throw UnimplementedError();
// });

class StudentsAttendanceCard extends ConsumerWidget {
  final StudentListModel e;
  StudentsAttendanceCard({
    Key? key,
    required this.e,
  }) : super(key: key);
  bool value = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final student = ref.watch(_currentStudent);
    print('StudentsAttendanceCard rebuilded');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: getSize(context).width,
        // height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Consumer(
              //   builder: (context, ref, child) {
              //     bool isChecked = false;
              //     return StatefulBuilder(
              //       builder: (BuildContext context, StateSetter setState) =>

              //     );
              //   },
              // ),
              Checkbox(
                value: student.isAttende,
                onChanged: (value) {
                  // setState(() {
                  //   isChecked = value!;

                  var val = ref
                      .read(stdentsListProvider.notifier)
                      .edit(id: student.id, isAttende: value);

                  print(val);
                  // }

                  // );
                },
              ),
              Expanded(
                  child: Text("${student.firstName} ${student.secondName}",
                      style: const TextStyle(fontSize: 20))),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor),
                  shape: BoxShape.circle,
                  // image: DecorationImage(
                  //     // image: CachedNetworkImageProvider(
                  //     //   workingUrl + student..toString(),
                  //     // ),
                  //     ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
