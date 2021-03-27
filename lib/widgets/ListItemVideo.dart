import 'package:flutter/material.dart';
import 'package:youtube_bar/models/Video.dart';

class ListItemVideo extends StatelessWidget {
  final Video video;

  ListItemVideo({ this.video });

  @override
  Widget build(BuildContext context) {
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
  }
}
