import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Show Man App',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        accentColor: Colors.blue,
        tooltipTheme: TooltipThemeData(
          textStyle: TextStyle(
            color: Colors.white,
          ),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      //initialRoute: "/home",
      // routes: {
      //   "/home": (BuildContext context) => HomeScreen(),
      //   '/main': (BuildContext context) => MainScreen(),
      //   '/about': (BuildContext context) => AboutScreen(),
      //   '/songs': (BuildContext context) => SongsScreen(),
      //   '/blog': (BuildContext context) => BlogScreen(),
      //   '/contact': (BuildContext context) => ContactScreen(),
      // }
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    final pCont = PageController(initialPage: 0);

    final pageView = PageView(
      controller: pCont,
      children: [
        Stack(
          children: [
            MainScreen(),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  NavArrow(
                      isBack: false, pCont: pCont, screenHeight: screenHeight),
                ],
              ),
            )
          ],
        ),
        Stack(
          children: [
            AboutScreen(),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  NavArrow(
                      isBack: true, pCont: pCont, screenHeight: screenHeight),
                  NavArrow(
                      isBack: false, pCont: pCont, screenHeight: screenHeight),
                ],
              ),
            )
          ],
        ),
        Stack(
          children: [
            SongsScreen(),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  NavArrow(
                      isBack: true, pCont: pCont, screenHeight: screenHeight),
                  NavArrow(
                      isBack: false, pCont: pCont, screenHeight: screenHeight),
                ],
              ),
            )
          ],
        ),
        Stack(
          children: [
            BlogScreen(),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  NavArrow(
                      isBack: true, pCont: pCont, screenHeight: screenHeight),
                  NavArrow(
                      isBack: false, pCont: pCont, screenHeight: screenHeight),
                ],
              ),
            )
          ],
        ),
        Stack(
          children: [
            ContactScreen(),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  NavArrow(
                      isBack: true, pCont: pCont, screenHeight: screenHeight),
                ],
              ),
            )
          ],
        ),
      ],
    );

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        endDrawerEnableOpenDragGesture: false,
        appBar: AppBar(
          title: Text.rich(
            TextSpan(
              text: "Show",
              style: TextStyle(
                fontSize: 34.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              children: <InlineSpan>[
                TextSpan(
                  text: ' Man',
                  style: TextStyle(
                    fontSize: 34.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                )
              ],
            ),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: IconButton(
                tooltip: "Menu",
                icon: Icon(
                  Icons.menu_sharp,
                  size: 34.0,
                ),
                onPressed: () => _scaffoldKey.currentState!.openEndDrawer(),
              ),
            ),
          ],
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blueAccent.shade400,
                  Colors.lightBlueAccent,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                color: Colors.black12,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: pageView,
                  ),
                ),
              ),
            ),
          ),
        ),
        endDrawer: Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                screenHeight > 400
                    ? DrawerHeader(
                        child: Container(
                          width: double.infinity,
                          child: FlutterLogo(
                            size: screenHeight * 0.05,
                          ),
                        ),
                      )
                    : Container(),
                NavTile(
                  title: "Főoldal",
                  icon: Icon(Icons.home_sharp),
                  route: 0,
                  pCont: pCont,
                ),
                Divider(),
                NavTile(
                  title: "Rólam",
                  icon: Icon(Icons.person_sharp),
                  route: 1,
                  pCont: pCont,
                ),
                Divider(),
                NavTile(
                  title: "Dalok",
                  icon: Icon(Icons.music_note_sharp),
                  route: 2,
                  pCont: pCont,
                ),
                Divider(),
                NavTile(
                  title: "Blog",
                  icon: Icon(Icons.article_sharp),
                  route: 3,
                  pCont: pCont,
                ),
                Divider(),
                NavTile(
                  title: "Kapcsolat",
                  icon: Icon(Icons.email_sharp),
                  route: 4,
                  pCont: pCont,
                ),
                Divider(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Show Man App \u00a9 2021",
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

class NavTile extends StatelessWidget {
  const NavTile(
      {Key? key,
      required this.title,
      required this.icon,
      required this.route,
      required this.pCont})
      : super(key: key);

  final String title;
  final Icon icon;
  final int route;
  final PageController pCont;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
      ),
      onTap: () {
        pCont.jumpToPage(route);
        Navigator.of(context).pop();
      },
    );
  }
}

