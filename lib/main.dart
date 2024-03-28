import 'package:Mot3lqat/src/pages/page4/hive/ID.dart';
import 'package:Mot3lqat/src/pages/page4/pages/ID_Page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:Mot3lqat/src/config/routes/routes_path.dart';
import 'package:Mot3lqat/src/config/routes/route_names.dart';
import 'package:Mot3lqat/src/pages/page4/components/components.dart';
import 'package:Mot3lqat/src/pages/page4/hive/country.dart';
import 'package:Mot3lqat/src/pages/page4/hive/credit_card.dart';
import 'package:country_picker/country_picker.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'src/pages/page4/pages/pages.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:Mot3lqat/src/pages/page4/hive/boxes.dart';
import 'package:Mot3lqat/src/pages/page4/hive/hive.dart' as hive_models;

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CreditCardAdapter());
  Hive.registerAdapter(CountryAdapter());
  Hive.registerAdapter(IdAdapter());
  boxCountries = await Hive.openBox<hive_models.Country>('countryBox');
  boxCreditCards = await Hive.openBox<CreditCard>('creditCardBox');
  boxId= await Hive.openBox<Id>('IdBox');
  runApp(const Mot3lqat());

  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const Mot3lqat());

}


class Mot3lqat extends StatelessWidget {
  const Mot3lqat({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.signUpPage,
      routes: RoutesPath.routes,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(119, 153, 168, 90)),
        useMaterial3: true,
      ),
      supportedLocales: const [Locale('en')],
      localizationsDelegates: const [
        CountryLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cards'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Row(children: [
                Text(style: TextStyle(fontSize: 20), 'Options'),
                Icon(Icons.menu_open_rounded)
              ]),
            ),
            ListTile(
              leading: const Icon(Icons.credit_card_rounded),
              title: const Text('cards'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('ID'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const IdPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: boxCreditCards.listenable(),
        builder: (context, box, widget) {
          if (boxCreditCards.isEmpty) {
            return const Center(
                child: Text(
                  'You currently have no cards',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ));
          }
          return ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: boxCreditCards.length,
            itemBuilder: (BuildContext context, int index) {
              CreditCard cCard = boxCreditCards.getAt(index);
              return Stack(
                children: <Widget>[
                  CreditCardWidget(
                    creditCardData: cCard,
                  ),
                  Container(
                      alignment: Alignment.topRight,
                      child: FloatingActionButton.small(
                        splashColor: Colors.amber,
                        backgroundColor: Colors.red[400],
                        onPressed: () {
                          setState(() {
                            boxCreditCards.deleteAt(index);
                          });
                        },
                        child: const Icon(Icons.delete),
                      ))
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
            const Divider(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddCardPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
