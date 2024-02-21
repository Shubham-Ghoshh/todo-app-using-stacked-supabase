import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo/app/app.bottomsheets.dart';
import 'package:todo/app/app.dialogs.dart';
import 'package:todo/app/app.locator.dart';
import 'package:todo/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  await Supabase.initialize(
    url: 'https://daheantxdydbontbujic.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRhaGVhbnR4ZHlkYm9udGJ1amljIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDg0MzE5NzgsImV4cCI6MjAyNDAwNzk3OH0.yc6GnaqUu-MobH2onGPJ7wM5xjGYNaaiGkkkxKyr6EM',
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.homeView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
