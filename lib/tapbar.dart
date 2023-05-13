import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart'; 
import 'package:calender/data/my_location.dart'; 
import 'package:calender/data/network.dart';
const apikey = '86eb3b55e4cdca17b4a91356e3e13496';  //주석 추가

class TapBar extends StatefulWidget {
  const TapBar({Key? key}) : super(key: key);

  @override
  State<TapBar> createState() => _TapBarState();
}

class _TapBarState extends State<TapBar> with TickerProviderStateMixin{
  late TabController _tabController;

  late double latitude3;
  late double longitude3;

  Future<void> getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    latitude3 = myLocation.latitude2;
    longitude3 = myLocation.longitude2;
    print(latitude3);
    print(longitude3);

    Network network = Network('https://api.openweathermap.org/data/2.5/weather?lat=$latitude3&lon=$longitude3&appid=$apikey');
    var weatherData = network.getJsonData();
    print(weatherData);
  }

  // void fetchData() async{
    
  //     var myJson = parsingData['weather'][0]['description'];
  //     print(myJson);
  //   }
  // }

  @override
  void initState() {
    _tabController = TabController(
      length: 3, vsync: this,
    );
    super.initState();
    getLocation();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

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
              decoration: const BoxDecoration(
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
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: null,
                      child: Text(
                        '날씨 화면',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: TableCalendar(
                        focusedDay: DateTime.now(),
                        firstDay: DateTime(2020,01,01),
                        lastDay: DateTime(2030,12,31),
                        headerStyle: const HeaderStyle(
                          formatButtonVisible: false,
                          leftChevronVisible: true,
                          rightChevronVisible: true,
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