import 'package:flutter/material.dart';
import 'package:netflix_clone/screen/home_screen.dart';
import 'package:netflix_clone/widget/bottom_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

//MyApp의 상태를 관리하는 _MyAppState 클래스
class _MyAppState extends State<MyApp> {
  late TabController controller;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nefilx_jian',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        colorScheme: Theme.of(context).colorScheme.copyWith(
              background: const Color(0xFF000000),
              onBackground: const Color(0xFF2e2e2e),
              primary: const Color(0xFF6553D9),
              onPrimary: const Color(0xFFeeeeee),
              brightness: Brightness.dark,
            ),
        //accentColor는 이제 사용X
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              HomeScreen(),
              Container(),
              Container(),
              Container()
            ],
          ),

          //Navigation->Scaffold 안에 설정
          bottomNavigationBar: Bottom(),
        ),
      ),
      //length:TabBar의 길이->어플 하단 Bar의 가짓수
      //NeverScrollableScrollPhysics(): 사용자가 직접 손가락 모션을 통해서 스크롤하는 기능을 막음
    );
  }
}
