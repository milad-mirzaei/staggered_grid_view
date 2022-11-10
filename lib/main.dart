import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> languages = [
      "dart.png",
      "firebase.png",
      "flutter.png",
      "go.png",
      "nodejs.png",
      "postgres.png",
      "react.png",
      "vue.png",
    ];

    return Scaffold(
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 230, 228, 228),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          padding: const EdgeInsets.symmetric(horizontal: 20.0)
              .copyWith(bottom: 7, top: 7),
          child: GNav(
            tabs: [
              GButton(
                icon: Icons.home,
                text: "home",
              ),
              GButton(
                icon: Icons.search,
                text: "search",
              ),
              GButton(
                icon: Icons.person,
                text: "profile",
              ),
              GButton(
                icon: Icons.settings,
                text: "settings",
              ),
            ],
            textStyle: GoogleFonts.teko(
              fontSize: 30,
              color: Color.fromARGB(255, 99, 224, 17),
            ),
            activeColor: Color.fromARGB(255, 99, 224, 17),
            rippleColor: Color.fromARGB(255, 99, 224, 17).withOpacity(.4),
            color: Colors.grey.shade400,
            duration: Duration(milliseconds: 700),
            gap: 5,
            curve: Curves.easeInOut,
            iconSize: 50,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          ),
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //   iconSize: 57,
        //   items: [
        //     BottomNavigationBarItem(
        //         icon: Icon(
        //           Icons.home_rounded,
        //         ),
        //         label: "Home"),
        //     BottomNavigationBarItem(
        //         icon: Icon(
        //           Icons.person_rounded,
        //         ),
        //         label: "Home"),
        //     BottomNavigationBarItem(
        //         icon: Icon(
        //           Icons.settings_rounded,
        //         ),
        //         label: "Home"),
        //   ],
        //   selectedFontSize: 15,
        //   selectedItemColor: Color.fromARGB(255, 70, 103, 185),
        //   unselectedItemColor: Color.fromARGB(255, 192, 192, 192),
        //   backgroundColor: Colors.white,
        //   currentIndex: _selectedIndex,
        //   onTap: _onTap,
        //   type: BottomNavigationBarType.fixed,
        // ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20).copyWith(top: 20),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hi,MilAd",
                            style: GoogleFonts.teko(
                              textStyle: TextStyle(
                                  fontSize: 42, fontWeight: FontWeight.w700),
                            )),
                        Text("What do you want to learn Today?",
                            style: GoogleFonts.teko(
                              textStyle: TextStyle(
                                  fontSize: 42,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.grey,
                                  height: 1),
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                      child: CircleAvatar(
                    radius: 57,
                    backgroundImage: NetworkImage(
                        "https://media.istockphoto.com/id/1296058958/vector/happy-young-woman-watching-into-rounded-frame-isolated-on-white-3d-vector-illustration.jpg?s=612x612&w=0&k=20&c=x9lmmoKVqxRro-G3S48IWIKQiykb2Yv1CkuiizDJ6gw="),
                  ))
                ],
              ),
              SizedBox(
                height: 25,
              ),
              MasonryGridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  itemCount: languages.length,
                  itemBuilder: (cotext, index) => Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(2, 4),
                                  blurRadius: 10,
                                  spreadRadius: 5,
                                  color: Colors.grey.shade300)
                            ]),
                        clipBehavior: Clip.antiAlias,
                        child: Image.asset("assets/images/${languages[index]}"),
                      )),
            ],
          ),
        ));
  }
}
