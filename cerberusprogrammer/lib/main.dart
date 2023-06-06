import 'package:cerberusprogrammer/themes.dart';
import 'package:cerberusprogrammer/windows/home.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //final savedThemeMode = await AdaptiveTheme.getThemeMode();
  final prefs = await SharedPreferences.getInstance();

  Themes.defaultIndex = prefs.getInt('defaultIndex') ?? 10;
  //bool presentation = prefs.getBool('presentation') ?? true;

  runApp(FluentApp(
    debugShowCheckedModeBanner: false,
    theme: FluentThemeData(
      accentColor: Colors.blue,
    ),
    home: const WindowsHome(),
  ));
}
