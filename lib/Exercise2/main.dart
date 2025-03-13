import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/color_counter.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ColorCounters(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: Home()),
      ),
    ),
  );
}

enum CardType { red, blue }

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    print('Home build');
    return Scaffold(
      body: _currentIndex == 0 ? ColorTapsScreen() : StatisticsScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.tap_and_play),
            label: 'Taps',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Statistics',
          ),
        ],
      ),
    );
  }
}

class ColorTapsScreen extends StatelessWidget {
  const ColorTapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('ColorTapsScreen build');
    return Scaffold(
      appBar: AppBar(title: Text('Color Taps')),
      body: Column(
        children: [
          Consumer<ColorCounters>(
            builder: (context, colorCounters, child) {
              print('ColorTap red build');
              return ColorTap(
                type: CardType.red,
                tapCount: colorCounters.redTapCount,
                onTap: colorCounters.incrementRedTapCount,
              );
            },
          ),
          Consumer<ColorCounters>(
            builder: (context, colorCounters, child) {
              print('ColorTap blue build');
              return ColorTap(
                type: CardType.blue,
                tapCount: colorCounters.blueTapCount,
                onTap: colorCounters.incrementBlueTapCount,
              );
            },
          ),
        ],
      ),
    );
  }
}

class ColorTap extends StatelessWidget {
  final CardType type;
  final int tapCount;
  final VoidCallback onTap;

  const ColorTap({
    super.key,
    required this.type,
    required this.tapCount,
    required this.onTap,
  });

  Color get backgroundColor => type == CardType.red ? Colors.red : Colors.blue;

  @override
  Widget build(BuildContext context) {
    print('ColorTap build');
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        height: 100,
        child: Center(
          child: Text(
            'Taps: $tapCount',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('StatisticsScreen build');
    return Scaffold(
      appBar: AppBar(title: Text('Statistics')),
      body: Center(
        child: Consumer<ColorCounters>(
          builder:
              (context, colorCounters, child) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Red Taps: ${colorCounters.redTapCount}',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    'Blue Taps: ${colorCounters.blueTapCount}',
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
        ),
      ),
    );
  }
}