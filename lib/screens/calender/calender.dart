import 'package:campus/screens/calender/calender_events.dart';
import 'package:campus/screens/calender/calender_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Calender extends ConsumerWidget {
  const Calender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var list = ref.watch(calenderListProvider.notifier);
    var list2 = ref.watch(calenderListProvider);
// print(list);

// final List<NeatCleanCalendarEvent> _eventList = list.whenData((v) => NeatCleanCalendarEvent(endTime: v.));

    // final List<NeatCleanCalendarEvent> _eventList = [
    //   NeatCleanCalendarEvent('MultiDay Event A',
    //       startTime: DateTime(DateTime.now().year, DateTime.now().month,
    //           DateTime.now().day, 10, 0),
    //       endTime: DateTime(DateTime.now().year, DateTime.now().month,
    //           DateTime.now().day + 2, 12, 0),
    //       color: Colors.orange,
    //       isMultiDay: true),
    //   NeatCleanCalendarEvent('Allday Event B',
    //       startTime: DateTime(DateTime.now().year, DateTime.now().month,
    //           DateTime.now().day - 2, 14, 30),
    //       endTime: DateTime(DateTime.now().year, DateTime.now().month,
    //           DateTime.now().day + 2, 17, 0),
    //       color: Colors.pink,
    //       isAllDay: true),
    //   NeatCleanCalendarEvent('Normal Event D',
    //       startTime: DateTime(DateTime.now().year, DateTime.now().month,
    //           DateTime.now().day, 14, 30),
    //       endTime: DateTime(DateTime.now().year, DateTime.now().month,
    //           DateTime.now().day, 17, 0),
    //       color: Colors.indigo),
    // ];
    return Scaffold(
      appBar: AppBar(),
      body:

          // list.when(data: (d){

          Calendar(
        startOnMonday: false,
        onEventDismissed: (event) {
          ref.read(calenderListProvider.notifier).remove(event.id);
        },
        // weekDays: ['Mo', 'Di', 'Mi', 'Do', 'Fr', 'Sa', 'So'],
        eventsList: list2,
        isExpandable: true,
        eventDoneColor: Colors.green,
        selectedColor: Colors.pink,
        todayColor: Colors.blue,
        eventColor: null,
        locale: 'en_US',
        todayButtonText: 'Today',
        allDayEventText: 'All day',
        multiDayEndText: 'End',
        isExpanded: true,
        expandableDateFormat: 'EEEE, dd. MMMM yyyy',
        datePickerType: DatePickerType.date,
        dayOfWeekStyle: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w800, fontSize: 11),
      ),

      // },),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        // backgroundColor: Colors.green,
      ),
    );
  }
}
