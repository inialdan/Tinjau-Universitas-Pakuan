import 'package:flutter/material.dart';

import 'Animations/FadeAnimation.dart';
import 'UnpakPage.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'Nunito'),
    home: HomePage(),
  )
);

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  PageController _pageController;
  int totalPage = 3;

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
          makePage(
            page: 1,
            image: 'assets/images/VOKASI.jpg',
            title: 'Sekolah Vokasi',
            description: 'Sekolah Vokasi Universitas Pakuan. Lembaga Pendidikan Tinggi yang bertekad untuk turut serta membangun negeri dalam mencerdaskan kehidupan bangsa, memberantas kemiskinan dan kebodohan, serta menegakan keadilan dan kebenaran yang dilandasi kearifan tradisional silih asih, silih asah serta silih asuh untuk membawa bangsa Indonesia menjadi bangsa yang unggul, mandiri dan berkarakter.'
          ),
          makePage(
            page: 2,
            image: 'assets/images/FHUKUM.jpg',
            title: 'Fakultas Hukum',
            description: 'Fakultas Hukum Universitas Pakuan saat ini memiliki peringkat Akreditasi “A” berdasarkan Keputusan Badan Akreditasi Nasional PerguruanTinggi (BAN-PT) Nomor 2085/SK/BAN-PT/Ak-PPJ/S/IV/2020, tertanggal 1 April 2020 dan mendapat Sertifikat ISO 21001 : 2018 tentang Sistem Manajemen Mutu Pendidikan dari VRC International.'
          ),
          makePage(
            page: 3,
            image: 'assets/images/FMIPA.jpg',
            title: 'Fakultas MIPA',
            description: "Fakultas Matematika dan Ilmu Pengetahuan Alam (FMIPA) Universitas Pakuan, FMIPA Unpak akan terus memperbaiki diri dan akan terus berkarya dengan melaksanakan Tridharma Perguruan Tinggi untuk menjadi Fakultas yang unggul, mandiri, dan berkarakter di bidang MIPA pada tahun 2025."
          ),
        ],
      ),
    );
  }

Widget makePage({image, title, description, page}) {
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  FadeAnimation(2, Text(page.toString(), style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),)),
                  Text('/' + totalPage.toString(), style: TextStyle(color: Colors.white, fontSize: 15),)
                ],
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
                    FadeAnimation(1.5, Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(Icons.star, color: Colors.yellow, size: 15,),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(Icons.star, color: Colors.yellow, size: 15,),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(Icons.star, color: Colors.yellow, size: 15,),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(Icons.star, color: Colors.yellow, size: 15,),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          child: Icon(Icons.star, color: Colors.grey, size: 15,),
                        ),
                        Text('4.0', style: TextStyle(color: Colors.white70),),
                        Text('(2300)', style: TextStyle(color: Colors.white38, fontSize: 12),)
                      ],
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(2, Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: Text(description, style: TextStyle(color: Colors.white.withOpacity(.7), height: 1.9, fontSize: 15),),
                    )),
                    SizedBox(height: 20,),
                    FadeAnimation(2.5, 
                    new GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => UnpakPage()));
                            },
                            child: new Text('Lihat Tentang Unpak', style: TextStyle(color: Colors.white),
                          ),
                      )
                    ),
                    SizedBox(height: 30,),
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