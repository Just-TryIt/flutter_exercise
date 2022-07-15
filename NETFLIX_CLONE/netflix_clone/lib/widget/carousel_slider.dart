import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/model/model_movie.dart';

class CarouselImage extends StatefulWidget {
  final List<Movie>? movies;
  CarouselImage({Key? key, required this.movies}) : super(key: key);

  @override
  State<CarouselImage> createState() => _CarouselImageState();

  // CarouselImage({this.movies});
  // _CarouselImageState createState() => _CarouselImageState();
}

// class catchNet extends StatelessWidget {
//   @override
//   Widget Build(BuildContext context) {
//     return MaterialApp(
//       title: '사랑의 불시착 img',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.grey,
//       ),
//       home: Scaffold(
//         appBar: AppBar(title: Text('NetworkImage_사랑의 불시착')),
//         body: Column(
//           children: [
//             CachedNetworkImage(
//               imageUrl: 'NETFLIX_CLONE/netflix_clone/images/test_movie_1.png',
//               placeholder: (context, url) => CircularProgressIndicator(),
//               errorWidget: (context, url, error) => Icon(Icons.error),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class _CarouselImageState extends State<CarouselImage> {
  List<Movie>? movies;
  List<Widget>? images;
  List<String>? keywords;
  List<bool>? likes;
  int _currenetPage = 0;
  String? _currentKeyword;

  @override
  void initState() {
    super.initState();
    movies = widget.movies;
    images = movies?.map((m) => Image.asset('../images/' + m.poster)).toList();
    keywords = movies?.map((m) => m.keyword).cast<String>().toList();
    likes = movies?.map((m) => m.like).cast<bool>().toList();
    _currentKeyword = keywords![0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
          ),
          // CarouselSlider의 문법이 강의와 달라져서 찾아서 수정함
          // '_currentKeyword'가 자꾸 오류가 난다..
          //'_currenKeyword'라고 t를 빼면 오류가 사라지는데 이게 맞는지는 모르겠음
          CarouselSlider(
            items: images,
            options: CarouselOptions(onPageChanged: (index, reason) {
              setState(() {
                _currenetPage = index;
                _currentKeyword = keywords![_currenetPage];
              });
            }),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 3),
            child: Text(
              _currentKeyword!,
              style: TextStyle(fontSize: 11),
            ),
          ),
          Container(
            child: Row(children: [
              Container(
                child: Column(
                  children: [
                    // likes[_currentPage]가 t이면 체크, f이면 플러스 버튼이 나옴
                    likes![_currenetPage]
                        ? IconButton(
                            icon: Icon(Icons.check),
                            onPressed: () {},
                          )
                        : IconButton(icon: Icon(Icons.add), onPressed: () {}),
                  ],
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
