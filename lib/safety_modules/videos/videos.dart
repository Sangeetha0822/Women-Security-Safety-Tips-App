import 'package:flutter/material.dart';
import 'package:mini_project/safety_modules/videos/player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

final videoUrls = [
  'https://youtu.be/sYtxrOkA_fQ?si=AjxTVuXnNA8Wqz5O',
  'https://youtu.be/k9Jn0eP-ZVg?si=NcmBb4JvEgAY6OP1',
  'https://youtu.be/9OdzSFyL0_0?si=tyVFvthNxZZ-qlx9',
  'https://youtu.be/SfAoGd8R-CM?si=rD2LyGoYHxkW_gFI',
  'https://youtu.be/J-59uKXo8zg?si=E_JseDb0cHlMNaqX',
  'https://youtu.be/5VKcQGIRJic?si=T2KMfR4868n32BBO',
  'https://youtu.be/VDL5273D3ag?si=9qzDVYvxS25qJbXL',
  'https://youtu.be/GbRcd9LSCq8?si=pE8J46pwRrSV__1F',
  'https://youtu.be/QhnFmKuKljI?si=0S53YnMm8usKCLVI',
  'https://youtu.be/OrX04ZD9XGc?si=iLZsd0XwTPcy_7JXss'
];

class WatchVideosPage extends StatelessWidget {
  const WatchVideosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Self Defence&AwarnessVideo"),
      ),
      body: ListView.builder(
        itemCount: videoUrls.length,
        itemBuilder: (context, index) {
          final videoID = YoutubePlayer.convertUrlToId(videoUrls[index]);

          return InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PLayerScreen(videoId: videoID)));
              },
              child:
              Image.network(YoutubePlayer.getThumbnail(videoId: videoID!)));
        },
      ),
    );
  }

  Widget thubmNail() {
    return Container(
      height: 200,
      margin: const EdgeInsets.all(10),
      color: Colors.blue,
      child: const Center(
        child: Text("THUMBNAIL"),
      ),
    );
  }
}