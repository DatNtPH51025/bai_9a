import 'package:bai_9a/consts/app_routers.dart';
import 'package:bai_9a/models/entity/hive_entity/contacts_model.dart';
import 'package:bai_9a/models/entity/hive_entity/product.dart';
import 'package:bai_9a/screens/add_product/add_product.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);

  Hive.registerAdapter(ContactsModelAdapter()); // Đăng ký adapter cho Contact
  Hive.registerAdapter(ProductAdapter()); // Đăng ký adapter cho Product

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: AppRouter.I.onGenerateRoute,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: AddProduct(), //SplashPage(),
    );
  }
}
