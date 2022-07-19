
/// import 'package:flutter/material.dart';
/// import 'package:provider/provider.dart';
/// import 'package:test_provider/navigationstate.dart';

/// void main() {
///   runApp(const MyApp());
/// }

/// class MyApp extends StatelessWidget {
///   const MyApp({Key? key}) : super(key: key);

///   // This widget is the root of your application.
///   @override
///   Widget build(BuildContext context) {
///    return Provider(
///       child: MaterialApp(
///         title: 'Flutter Demo',
///         debugShowCheckedModeBanner: false,
///         theme: ThemeData(
///           primarySwatch: Colors.teal,
///         ),
///         home: Home(),
///       ),
///       create: (BuildContext context){},
///       builder: (_) =>NavigationProvider(),
///     );
///   }
/// }
/// class Home extends StatefulWidget {
///   const Home({ Key? key }) : super(key: key);

///   @override
///   State<Home> createState() => _HomeState();
/// }

/// class _HomeState extends State<Home> {
///   @override
///   Widget build(BuildContext context) {
///     return Scaffold(
///        appBar: AppBar(
///         title: Text('Home Page'),
///       ),
///       body: Container(
///         child: Center(child: Text('Home'),),

///       ),
///       drawer: MyDrawer("Home"),
///     );
///   }
/// }

/// class MyDrawer extends StatelessWidget {
///   MyDrawer(this.currentPage);

///   final String currentPage;

///   @override
///   Widget build(BuildContext context) {
///     var currentDrawer = Provider.of<NavigationProvider>(context).getCurrentDrawer;
///     return Drawer(
///       child: ListView(
///         children: <Widget>[
///           ListTile(
///             title: Text(
///               "Home",
///               style: currentDrawer == 0
///                   ? TextStyle(fontWeight: FontWeight.bold)
///                   : TextStyle(fontWeight: FontWeight.normal),
///             ),
///             trailing: Icon(Icons.arrow_forward),
///             onTap: () {
///               Navigator.of(context).pop();
///               if (this.currentPage == "Home") return;

///               Provider.of<NavigationProvider>(context).setCurrentDrawer(0);

///               Navigator.of(context).pushReplacement(MaterialPageRoute(
///                   builder: (BuildContext context) =>
///                       Home()));
///             },
///           ),
///           ListTile(
///             title: Text(
///               "About",
///               style: currentDrawer == 1
///                   ? TextStyle(fontWeight: FontWeight.bold)
///                   : TextStyle(fontWeight: FontWeight.normal),
///             ),
///             trailing: Icon(Icons.arrow_forward),
///             onTap: () {
///               Navigator.of(context).pop();
///               if (this.currentPage == "About") return;

///               Provider.of<NavigationProvider>(context).setCurrentDrawer(1);

///               Navigator.of(context).pushReplacement(MaterialPageRoute(
///                   builder: (BuildContext context) => AboutPage()));
///             },
///           ),
///         ],
///       ),
///     );
///   }
/// }


/// class AboutPage extends StatefulWidget {
///   const AboutPage({ Key? key }) : super(key: key);

///   @override
///   State<AboutPage> createState() => _AboutPageState();
/// }

/// class _AboutPageState extends State<AboutPage> {
///   @override
///   Widget build(BuildContext context) {
///     return Scaffold(
///       appBar: AppBar(
///         title: Text('About Page'),
///       ),
///       drawer: MyDrawer("About"),
///     );
///   }
/// }