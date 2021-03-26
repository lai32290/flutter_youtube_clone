import 'package:flutter/material.dart';
import 'package:youtube_bar/models/Video.dart';
import 'Api.dart';

class Initial extends StatefulWidget {
  @override
  _InitialState createState() => _InitialState();
}

class _InitialState extends State<Initial> {
  Future<List<Video>> _listVideos() {
    Api api = Api();
    return api.search("");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
      future: _listVideos(),
      builder: (context, snapshot) {
        switch(snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator()
            );
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasData) {
              return ListView.separated(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  Video video = snapshot.data[index];

                  return Column(
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(video.image),
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(video.title),
                        subtitle: Text(video.channel)
                      )
                    ]
                  );
                },
                separatorBuilder: (context, index) => Divider(height: 2, color: Colors.red)
              );
            }

            return Center(
              child: Text('No data to display')
            );
            break;
          }
          return Text('No data to display');
        }
      );
    }
  }
