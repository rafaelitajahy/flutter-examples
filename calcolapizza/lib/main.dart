import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() => runApp(Calcolapizza());

class Calcolapizza extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Portrait mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (context) => NavigationProvider(),
        ),
        ChangeNotifierProvider(
          builder: (context) => CalcolapizzaProvider(),
        ),
        ChangeNotifierProvider(
          builder: (context) => DoughDetailsProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Calcolapizza",
        theme: ThemeData.light().copyWith(
          appBarTheme: AppBarTheme(
            color: Colors.transparent,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            elevation: 0.0,
          )
        ),
      ),
    );
  }
}
