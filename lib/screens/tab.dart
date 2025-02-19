import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hymn/screens/about.dart';
import 'package:hymn/screens/favorite.dart';
import 'package:hymn/screens/history.dart';
import 'package:hymn/screens/home.dart';
import 'package:hymn/screens/index.dart';
import 'package:hymn/screens/responsive_reading.dart';
import 'package:hymn/screens/theme_setting.dart';
import 'package:hymn/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class TabHome extends StatefulWidget {
  const TabHome({super.key});

  @override
  State<TabHome> createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> {

  @override
  Widget build(BuildContext context) {
  
    
    return DefaultTabController(
      
      length: 2,
      child: Scaffold(
        drawer: Container(
          width: MediaQuery.of(context).size.width * 0.70,
          child: Drawer(
            backgroundColor: Provider.of<ThemeProvider>(context)
                .themeData
                .colorScheme
                .secondary,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                  color: Color.fromARGB(255, 33, 93, 243),
                  height: 40,
                ),
                DrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('asset/images/hymn1.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child:
                      null, // You can remove the child or keep it as null if you don't need any content inside the header
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.home,
                          color: const Color.fromARGB(255, 33, 93, 243),
                        ),
                        title: Text(
                          'Home',
                          style: TextStyle(
                              color: Provider.of<ThemeProvider>(context)
                                  .themeData
                                  .colorScheme
                                  .inversePrimary),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          // Navigate to Home
                        },
                      ), 
                      ListTile(
                        leading: Icon(
                          Icons.history,
                          color: const Color.fromARGB(255, 33, 93, 243),
                        ),
                        title: Text(
                          'History',
                          style: TextStyle(
                              color: Provider.of<ThemeProvider>(context)
                                  .themeData
                                  .colorScheme
                                  .inversePrimary),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    History()), // Replace with your home page widget
                          );
                          // Navigate to Home
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.settings,
                          color: Color.fromARGB(255, 33, 93, 243),
                        ),
                        title: Text(
                          'Settings',
                          style: TextStyle(
                              color: Provider.of<ThemeProvider>(context)
                                  .themeData
                                  .colorScheme
                                  .inversePrimary),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SettingsPage()), // Replace with your home page widget
                          );
                          // Navigate to Settings
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.favorite,
                          color: Color.fromARGB(255, 33, 93, 243),
                        ),
                        title: Text(
                          'Favorites',
                          style: TextStyle(
                              color: Provider.of<ThemeProvider>(context)
                                  .themeData
                                  .colorScheme
                                  .inversePrimary),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Favorite()), // Replace with your home page widget
                          );
                          // Navigate to Favorites
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.find_in_page,
                          color: Color.fromARGB(255, 33, 93, 243),
                        ),
                        title: Text(
                          'Index',
                          style: TextStyle(
                              color: Provider.of<ThemeProvider>(context)
                                  .themeData
                                  .colorScheme
                                  .inversePrimary),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Index()), // Replace with your home page widget
                          );
                          // Navigate to Favorites
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.info,
                          color: Color.fromARGB(255, 33, 93, 243),
                        ),
                        title: Text(
                          'About',
                          style: TextStyle(
                              color: Provider.of<ThemeProvider>(context)
                                  .themeData
                                  .colorScheme
                                  .inversePrimary),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    About()), // Replace with your home page widget
                          );
                          // Navigate to About Us
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                    padding: const EdgeInsets.all(
                        16.0), // Adjust the padding as needed
                    child: Center(
                      child: Text(
                        'အသင်းတော်၌ ကန့်သတ်ထုတ်ဝေသည်။',
                        style: TextStyle(
                          fontSize: 12,
                          color: Provider.of<ThemeProvider>(context)
                              .themeData
                              .colorScheme
                              .inversePrimary,
                        ),
                      ),
                    )),
                Center(
                  child: Text(
                    'Copyright© BCC, INC.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Provider.of<ThemeProvider>(context)
                          .themeData
                          .colorScheme
                          .inversePrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(195.0),
          child: AppBar(
            foregroundColor: Provider.of<ThemeProvider>(context)
                .themeData
                .colorScheme
                .inversePrimary,
            backgroundColor: Provider.of<ThemeProvider>(context)
                .themeData
                .colorScheme
                .secondary,
            flexibleSpace: Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 65,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'ခရစ်ယာန်ဓမ္မသီချင်း',
                          style: TextStyle(
                              fontSize: 26,
                              
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 51, 120, 240)),
                        ),
                      ],
                    ), 
                  ],
                )),
            bottom: TabBar(
                labelColor: Provider.of<ThemeProvider>(context)
                    .themeData
                    .colorScheme
                    .inversePrimary,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 6.5, color: Colors.blue),
                  insets: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.32),
                ),
                tabs: [
                  Tab(
                      text: 'ဓမ္မသီချင်းများ',
                      icon: Image.asset(
                        'asset/icons/hymn4.webp',
                        width: 35,
                      )),
                  Tab(
                      text: 'အပြန်အလှန်ဖတ်ခြင်း',
                      icon: Image.asset(
                        'asset/icons/book3.png',
                        width: 38,
                      )),
                ]),
          ),
        ),
        body: TabBarView(children: [HomePage(), Reading()]),
      ),
    );
  }
}
