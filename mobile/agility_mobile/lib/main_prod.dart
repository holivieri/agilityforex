import 'package:agility_mobile/firebase_options_prod.dart';
import 'main.dart';

void main() async {
  await runMainApp(firebaseOptions: DefaultFirebaseOptions.currentPlatform);
}
