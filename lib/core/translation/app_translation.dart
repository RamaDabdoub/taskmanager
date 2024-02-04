
import 'package:empty_code/core/translation/languages/ar_language.dart';
import 'package:empty_code/core/translation/languages/en_language.dart';
import 'package:empty_code/core/translation/languages/fr_language.dart';
import 'package:get/get.dart';



class AppTranslation extends Translations {//from getx
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': ENLangauge.map,//اللغة الانكليزية حسب الدولة بيختلف والافتراضي US
        'ar_SA': ARLangauge.map,//-----------
        'fr_FR': FRLangauge.map,
      };
}

tr(String key) => key.tr;
