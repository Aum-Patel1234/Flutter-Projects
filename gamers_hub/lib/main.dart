import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gamers_hub/modules/routes/route_manager.dart';
import 'package:gamers_hub/modules/ui/screens/application.dart';
import 'package:gamers_hub/utils/global_provider.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return GlobalProviders(
      child: MaterialApp(
        onGenerateRoute: RouteManager.generateRoutes,
        scaffoldMessengerKey: scaffoldMessengerKey,
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: const Application(),
      ),
    );
  }
}