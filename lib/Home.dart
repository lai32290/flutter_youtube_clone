import 'package:flutter/material.dart';
import 'package:youtube_bar/CustomSearchDelegate.dart';
import 'Initial.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  String _keyword = '';

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = [
      Initial(keyword: _keyword),
      Text('Em Alta'),
      Text('Inscritos'),
      Text('Biblioteca'),
    ];

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
            onPressed: () async {
              String keyword = await showSearch(context: context, delegate: CustomSearchDelegate() );
              setState(() {
                _keyword = keyword;
                _currentIndex = 0;
              });
            }
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () { print('user'); }
          )
        ]
      ),
      body: Container(
        padding: EdgeInsets.all(16),
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
