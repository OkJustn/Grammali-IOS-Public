import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'tl'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? tlText = '',
  }) =>
      [enText, tlText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'idduvnsq': {
      'en': 'Gram - Mali',
      'tl': 'Gram - Mali',
    },
    'n31uszpj': {
      'en': '',
      'tl': '',
    },
    'qnluxq0k': {
      'en': 'Input Text Here',
      'tl': 'Ilagay ang Text dito',
    },
    'c6ewxonc': {
      'en': 'Send',
      'tl': 'I-wasto',
    },
    'ci7f6pep': {
      'en': 'Home',
      'tl': '',
    },
  },
  // Welcome
  {
    '4gnvelcr': {
      'en': 'A Tagalog Grammar Checker',
      'tl': 'A Tagalog Grammar Checker',
    },
    '4uhjf8mf': {
      'en': 'Create Account',
      'tl': 'Gumawa ng Account',
    },
    'tssoypmd': {
      'en': 'Log In Account',
      'tl': 'Mag-log in',
    },
    'sfyb6rmt': {
      'en': 'Continue as Guest',
      'tl': 'Magpatuloy',
    },
    'ejrdh3fe': {
      'en': 'Continue with Google',
      'tl': 'Magpatuloy Gamit ang Google',
    },
    '2wurqy4w': {
      'en': 'Continue with Email',
      'tl': 'Magpatuloy Gamit ang Email',
    },
    'btikbg1w': {
      'en': 'Continue with Facebook',
      'tl': 'Magpatuloy Gamit ang Facebook',
    },
    'oudp3ukh': {
      'en': 'Gram - Mali',
      'tl': 'Gram - Mali',
    },
    'bj3obnj0': {
      'en': 'Home',
      'tl': '',
    },
  },
  // Profile
  {
    '65qof40j': {
      'en': '',
      'tl': '',
    },
    '6nyjhuf7': {
      'en': 'Dark Mode',
      'tl': 'Dark Mode',
    },
    'i439rg2e': {
      'en': 'Light Mode',
      'tl': 'Light Mode',
    },
    '89esd7mk': {
      'en': 'About Us',
      'tl': 'Tungkol sa Amin',
    },
    'kzy4ydxz': {
      'en': 'Help Center',
      'tl': 'Serbisyong Pantulong',
    },
    'jzwk67qb': {
      'en': 'Software Update',
      'tl': 'Software Update',
    },
    'u7l9fawx': {
      'en': 'Log Out',
      'tl': 'Log Out',
    },
  },
  // Email
  {
    'yvfqgrkv': {
      'en': '',
      'tl': '',
    },
    'dhegfssq': {
      'en': 'Password',
      'tl': 'Password',
    },
    '4nrd7ga9': {
      'en': '',
      'tl': '',
    },
    'zq5p6f6f': {
      'en': 'Email Address',
      'tl': 'Email Address',
    },
    '1gt83o4c': {
      'en': 'Password',
      'tl': 'Password',
    },
    'x0far64k': {
      'en': 'Email Address',
      'tl': 'Email Address',
    },
    '3fh8gzje': {
      'en': 'Continue',
      'tl': 'Magpatuloy',
    },
    'tvq7x1kw': {
      'en': '',
      'tl': '',
    },
    'wxdgv32k': {
      'en': 'Sign In with Email',
      'tl': 'Magpatuloy Gamit ang Email',
    },
    'q2oo37p9': {
      'en': 'Home',
      'tl': '',
    },
  },
  // LogIn
  {
    'df1no5d1': {
      'en': '',
      'tl': '',
    },
    'ctxm5ppj': {
      'en': 'Password',
      'tl': 'Password',
    },
    'z0fr75x1': {
      'en': '',
      'tl': '',
    },
    'ij3bgke1': {
      'en': 'Email Address',
      'tl': 'Email Address',
    },
    'y95lnfz1': {
      'en': 'Password',
      'tl': 'Password',
    },
    'b65b0f0a': {
      'en': 'Email Address',
      'tl': 'Email Address',
    },
    'lhbk6lj4': {
      'en': 'Continue',
      'tl': 'Magpatuloy',
    },
    'iqlild05': {
      'en': '',
      'tl': '',
    },
    '03vpscav': {
      'en': 'Welcome Back!',
      'tl': 'Welcome Back!',
    },
    'ckorws74': {
      'en': 'Home',
      'tl': '',
    },
  },
  // CreateAccount
  {
    '0uw9owg2': {
      'en': '',
      'tl': '',
    },
    'wggzszh9': {
      'en': 'Password',
      'tl': 'Password',
    },
    'fp8ttzcs': {
      'en': '',
      'tl': '',
    },
    '6kxblysy': {
      'en': 'Email Address',
      'tl': 'Email Address',
    },
    'nqsqkvcj': {
      'en': 'Password',
      'tl': 'Password',
    },
    'k2didvzc': {
      'en': 'Confirm Password',
      'tl': 'Confirm Password',
    },
    'ufwuhy8q': {
      'en': 'Continue',
      'tl': 'Magpatuloy',
    },
    '46jon6aj': {
      'en': '',
      'tl': '',
    },
    'fopwpwc5': {
      'en': 'Password',
      'tl': 'Password',
    },
    'hnra0mcm': {
      'en': 'Email Address',
      'tl': 'Email Address',
    },
    'z65o6cl1': {
      'en': '',
      'tl': '',
    },
    'tmu0hmgm': {
      'en': 'Create Account',
      'tl': 'Gumawa ng Account',
    },
    'is2q1jwp': {
      'en': 'Home',
      'tl': '',
    },
  },
  // About
  {
    'libfqzml': {
      'en': '',
      'tl': '',
    },
    't7kn1iqw': {
      'en': 'About Us\n',
      'tl': 'Tungkol sa Amin\n',
    },
    'yks15tqy': {
      'en': '\nWelcome to Gram-Mali: The Tagalog Grammar Checker\n',
      'tl':
          '\nMaligayang pagdating sa Gram-Mali: The Tagalog Grammar Checker\n',
    },
    'zjhmlsdn': {
      'en': '\nAt ',
      'tl': '\nSa',
    },
    'uz6a0kk6': {
      'en': 'Gram - Mali,',
      'tl': 'Gram - Mali,',
    },
    'i6q22tqj': {
      'en':
          'we believe that language is a powerful tool for communication, learning, and cultural identity. However, many Tagalog speakers struggle with written accuracy due to the complexity of the language’s grammatical rules. This is where we come in.',
      'tl':
          'naniniwala kami na ang wika ay isang makapangyarihang kasangkapan para sa komunikasyon, pag-aaral, at pagkakakilanlan sa kultura. Gayunpaman, maraming nagsasalita ng Tagalog ang nahihirapan sa kawastuhan ng nakasulat dahil sa pagiging kumplikado ng mga tuntunin sa gramatika ng wika. Dito kami pumapasok.',
    },
    't7qr7y7o': {
      'en': '\n\nGram - Mali ',
      'tl': '\n\nGram - Mali',
    },
    'a0al3syg': {
      'en':
          'is an innovative grammar-checking application designed specifically for the Tagalog language. Unlike existing grammar tools that focus primarily on English, Gram-Mali addresses the unique linguistic structures and challenges of written Tagalog. Our application helps users detect and correct grammatical errors, such as subject-verb agreement, tense consistency, punctuation, and word order, ensuring clearer and more professional writing.',
      'tl':
          'ay isang makabagong application sa pagsusuri ng gramatika na sadyang idinisenyo para sa wikang Tagalog. Hindi tulad ng umiiral na mga tool sa grammar na pangunahing nakatuon sa Ingles, tinutugunan ng Gram-Mali ang mga natatanging istrukturang pangwika at mga hamon ng nakasulat na Tagalog. Tinutulungan ng aming application ang mga user na makita at itama ang mga error sa gramatika, tulad ng kasunduan sa paksa-pandiwa, pagkakapare-pareho ng panahunan, bantas, at pagkakasunud-sunod ng salita, na tinitiyak ang mas malinaw at mas propesyonal na pagsulat.',
    },
    'wcfv5vz0': {
      'en':
          '\n\nDeveloped by a team of passionate researchers from Rizal National Science High School, Gram-Mali is not just a tool—it’s an educational resource aimed at improving writing proficiency among students, professionals, and native speakers alike. By integrating advanced natural language processing (NLP) and machine learning technologies, we ensure accurate and reliable grammar corrections tailored to the nuances of the Filipino language.',
      'tl':
          '\n\nBinuo ng isang pangkat ng mga masugid na mananaliksik mula sa Rizal National Science High School,\nAng Gram-Mali ay hindi lamang isang tool—ito ay isang mapagkukunang pang-edukasyon na naglalayong pahusayin ang kasanayan sa pagsusulat sa mga mag-aaral, propesyonal, at mga katutubong nagsasalita. Sa pamamagitan ng pagsasama ng mga advanced na natural language processing (NLP) at mga teknolohiya sa pag-aaral ng makina, tinitiyak namin ang tumpak at maaasahang mga pagwawasto ng grammar na iniayon sa mga nuances ng wikang Filipino.',
    },
    '3wm6ozyx': {
      'en': '\n\nOur mission is simple: ',
      'tl': '\n\nAng aming misyon ay simple:',
    },
    'h3pusji7': {
      'en':
          'to enhance digital communication in Tagalog and promote language inclusivity through technology.',
      'tl':
          'upang mapahusay ang digital na komunikasyon sa Tagalog at isulong ang pagiging inklusibo ng wika sa pamamagitan ng teknolohiya.',
    },
    'm08ymcmx': {
      'en':
          ' Whether you\'re a student working on an essay, a professional drafting formal documents, or simply someone who wants to improve their written Tagalog, Gram-Mali is here to support you.\n\nJoin us in our journey to make Tagalog writing more accessible, accurate, and expressive—one sentence at a time.',
      'tl':
          'Mag-aaral ka man na gumagawa ng isang sanaysay, isang propesyonal na pagbalangkas ng mga pormal na dokumento, o isang taong gustong pahusayin ang kanilang nakasulat na Tagalog, narito ang Gram-Mali upang suportahan ka.\n\nSamahan kami sa aming paglalakbay upang gawing mas madaling ma-access, tumpak, at makahulugan ang pagsusulat ng Tagalog—isang pangungusap sa bawat pagkakataon.',
    },
  },
  // ResultPage
  {
    'jn9f57xw': {
      'en': 'Gram - Mali',
      'tl': 'Gram - Mali',
    },
    'dimu8l4t': {
      'en': '',
      'tl': '',
    },
    'lcyc3fpc': {
      'en': 'Home',
      'tl': '',
    },
  },
  // Miscellaneous
  {
    'omd44rfb': {
      'en': '',
      'tl': '',
    },
    '0z8jeq0n': {
      'en': '',
      'tl': '',
    },
    'vnqlc5vi': {
      'en': '',
      'tl': '',
    },
    'ckqyieka': {
      'en': '',
      'tl': '',
    },
    'irf0hejm': {
      'en': '',
      'tl': '',
    },
    'yy3baooh': {
      'en': '',
      'tl': '',
    },
    'xq50mq1p': {
      'en': '',
      'tl': '',
    },
    'd0l0w0tb': {
      'en': '',
      'tl': '',
    },
    'akm0fbls': {
      'en': '',
      'tl': '',
    },
    'cs0np8yi': {
      'en': '',
      'tl': '',
    },
    '3736id4i': {
      'en': '',
      'tl': '',
    },
    'guzuakff': {
      'en': '',
      'tl': '',
    },
    'w2folp54': {
      'en': '',
      'tl': '',
    },
    'r82htq3f': {
      'en': '',
      'tl': '',
    },
    'iv2ymee6': {
      'en': '',
      'tl': '',
    },
    'g4xuupzr': {
      'en': '',
      'tl': '',
    },
    'dwgwz8b1': {
      'en': '',
      'tl': '',
    },
    'k7syowx9': {
      'en': '',
      'tl': '',
    },
    '31fhxlw9': {
      'en': '',
      'tl': '',
    },
    'z7y3fs0c': {
      'en': '',
      'tl': '',
    },
    'ybitygsd': {
      'en': '',
      'tl': '',
    },
    'mtfwvg3z': {
      'en': '',
      'tl': '',
    },
    'vjxm89fh': {
      'en': '',
      'tl': '',
    },
    'k667r9sm': {
      'en': '',
      'tl': '',
    },
    'sxlluv1p': {
      'en': '',
      'tl': '',
    },
  },
].reduce((a, b) => a..addAll(b));
