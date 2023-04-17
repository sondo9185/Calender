import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class TapBar extends StatefulWidget {
  const TapBar({Key? key}) : super(key: key);

  @override
  State<TapBar> createState() => _TapBarState();
}

class _TapBarState extends State<TapBar> with TickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 3, vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                      '날씨',
                    ),
                  ),
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
                    color: Colors.yellow,
                    alignment: Alignment.center,
                    child: const Text(
                      '날씨 화면',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.yellow,
                    alignment: Alignment.center,
                    child: TableCalendar(
                        focusedDay: DateTime.now(),
                        firstDay: DateTime(2023,1,1),
                        lastDay: DateTime(2023,1,31),
                        headerStyle: const HeaderStyle(
                          formatButtonVisible: false,
                          leftChevronVisible: false,
                          rightChevronVisible: false,
                        ),
                      ),
                    ),
                  Container(
                    color: Colors.yellow,
                    alignment: Alignment.center,
                    child: const Text(
                      '일정 관리 화면',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}