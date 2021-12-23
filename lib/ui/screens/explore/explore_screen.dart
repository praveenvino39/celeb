import 'package:celeb/constant.dart';
import 'package:flutter/material.dart';
import 'package:celeb/mock_data/data.dart';
import 'package:tcard/tcard.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  TCardController _controller = TCardController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: TCard(
        cards: List.generate(
          celbs.length,
          (int index) {
            return Center(
              child: Container(
                clipBehavior: Clip.hardEdge,
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 17),
                      blurRadius: 23.0,
                      spreadRadius: -13.0,
                      color: Colors.black54,
                    )
                  ],
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(250),
                ),
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(celbs[index].image),
                ),
              ),
            );
            // return Container(
            //   height: 200,
            //   width: 200,
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(100.0),
            //     boxShadow: const [
            //       BoxShadow(
            //         offset: Offset(0, 17),
            //         blurRadius: 23.0,
            //         spreadRadius: -13.0,
            //         color: Colors.black54,
            //       )
            //     ],
            //   ),
            //   child: Container(
            //     child: Image(
            //       width: 200,
            //       height: 200,
            //       image: NetworkImage(
            //         celbs[index].image,
            //       ),
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // );
          },
        ),
        size: Size(360, 480),
        controller: _controller,
        onForward: (index, info) {
          print(index);
          print(info.direction);
          if (info.direction == SwipDirection.Right) {
            print('like');
          } else {
            print('dislike');
          }
        },
        onBack: (index, info) {
          print(index);
        },
        onEnd: () {
          print('end');
        },
      ),
    );
  }
}
