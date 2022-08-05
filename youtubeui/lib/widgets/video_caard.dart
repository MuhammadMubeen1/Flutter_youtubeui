import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart ' as timeago;
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:youtubeui/data.dart';
import 'package:youtubeui/screens/nav_screens.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class videoCard extends StatelessWidget {
  const videoCard({Key? key,
   required this.video, 
   bool? hasPadding,
     Future<void> Function()? onTap}) : super(key: key);
  final Video video;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (

      ){

        context.read(selectedVideoProvider).state=video;
      },
      child: Column(
        children: [
          Stack(
            children: [
              Image.network(
                video.thumbnailUrl,
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 8.0,
                right: 8.0,
                child: Container(
                  padding: const EdgeInsets.all(4.0),
                  color: Colors.black,
                  child: Text(video.duration,
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          ?.copyWith(color: Colors.white)),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => print('Navigate to profile'),
                  child: CircleAvatar(
                      foregroundImage:
                          NetworkImage(video.author.profileImageUrl)),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                          child: Text(video.title,
                              maxLines: 2, overflow: TextOverflow.ellipsis)),
                      Flexible(
                        child: Text(
                          '${video.author.username} * ${video.viewCount} views * ${timeago.format(video.timestamp)}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(fontSize: 14.0),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  child: const Icon(
                    Icons.more_vert,
                    size: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
