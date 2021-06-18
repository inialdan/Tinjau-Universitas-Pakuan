import 'package:flutter/material.dart';

import 'Animations/FadeAnimation.dart';


class UnpakPage extends StatefulWidget {
  @override
  _UnpakPage createState() => _UnpakPage();
}

class _UnpakPage extends State<UnpakPage> with SingleTickerProviderStateMixin {

  PageController _pageController;
  int totalPage = 1;

  void _onScroll() {
  }

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    )..addListener(_onScroll);

    super.initState();
  } 

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          data(
            page: 1,
            image: 'assets/images/UNPAK.jpeg',
            title: 'Universitas Pakuan',
            description: 'UNIVERSITAS PAKUAN (UNPAK) merupakan kelanjutan dari Universitas Bogor (Unbo) yang berkiprah selama hampir dua dekade sampai dengan tahun 1980. Beberapa perguruan tinggi swasta pada tahun 1977 berfusi dengan universitas ini yaitu Akademi Pariwisata, IKIP PGRI, Akademi Bahasa Asing, Akademi Sekretaris Manajemen Internasional dan Akademi Ilmu Agama Islam dengan badan penyelenggara Yayasan Perguruan Tinggi Bogor (YPTB).'
          ),
        ],
      ),
    );
  }
  
  Widget data({image, title, description, page}) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover
        )
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            stops: [0.3, 0.9],
            colors: [
              Colors.black.withOpacity(.9),
              Colors.black.withOpacity(.2),
            ]
          )
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(1,
                      Text(title, style: TextStyle(color: Colors.white, fontSize: 50, height: 1.2, fontWeight: FontWeight.bold),)
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(2, Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: Text(description, style: TextStyle(color: Colors.white.withOpacity(.7), height: 1.9, fontSize: 15),),
                    )),
                    SizedBox(height: 20,),
                  ],
                ),
              )
            ]
          ),
        ),
      ),
    );
  }
}
