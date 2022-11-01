import 'package:get/get.dart';

class LocalizationEx extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'home': 'Home',
          'upload': 'Upload',
          'setting': 'Setting'
        },
        'en_MM': {
          'home': 'မူလစာမျက်နှာ',
          'upload': 'တင်မည်',
          'setting': 'အပြင်အဆင်'
        }
      };
}