class NavArrow extends StatelessWidget {
  const NavArrow(
      {Key? key,
      required this.isBack,
      required this.pCont,
      required this.screenHeight})
      : super(key: key);

  final bool isBack;
  final PageController pCont;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isBack
          ? IconButton(
              onPressed: () => pCont.previousPage(
                  duration: Duration(milliseconds: 300), curve: Curves.easeOut),
              icon: Icon(
                Icons.arrow_back_sharp,
                color: Colors.white54,
              ),
              iconSize: screenHeight * 0.05,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
            )
          : IconButton(
              onPressed: () => pCont.nextPage(
                  duration: Duration(milliseconds: 300), curve: Curves.easeIn),
              icon: Icon(
                Icons.arrow_forward_sharp,
                color: Colors.white54,
              ),
              iconSize: screenHeight * 0.05,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
            ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: ListView(
        children: [
          Center(
            child: Column(
              children: [
                screenWidth >= 480
                    ? AnimatedTextKit(
                        animatedTexts: [
                          TyperAnimatedText(
                            'Üdvözöllek Show Man világában! :)',
                            textStyle: Theme.of(context).textTheme.headline3,
                            speed: const Duration(milliseconds: 75),
                            textAlign: TextAlign.center,
                          ),
                        ],
                        onTap: () {},
                      )
                    : Text(
                        "Üdvözöllek Show Man világában! :)",
                        style: Theme.of(context).textTheme.headline4,
                        textAlign: TextAlign.center,
                      ),
                SizedBox(height: screenHeight * 0.03),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Card(
                      color: Colors.black12,
                      child: screenWidth >= 768
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: screenWidth * 0.25,
                                    child: Column(
                                      children: [
                                        Image.asset("assets/img/main.jpg"),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: screenWidth * 0.6,
                                    child: Column(
                                      children: [
                                        Text(
                                          "Üdvözletem! Dobos Antal vagyok.",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          height: screenHeight * 0.03,
                                        ),
                                        Text(
                                          "Zeneszerző, előadó, barista, mixer-bartender",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5,
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          height: screenHeight * 0.1,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0),
                                          child: Divider(
                                            height: 5.0,
                                            thickness: 5.0,
                                          ),
                                        ),
                                        SizedBox(
                                          height: screenHeight * 0.1,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            SocialButton(
                                              sburl:
                                                  "https://www.facebook.com/dobos.antal.14",
                                              size: 40.0,
                                              icon: FontAwesomeIcons.facebook,
                                            ),
                                            SocialButton(
                                              sburl:
                                                  "https://www.youtube.com/channel/UCNKjvzigbN0aiP7s4xChenA",
                                              size: 40.0,
                                              icon: FontAwesomeIcons.youtube,
                                            ),
                                            SocialButton(
                                              sburl:
                                                  "https://www.instagram.com/dtoni1998/",
                                              size: 40.0,
                                              icon: FontAwesomeIcons.instagram,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          "assets/img/main.jpg",
                                          fit: BoxFit.cover,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Text(
                                          "Üdvözletem! Dobos Antal vagyok.",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5,
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          height: screenHeight * 0.03,
                                        ),
                                        Text(
                                          "Zeneszerző, előadó, barista, mixer-bartender",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6,
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          height: screenHeight * 0.05,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0),
                                          child: Divider(
                                            height: 3.0,
                                            thickness: 3.0,
                                          ),
                                        ),
                                        SizedBox(
                                          height: screenHeight * 0.02,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            SocialButton(
                                                sburl:
                                                    "https://www.facebook.com/dobos.antal.14",
                                                size: 24.0,
                                                icon:
                                                    FontAwesomeIcons.facebook),
                                            SocialButton(
                                              sburl:
                                                  "https://www.youtube.com/channel/UCNKjvzigbN0aiP7s4xChenA",
                                              size: 24.0,
                                              icon: FontAwesomeIcons.youtube,
                                            ),
                                            SocialButton(
                                              sburl:
                                                  "https://www.instagram.com/dtoni1998/",
                                              size: 24.0,
                                              icon: FontAwesomeIcons.instagram,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
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

class SocialButton extends StatelessWidget {
  const SocialButton({
    Key? key,
    required this.sburl,
    required this.size,
    required this.icon,
  }) : super(key: key);

  final sburl;
  final size;
  final icon;

  void _launchURL() async => await canLaunch(sburl)
      ? await launch(sburl)
      : throw 'Could not launch $sburl';
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _launchURL(),
      icon: Icon(
        icon,
        size: size,
      ),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
    );
  }
}

class AboutScreen extends StatelessWidget {
  const AboutScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    var dateNow = new DateTime.now();
    var givenDate = "1998-06-23";
    var givenDateFormat = DateTime.parse(givenDate);
    var diff = dateNow.difference(givenDateFormat);
    var year = ((diff.inDays) / 365).round();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: screenWidth >= 935
            ? Align(
                alignment: Alignment.center,
                child: ListView(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          radius: screenHeight / 8,
                          backgroundImage: AssetImage('assets/img/prof.jpg'),
                        ),
                        SizedBox(
                          height: screenHeight * 0.01,
                        ),
                        Text("Dobos Antal",
                            style: Theme.of(context).textTheme.headline5),
                        SizedBox(
                          height: screenHeight * 0.01,
                        ),
                        Text(
                          (year).toString() + " éves",
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        // SizedBox(
                        //   height: screenHeight * 0.01,
                        // ),
                        // Text(
                        //   "#előadó #zeneszerző, #barista, #mixer, #bartender, #latte-art",
                        //   style: Theme.of(context).textTheme.subtitle2,
                        //   textAlign: TextAlign.center,
                        // )
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image(
                          image: AssetImage('assets/img/story.jpg'),
                          fit: BoxFit.cover,
                          height: screenHeight / 3,
                        ),
                        SizedBox(width: screenWidth * 0.01),
                        Flexible(
                          child: Column(
                            children: [
                              Text(
                                'Történetem',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Text(
                                "1998.06.23-án születtem Nyíregyházán. Koromhoz képest elég hamar a felnőttek munkával teli világában találtam magam, ugyanis rögtön az érettségim után 2017 decemberében elmentem dolgozni. De ennek sok oka volt és nem a szüleim hatására, hanem magamtól döntöttem így. Az első munkahelyemen majdnem 2 évet voltam és kezdtem azt érezni, hogy amit én szeretnék, amit keresek, azt ott nem fogom sem elérni, sem megtalálni. Amikor el jöttem vidékről, hogy kipróbáljam magam a nagyvárosban, sok elképzelésem volt, ami most sem kevesebb.",
                                textAlign: TextAlign.justify,
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Divider(
                      thickness: 3,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Column(
                            children: [
                              Text(
                                'Céljaim',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Text(
                                "Alapvetően nem biztos, hogy én vagyok a legélesebb kés a fiókban, viszont sok érdekességgel találkoztam eddigi életem során és mindből tanultam valami újat, valami hasznosat. A munka mellett önerőből elvégeztem egy barista, latte art és egy mixer-bártender OKJ-s szakmát. 2020 szeptemberébe elkezdtem járni heti egyszer kubai salsa órákra. Szabad időmben legtöbbször dalokat írok és gitározni tanulok. Mivel fontosnak tartom, hogy ép és egészséges legyek, ezért napi szinten edzek itthon. Ha pedig jó idő van, akkor biciklizek vagy kirándulok. Van három nővérem, és egy öcsém. Szóval nem tudom azt mondani, hogy unalmas az életem, mert mindig történik valami. Sok mindent szeretek az életben főleg azt, ha hasznosan és kreatívan segíthetek másoknak. Ez vagyok én Dobos Antal.",
                                textAlign: TextAlign.justify,
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.01),
                        Image(
                          image: AssetImage('assets/img/goal.jpg'),
                          fit: BoxFit.cover,
                          height: screenHeight / 3,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : Align(
                alignment: Alignment.center,
                child: ListView(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          radius: screenHeight / 8,
                          backgroundImage: AssetImage('assets/img/prof.jpg'),
                        ),
                        SizedBox(
                          height: screenHeight * 0.01,
                        ),
                        Text("Dobos Antal",
                            style: Theme.of(context).textTheme.headline5),
                        SizedBox(
                          height: screenHeight * 0.01,
                        ),
                        Text((year).toString() + " éves",
                            style: Theme.of(context).textTheme.subtitle1),
                        // SizedBox(
                        //   height: screenHeight * 0.01,
                        // ),
                        // Text(
                        //   "#előadó #zeneszerző, #barista, #mixer, #bartender, #latte-art",
                        //   style: Theme.of(context).textTheme.subtitle2,
                        //   textAlign: TextAlign.center,
                        // )
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image(
                          image: AssetImage('assets/img/story.jpg'),
                          fit: BoxFit.cover,
                          height: screenHeight / 2,
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Flexible(
                          child: Column(
                            children: [
                              Text(
                                'Történetem',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Text(
                                "1998.06.23-án születtem Nyíregyházán. Koromhoz képest elég hamar a felnőttek munkával teli világában találtam magam, ugyanis rögtön az érettségim után 2017 decemberében elmentem dolgozni. De ennek sok oka volt és nem a szüleim hatására, hanem magamtól döntöttem így. Az első munkahelyemen majdnem 2 évet voltam és kezdtem azt érezni, hogy amit én szeretnék, amit keresek, azt ott nem fogom sem elérni, sem megtalálni. Amikor el jöttem vidékről, hogy kipróbáljam magam a nagyvárosban, sok elképzelésem volt, ami most sem kevesebb.",
                                textAlign: TextAlign.justify,
                                // style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Divider(
                      thickness: 3,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image(
                          image: AssetImage('assets/img/goal.jpg'),
                          fit: BoxFit.cover,
                          height: screenHeight / 2,
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Flexible(
                          child: Column(
                            children: [
                              Text(
                                'Céljaim',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Text(
                                "Alapvetően nem biztos, hogy én vagyok a legélesebb kés a fiókban, viszont sok érdekességgel találkoztam eddigi életem során és mindből tanultam valami újat, valami hasznosat. A munka mellett önerőből elvégeztem egy barista, latte art és egy mixer-bártender OKJ-s szakmát. 2020 szeptemberébe elkezdtem járni heti egyszer kubai salsa órákra. Szabad időmben legtöbbször dalokat írok és gitározni tanulok. Mivel fontosnak tartom, hogy ép és egészséges legyek, ezért napi szinten edzek itthon. Ha pedig jó idő van, akkor biciklizek vagy kirándulok. Van három nővérem, és egy öcsém. Szóval nem tudom azt mondani, hogy unalmas az életem, mert mindig történik valami. Sok mindent szeretek az életben főleg azt, ha hasznosan és kreatívan segíthetek másoknak. Ez vagyok én Dobos Antal.",
                                textAlign: TextAlign.justify,
                                //   style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class SongsScreen extends StatelessWidget {
  const SongsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //double screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: SongCard(),
    );
  }
}

class SongCard extends StatefulWidget {
  const SongCard({Key? key}) : super(key: key);

  @override
  _SongCardState createState() => _SongCardState();
}

class _SongCardState extends State<SongCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    stopMusic();
    super.dispose();
  }

  AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);

  List song = [
    Songs("Pezsgő élet", "Dobos Antal", 1.0, 'assets/pezsgo_elet.mp3'),
    Songs("Igaz szerelem", "Dobos Antal", 1.0, 'assets/igaz_szerelem.mp3'),
    Songs("Egy pár korty", "Dobos Antal", 1.0, 'assets/egy_par_korty.mp3'),
    Songs("Pokoli angyal", "Dobos Antal", 1.0, 'assets/pokoli_angyal.mp3'),
  ];

  bool isPlaying = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    //double screenHeight = MediaQuery.of(context).size.height;

    return GridView.builder(
      itemCount: song.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: screenWidth >= 480 ? 4 : 1,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: (2 / 1),
      ),
      itemBuilder: (context, index) {
        return Card(
          color: Colors.black26,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(song[index].stitle),
              IconButton(
                onPressed: () async {
                  setState(() {
                    isPlaying = !isPlaying;
                  });
                  isPlaying
                      ? await audioPlayer.play(song[index].surl, isLocal: true)
                      : await stopMusic();
                },
                icon: isPlaying
                    ? Icon(Icons.stop_sharp)
                    : Icon(Icons.play_arrow_sharp),
              ),
            ],
          ),
        );
      },
    );
  }

  stopMusic() async {
    await audioPlayer.stop();
    await audioPlayer.setReleaseMode(ReleaseMode.STOP);
  }
}

class Songs {
  final String stitle;
  final String sauthor;
  final double sduration;
  final String surl;

  Songs(this.stitle, this.sauthor, this.sduration, this.surl);
}

class BlogScreen extends StatelessWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    List<Map> articles = [
      {
        "title": "Cím 1",
        "author": "Dobos Antal - Show Man",
        "date": "2021.08.16.",
      },
      {
        "title": "Cím 2",
        "author": "Dobos Antal - Show Man",
        "date": "2021.08.17.",
      },
      {
        "title": "Cím 3",
        "author": "Dobos Antal - Show Man",
        "date": "2021.08.18.",
      },
      {
        "title": "Cím 4",
        "author": "Dobos Antal - Show Man",
        "date": "2021.08.19.",
      },
    ];
    return Center(
      child: Column(
        children: [
          Container(
            child: Text(
              "Blog",
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          SizedBox(
            height: screenHeight * 0.01,
          ),
          Flexible(
            child: ListView.separated(
              itemCount: articles.length,
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemBuilder: (context, index) {
                return ExpansionTile(
                  expandedCrossAxisAlignment: CrossAxisAlignment.center,
                  title: Text(
                    articles[index]["title"],
                  ),
                  subtitle: Text(
                    articles[index]["author"],
                  ),
                  children: [
                    Text(
                      "Exercitation occaecat aliqua ut aliqua laboris do. Eiusmod nisi labore cillum reprehenderit nulla est nisi aliqua. Sit do dolor eu labore eu irure irure incididunt velit dolore. Nisi nisi duis qui eu est excepteur ullamco ipsum cupidatat est in eu.",
                    ),
                  ],
                  backgroundColor: Colors.black38,
                  collapsedBackgroundColor: Colors.black26,
                  textColor: Colors.lightBlue.shade200,
                  expandedAlignment: Alignment.center,
                  childrenPadding: EdgeInsets.all(8.0),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    final ncont = TextEditingController();
    final econt = TextEditingController();
    final scont = TextEditingController();
    final mcont = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Center(
        child: Align(
      alignment: Alignment.center,
      child: ListView(
        children: [
          Text(
            "Contact",
            style: Theme.of(context).textTheme.headline5,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: screenHeight * 0.03,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: screenWidth * 0.8,
                child: Card(
                  color: Colors.black12,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Üzenj Nekem!",
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          SizedBox(
                            height: screenHeight * 0.01,
                          ),
                          TextField(
                            controller: ncont,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              prefixIcon: Icon(Icons.person_sharp),
                              labelText: "Név",
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.01,
                          ),
                          TextField(
                            controller: econt,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                prefixIcon: Icon(Icons.alternate_email_sharp),
                                labelText: "E-mail"),
                          ),
                          SizedBox(
                            height: screenHeight * 0.01,
                          ),
                          TextField(
                            controller: scont,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                prefixIcon: Icon(Icons.person_sharp),
                                labelText: "Tárgy"),
                          ),
                          SizedBox(
                            height: screenHeight * 0.01,
                          ),
                          TextField(
                            controller: mcont,
                            maxLines: 5,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                prefixIcon: Icon(Icons.message_sharp),
                                labelText: "Üzenet"),
                          ),
                          SizedBox(
                            height: screenHeight * 0.01,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.send_sharp),
                                Text("Küldés"),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
