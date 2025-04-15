import 'package:capstone_2/pages/home/home_page.dart'; //*
import 'package:capstone_2/pages/map/map_page.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
export 'home_page_model.dart';

// 하단바 + 하단바 탭 선택에 따라 전환되는 콘텐츠 화면

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = 'HomePage';
  static String routePath = '/homePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  int selectedIndex = 0;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    // 하단바를 제외한 콘텐츠 화면 목록
    // 하단바의 각 탭을 누르면 화면이 전환됨
    Widget bodyContent;
    switch(selectedIndex){
      case 0: // 홈 화면 (home_page.dart)
        bodyContent = HomePage();
        break;
      case 1: // 추천 화면 (파일 아직 없음)
        bodyContent = Center(child: Text('추천화면'),);
        break;
      case 2: // 지도 화면 (map_page.dart)
        bodyContent = MapPage();
        break;
      case 3: // 라이브 화면 (파일 아직 없음)
        bodyContent = Center(child: Text('라이브화면'));
        break;
      default:
        bodyContent = Container();
    }

    // 콘텐츠 화면 + 하단바
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: bodyContent,
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 70.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33000000),
              offset: Offset(
                0.0,
                -2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(0.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: (){
                  setState(() {
                    selectedIndex = 0;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home_filled,
                      color: FlutterFlowTheme.of(context)
                          .secondaryText,
                      size: 24.0,
                    ),
                    Text(
                      '홈',
                      style: FlutterFlowTheme.of(context)
                          .bodyMedium
                          .override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context)
                            .secondaryText,
                        fontSize: 12.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    selectedIndex = 1;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.recommend,
                      color: FlutterFlowTheme.of(context)
                          .secondaryText,
                      size: 24.0,
                    ),
                    Text(
                      '추천',
                      style: FlutterFlowTheme.of(context)
                          .bodyMedium
                          .override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context)
                            .secondaryText,
                        fontSize: 12.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    selectedIndex = 2;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.map,
                      color: FlutterFlowTheme.of(context)
                          .secondaryText,
                      size: 24.0,
                    ),
                    Text(
                      '지도',
                      style: FlutterFlowTheme.of(context)
                          .bodyMedium
                          .override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context)
                            .secondaryText,
                        fontSize: 12.0,
                        letterSpacing: 0.0,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    selectedIndex = 3;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.live_tv,
                      color: FlutterFlowTheme.of(context)
                          .secondaryText,
                      size: 24.0,
                    ),
                    Text(
                      '라이브',
                      style: FlutterFlowTheme.of(context)
                          .bodyMedium
                          .override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context)
                            .secondaryText,
                        fontSize: 12.0,
                        letterSpacing: 0.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
