import 'package:flutter/material.dart';

// 홈 화면

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Column(
        children: [
          Container(
            height: kToolbarHeight,
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            child: Text(
              'BOOMMAP',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          alignment: Alignment.centerLeft,
                          height: 48,
                          child: Text(
                            '내 주변',
                            style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 240,
                          child: PageView.builder(
                            controller: PageController(viewportFraction: 0.9),
                            itemCount: 3,
                            physics: BouncingScrollPhysics(),
                            padEnds: false,
                            itemBuilder: (context, index) {
                              return _buildListCard(
                                context,
                                '카드 ${index + 1}',
                                Colors.primaries[index % Colors.primaries.length],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          alignment: Alignment.centerLeft,
                          height: 48,
                          child: Text(
                            '그때 그 장소',
                            style: TextStyle(
                                fontSize: 24,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 160,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              final isFirst = index == 0;
                              final isLast = index == 4;
                              return Padding(
                                padding: EdgeInsets.only(
                                  left: isFirst ? 8 : 0,
                                  right: isLast ? 8 : 0,
                                ),
                                child: _buildCard(
                                  context,
                                  '카드 ${index + 1}',
                                  Colors.primaries[index % Colors.primaries.length],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          alignment: Alignment.centerLeft,
                          height: 48,
                          child: Text(
                            '실시간 붐비는 장소',
                            style: TextStyle(
                                fontSize: 24,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 240,
                          child: PageView.builder(
                            controller: PageController(viewportFraction: 0.9),
                            itemCount: 3,
                            physics: BouncingScrollPhysics(),
                            padEnds: false,
                            itemBuilder: (context, index) {
                              return _buildListCard(
                                context,
                                '카드 ${index + 1}',
                                Colors.primaries[index % Colors.primaries.length],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildListCard(BuildContext context, String title, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
      ),
      child: Column(
        children: List.generate(4, (index) {
          return Expanded(
            child: ListTile(
              title: Text('리스트 항목 ${index + 1}'),
              leading: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, Color color) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        color: color,
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Text('장소')
        ]
      ),
    );
  }
}
