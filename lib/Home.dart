import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  List<Widget> _pages = [
    Text('Home'),
    Text('Em Alta'),
    Text('Inscritos'),
    Text('Biblioteca'),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'images/youtube.png',
          width: 98,
          height: 22,
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.red,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () { print('video'); }
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () { print('search'); }
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () { print('user'); }
          )
        ]
      ),
      body: Center(
        child: _pages[_currentIndex]
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        //type: BottomNavigationBarType.shifting,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            label: 'Inicio',
            backgroundColor: Colors.orange,
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
            label: 'Em Alta',
            backgroundColor: Colors.blue,
            icon: Icon(Icons.whatshot)
          ),
          BottomNavigationBarItem(
            label: 'Inscricoes',
            backgroundColor: Colors.purple,
            icon: Icon(Icons.subscriptions)
          ),
          BottomNavigationBarItem(
            label: 'Biblioteca',
            backgroundColor: Colors.green,
            icon: Icon(Icons.folder)
          ),
        ]
      )
    );
  }
}
