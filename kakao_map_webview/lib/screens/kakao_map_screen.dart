import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:geolocator/geolocator.dart';

class KakaoMapScreen extends StatefulWidget {
  @override
  _KakaoMapScreenState createState() => _KakaoMapScreenState();
}

class _KakaoMapScreenState extends State<KakaoMapScreen> {
  InAppWebViewController? webViewController;

  @override
  void initState() {
    super.initState();
    // getCurrentLocation();
  }

  // 디바이스의 현위치 중심으로 지도 띄우기
  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('위치 서비스가 비활성화되어 있습니다.');
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('위치 권한이 거부되었습니다.');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print('위치 권한이 영구적으로 거부되었습니다.');
      return;
    }

    // 디바이스의 현위치 정보 가져오기
    Position position = await Geolocator.getCurrentPosition();
    double lat = position.latitude;
    double lng = position.longitude;

    print('현재 위치: $lat, $lng');

    // 웹뷰에 좌표 전달
    if (webViewController != null) {
      webViewController!.evaluateJavascript(
        source: 'initMap($lat, $lng);',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InAppWebView(
        initialFile: 'assets/kakao_map.html',
        initialSettings: InAppWebViewSettings(
          javaScriptEnabled: true,
          domStorageEnabled: true,
          useHybridComposition: true,
          geolocationEnabled: true,
          allowUniversalAccessFromFileURLs: true,
        ),
        onWebViewCreated: (controller) {
          webViewController = controller;
          getCurrentLocation(); // 디바이스의 현위치 중심으로 지도 띄우기
        },
      ),
    );
  }
}

