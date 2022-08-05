
import 'package:flutter/material.dart';
import 'package:youtubeui/data.dart';
import 'package:youtubeui/widgets/custome_scrooll.dart';
import '../widgets/video_caard.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CustomSliverAppBar(),
          SliverList(
            delegate: SliverChildBuilderDelegate(((context, index)
             {
            
              final Video = videos[index];
              return videoCard(video:Video, hasPadding: null,);
            
             }  ),            
              childCount:videos.length
            
            
            ),),
          
        ],
      ),
    );
  }
}
