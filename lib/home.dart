import 'package:flutter/material.dart';
import "package:cat1/colores.dart";
import 'package:cat1/albumpage.dart';
import 'package:cat1/json/canciones_json.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:page_transition/page_transition.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int menu_activo = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blanco,
      // bottomNavigationBar: spotFooter(),
      body: spotBody(),
    );
  }

  Widget spotBody() {
    return IndexedStack(index: menu_activo, children: [
      Column(
        children: [
          cabecera(),
          topmenubar(),
          cat1body(),
        ],
      ),
      Column(
        children: [
          cabecera(),
          topmenubar(),
          cat2body(),
        ],
      ),
      Column(
        children: [
          cabecera(),
          topmenubar(),
          cat3body(),
        ],
      ),
      Column(
        children: [
          cabecera(),
          topmenubar(),
          cat4body(),
        ],
      ),
      Column(
        children: [
          cabecera(),
          topmenubar(),
          cat5body(),
        ],
      ),
    ]);
  }

  Widget cabecera() {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Container(
          height: 75,
          child: Image.asset("assets/images/imglogo.png"),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          width: 250,
          height: 40,
          child: TextField(
            decoration: InputDecoration(
                // focusColor: Colors.red,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[500]),
                hintText: "Busca tu combo",
                fillColor: Colors.white70),
          ),
        ),
      ],
    );
  }

  Widget topmenubar() {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, top: 20),
            child: Row(
              children: List.generate(song_type_1.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        menu_activo = index;
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(categorias[index]['img']),
                                  fit: BoxFit.cover),
                              color: primario,
                              borderRadius: BorderRadius.circular(10)),
                        ),

                        /*  SizedBox(height: 3),
                        menu_activo == index
                            ? Container(
                                width: 10,
                                height: 3,
                                decoration: BoxDecoration(
                                    color: primario,
                                    borderRadius: BorderRadius.circular(50)))
                            : Container(),*/
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }

  Widget cat1body() {
    return Column(
      children: [
        // menu
        SingleChildScrollView(),
        SizedBox(
          height: 30,
        ),
        // menu 2 cat 1
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              children: List.generate(listacat1.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: GestureDetector(
                    onTap: () {
                      //cambio de wiget top
                      Navigator.push(
                          context,
                          PageTransition(
                              alignment: Alignment.bottomCenter,
                              child: AlbumPage(
                                canciones: listacat1[index],
                              ),
                              type: PageTransitionType.scale));
                      //fin cambio de widget top
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 250,
                          height: 180,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(listacat1[index]['img']),
                                  fit: BoxFit.cover),
                              color: primario,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          listacat1[index]['title'],
                          style: TextStyle(
                              color: negro,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 180,
                          child: Text(
                            listacat1[index]['description'],
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: negro,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),

        // fin menu 2 cat 1
      ],
    );
  }

  // cuerpo cat 2
  Widget cat2body() {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              children: List.generate(listacat2.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: GestureDetector(
                    onTap: () {
                      //cambio de wiget top
                      Navigator.push(
                          context,
                          PageTransition(
                              alignment: Alignment.bottomCenter,
                              child: AlbumPage(
                                canciones: listacat2[index],
                              ),
                              type: PageTransitionType.scale));
                      //fin cambio de widget top
                    },
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: 250,
                          height: 180,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(listacat2[index]['img']),
                                  fit: BoxFit.cover),
                              color: primario,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          listacat2[index]['title'],
                          style: TextStyle(
                              color: negro,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 180,
                          child: Text(
                            listacat2[index]['description'],
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: negro,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }

  // fin cuerpo cat2

  // cat 3

  Widget cat3body() {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              children: List.generate(listacat3.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: GestureDetector(
                    onTap: () {
                      //cambio de wiget top
                      Navigator.push(
                          context,
                          PageTransition(
                              alignment: Alignment.bottomCenter,
                              child: AlbumPage(
                                canciones: listacat3[index],
                              ),
                              type: PageTransitionType.scale));
                      //fin cambio de widget top
                    },
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: 250,
                          height: 180,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(listacat3[index]['img']),
                                  fit: BoxFit.cover),
                              color: primario,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          listacat3[index]['title'],
                          style: TextStyle(
                              color: negro,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 180,
                          child: Text(
                            listacat3[index]['description'],
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: negro,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
  // fin cat 3
  // cat 4

  // cat 3

  Widget cat4body() {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              children: List.generate(listacat4.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: GestureDetector(
                    onTap: () {
                      //cambio de wiget top
                      Navigator.push(
                          context,
                          PageTransition(
                              alignment: Alignment.bottomCenter,
                              child: AlbumPage(
                                canciones: listacat4[index],
                              ),
                              type: PageTransitionType.scale));
                      //fin cambio de widget top
                    },
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: 250,
                          height: 180,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(listacat4[index]['img']),
                                  fit: BoxFit.cover),
                              color: primario,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          listacat4[index]['title'],
                          style: TextStyle(
                              color: negro,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 180,
                          child: Text(
                            listacat4[index]['description'],
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: negro,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
  // fin cat 3
  //fin cat 4
  // cat 5

  Widget cat5body() {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              children: List.generate(listacat5.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: GestureDetector(
                    onTap: () {
                      //cambio de wiget top
                      Navigator.push(
                          context,
                          PageTransition(
                              alignment: Alignment.bottomCenter,
                              child: AlbumPage(
                                canciones: listacat5[index],
                              ),
                              type: PageTransitionType.scale));
                      //fin cambio de widget top
                    },
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: 250,
                          height: 180,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(listacat5[index]['img']),
                                  fit: BoxFit.cover),
                              color: primario,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          listacat5[index]['title'],
                          style: TextStyle(
                              color: negro,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 180,
                          child: Text(
                            listacat5[index]['description'],
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: negro,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
  // fin cat 5

}
