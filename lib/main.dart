import "package:flutter/material.dart";

import "Services/Sp_Services/cashe_helper.dart";
import "Src/root_app.dart";


Future<void> main() async {
 WidgetsFlutterBinding.ensureInitialized();
 await SharedPreferencesHelper.init();
  runApp(RootApp());
}
