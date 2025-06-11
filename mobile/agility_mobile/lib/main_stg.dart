import 'package:agility_mobile/firebase_options_stg.dart';
import 'package:agility_mobile/main.dart';

void main() async {
  await runMainApp(firebaseOptions: DefaultFirebaseOptions.currentPlatform);
}
