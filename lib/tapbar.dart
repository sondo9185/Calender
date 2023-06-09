import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';    //주석 추가
import 'package:calender/schedule_bottom_sheet.dart';

class TapBar extends StatefulWidget {

  // final OnDaySelected onDaySelected;
  // final DateTime selectedDate;

  // TapBar({
  //   required this.onDaySelected,
  //   required this.selectedDate,
  // });

  const TapBar({Key? key}) : super(key: key);

  @override
  State<TapBar> createState() => _TapBarState();
}

class _TapBarState extends State<TapBar> with TickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 2, vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {
            showModalBottomSheet(
              context: context, 
              builder: (_) => ScheduleBottomSheet(),
              //isDismissible: true,
              isScrollControlled: true,
            );
          },
          child: const Icon(
            Icons.add,
          ),
        ),
        appBar : AppBar(
          title: const Text(
            '일정 관리'
          ),
        ),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: TabBar(
                tabs: [
                  Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: const Text(
                      '달력',
                    ),
                  ),
                  Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: const Text(
                      '일정 목록',
                    ),
                  ),
                ],
                labelColor: Colors.red,
                unselectedLabelColor: Colors.black,
                controller: _tabController,
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Container(
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: TableCalendar(
                      locale: 'ko_kr',
                        focusedDay: DateTime.now(),
                        firstDay: DateTime(2000,01,01),
                        lastDay: DateTime(2100,12,31),
                        headerStyle: const HeaderStyle(
                          formatButtonVisible: false,
                          leftChevronVisible: true,
                          rightChevronVisible: true,
                        ),
                        // onDaySelected: onDaySelected,
                        // selectedDayPredicate: (date) => 
                        //   date.year == selectedDate.year && 
                        //   date.month == selectedDate.month && 
                        //   date.day == selectedDate.day,
                      ),
                    ),
                  Container(
                      
                    // color: Colors.white,
                    // alignment: Alignment.center,
                    // child: ListView.separated(
                    //   itemCount: 10,
                    //   itemBuilder: (BuildContext context, int index) {
                    //     return ListTile(
                    //       onTap: () {},
                    //       title: Container(
                    //         alignment: Alignment.centerLeft,
                    //         height: 50,
                    //         child: const Text(
                    //           'Entry A',
                    //           textAlign: TextAlign.start,
                    //         ),
                    //       ),
                    //     );
                    //   },
                    //   separatorBuilder: (BuildContext context, int index) { return Divider(thickness: 1); },
                    ),
                  
                    // child: ListView(
                    //   padding: const EdgeInsets.all(8),
                    //   children: <Widget>[
                        // Container(
                        //   height: 50,
                        //   color: Colors.amber[600],
                        //   alignment: Alignment.centerLeft,
                        //   //padding: Border.all(color: Colors.black),
                        //   child: Text('Entry A')
                        // ),
                        // const Divider(),
                        // Container(
                        //   height: 50,
                        //   color: Colors.amber[600],
                        //   alignment: Alignment.centerLeft,
                        //   //padding: Border.all(color: Colors.black),
                        //   child: Text('Entry B')
                        // ),
                        // Container(
                        //   height: 50,
                        //   color: Colors.amber[600],
                        //   alignment: Alignment.centerLeft,
                        //   //padding: Border.all(color: Colors.black),
                        //   child: Text('Entry C')
                        // ),
                        // const Divider()
                    //   ],
                    // )
                  
                ],
              ),
            ),
          ],
        )
      )
    );
  }


}