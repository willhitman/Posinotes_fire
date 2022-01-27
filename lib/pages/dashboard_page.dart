import 'package:flutter/material.dart';
import 'package:posinotes_sqlflite/pages/notes_page.dart';
import 'package:posinotes_sqlflite/pages/quote_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<Widget> tabs = [
    //Home
     const Center(
        child: QuotesPage()
        // child: ProductsPage(),
        ),



    

    //NotesPage
     Center(child: NotesPage(
       
     )),

    //Account
     const Center(
      child:
          Center(child: Text("Account", style: TextStyle(color: Colors.black))),
    ),

    //Logout
    Center(
      child:
          Center(child: Text("Logout", style: TextStyle(color: Colors.black))),
    ),

    //Articles
    const Center(child: Text("Articles", style: TextStyle(color: Colors.black))
        // ProductsPage()
        ),
  ];

  int currentPage = 0;

  setPage(index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      //   title: Text('Navigation Bar'),
      // ),
      body: tabs[currentPage],
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: mainColor,
      //   onPressed: () => setPage(4),
      //   child: Icon(
      //     Icons.account_circle,
      //     color: currentPage == 4 ? Colors.grey :
      //           Colors.white,
      //     size: 30,),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          shape: CircularNotchedRectangle(),
          child: Container(
              height: 80,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.home,
                          color: currentPage == 0 ? Colors.yellow : Colors.white,
                          size: 30,
                        ),
                        onPressed: () => setPage(0),
                      ),
                      const Text(
                        "Home",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.note_outlined,
                          color: currentPage == 1 ? Colors.yellow : Colors.white,
                          size: 30,
                        ),
                        onPressed: () => setPage(1),
                      ),
                      const Text(
                        "Personal Notes",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  // SizedBox.shrink(),
                  Column(
                    children: [
                      IconButton(
                          onPressed: () => setPage(4),
                          icon: Icon(Icons.article_outlined,
                              color:
                                  currentPage == 4 ? Colors.yellow : Colors.white,
                              size: 30)),
                      const Text(
                        "Articles",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.account_circle,
                          color: currentPage == 2 ? Colors.yellow : Colors.white,
                          size: 30,
                        ),
                        onPressed: () => setPage(2),
                      ),
                      const Text(
                        "Account",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  // Column(
                  //   children: [
                  //     IconButton(
                  //       icon: Icon(
                  //         Icons.logout,
                  //         color: currentPage == 3 ? Colors.grey : Colors.white,
                  //         size: 30,
                  //       ),
                  //       onPressed: (){
                  //         // navigateToLoginPage();
                  //       },
                  //     ),
                  //     const Text(
                  //       "Logout",
                  //       style: TextStyle(
                  //           color: Colors.white, fontWeight: FontWeight.bold),
                  //     )
                  //   ],
                  // )
                ],
              ))),
      // bottomNavigationBar: FlashyTabBar(
      //   selectedIndex: currentPage,
      //   showElevation: true,
      //   onItemSelected: (index) => setState(() {
      //     currentPage = index;
      //   }),
      //   items: [
      //     FlashyTabBarItem(
      //       icon: Icon(Icons.event),
      //       title: Text('Events'),
      //     ),
      //     FlashyTabBarItem(
      //       icon: Icon(Icons.search),
      //       title: Text('Search'),
      //     ),
      //     FlashyTabBarItem(
      //       icon: Icon(Icons.highlight),
      //       title: Text('Highlights'),
      //     ),
      //     FlashyTabBarItem(
      //       icon: Icon(Icons.settings),
      //       title: Text('Settings'),
      //     ),
      //     FlashyTabBarItem(
      //       icon: Icon(Icons.settings),
      //       title: Text('한국어'),
      //     ),
      //   ],
      // ),
    );
  }

  // navigateToLoginPage(){
  //   Navigator.of(context).push(MaterialPageRoute(
  //       builder: (BuildContext context) => const LoginPage()));
  // }
}
