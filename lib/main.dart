import 'package:bank_thing/app_localizations.dart';
import 'package:bank_thing/core/ui/values/core_colors.dart';
import 'package:bank_thing/core/ui/widgets/credit_caluclation_page/credit_caluclation_page.dart';
import 'package:bank_thing/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  setupGetIt();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        scaffoldBackgroundColor: CoreColors.background,
        useMaterial3: true,
      ),
      home: const CreditCalculationPage(),
    );
  }
}
