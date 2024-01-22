import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

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
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

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

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

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

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // ZZZa444phone_login
  {
    'hzwqwy6u': {
      'en': 'Welcome Back,',
      'ar': '',
    },
    'kgpcmgqh': {
      'en': 'Not you?',
      'ar': '',
    },
    '55uvdpx5': {
      'en': 'Password',
      'ar': '',
    },
    'mkmma5fs': {
      'en': 'Enter your password here...',
      'ar': '',
    },
    'gsbhkym9': {
      'en': 'More Options',
      'ar': '',
    },
    '3c9lcb85': {
      'en': 'I Forgot My Password',
      'ar': '',
    },
    'vtkuthuz': {
      'en': 'Home',
      'ar': '',
    },
  },
  // zzzzcreateAccount
  {
    'n6384ukr': {
      'en': 'Get Started!',
      'ar': '',
    },
    '1xu2nl6i': {
      'en': 'Email Address',
      'ar': '',
    },
    'epishhpn': {
      'en': 'Enter your email here...',
      'ar': '',
    },
    '96trtru5': {
      'en': 'Password',
      'ar': '',
    },
    '28owo23o': {
      'en': 'Enter your password here...',
      'ar': '',
    },
    'jwjtg2my': {
      'en': 'Create Account',
      'ar': '',
    },
    'zzcxfe5f': {
      'en': 'Login',
      'ar': '',
    },
    'tdx0q024': {
      'en': 'Home',
      'ar': '',
    },
  },
  // court_addCourt
  {
    'cfy3sssm': {
      'en': 'Add Your Location',
      'ar': '',
    },
    '6b85v3i6': {
      'en': 'Your Location Name',
      'ar': '',
    },
    'aggr1sff': {
      'en': 'Location Name...',
      'ar': '',
    },
    'lonxh1u1': {
      'en': 'cars',
      'ar': '',
    },
    'l1rofvao': {
      'en': 'doctors',
      'ar': '',
    },
    '66svw27q': {
      'en': 'dentists',
      'ar': '',
    },
    'h117c31t': {
      'en': 'other',
      'ar': '',
    },
    'epwk4u6z': {
      'en': 'Please select a category...',
      'ar': '',
    },
    'nods09si': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'u6bieuwc': {
      'en': 'Description',
      'ar': '',
    },
    'b5isywrf': {
      'en':
          'Welcome to our plumbing services! We provide fast, reliable solutions for all your plumbing needs.\n\nOur services include plumbing repairs, water heater repairs, ....',
      'ar': '',
    },
    'r59c61fy': {
      'en': 'Set Location',
      'ar': '',
    },
    'qvuqv821': {
      'en': 'Done',
      'ar': '',
    },
    '5u1kgxen': {
      'en': 'Home',
      'ar': '',
    },
  },
  // court_AddedSuccess
  {
    '8g5h6rce': {
      'en': 'Location Added Successfully!',
      'ar': '',
    },
    'z59bw38v': {
      'en':
          'Congrats! You have successfully added your location! Thanks for contributing.',
      'ar': '',
    },
    '5qwbadhi': {
      'en': 'Okay, Go Home',
      'ar': '',
    },
    '5lkjkjyi': {
      'en': 'Home',
      'ar': '',
    },
  },
  // court_Details
  {
    '7nl9eq92': {
      'en': 'Active',
      'ar': '',
    },
    '33dj1jq1': {
      'en':
          'Ministry of Sound first opened its doors way back in September 1991. Inspired by New York’s cavernous house venues, our home was a derelict bus garage in South London - an area that, at the time, was more infamous than famous. The first night had no alcohol.',
      'ar': '',
    },
    'g0hfsmfp': {
      'en': 'UserName',
      'ar': '',
    },
    's40cr7r9': {
      'en': 'Overall',
      'ar': '',
    },
    'x4jmtbe7': {
      'en': 'Write a Review',
      'ar': '',
    },
    'w4dxkh5e': {
      'en': 'Direct message',
      'ar': '',
    },
    '8bhpxjcj': {
      'en': 'Call',
      'ar': '',
    },
    '00dhza2c': {
      'en': 'Home',
      'ar': '',
    },
  },
  // f6_editProfile
  {
    'at5tue2h': {
      'en': 'Edit Profile',
      'ar': '',
    },
    'y4oko55l': {
      'en': 'First Name',
      'ar': '',
    },
    'kbmg7iq9': {
      'en': 'Your first name...',
      'ar': '',
    },
    'jurwair8': {
      'en': 'Phone number',
      'ar': '',
    },
    'zksfccfp': {
      'en': 'Your phone number',
      'ar': '',
    },
    '9ird2qij': {
      'en': 'Email',
      'ar': '',
    },
    'its69z02': {
      'en': 'Your Email...',
      'ar': '',
    },
    '0r4bn9b1': {
      'en': 'Save Changes',
      'ar': '',
    },
    'aku6zxwz': {
      'en': 'Home',
      'ar': '',
    },
  },
  // zzzzzc7_changePassword
  {
    '6mp5bno8': {
      'en': 'Reset Password',
      'ar': '',
    },
    'er1k5sng': {
      'en': 'Email Address',
      'ar': '',
    },
    'jegv7gks': {
      'en': 'Your email..',
      'ar': '',
    },
    'pzuvcer7': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account above.',
      'ar': '',
    },
    'hkb4zawm': {
      'en': 'Send Reset Link',
      'ar': '',
    },
    'lxx72v98': {
      'en': 'Home',
      'ar': '',
    },
  },
  // zzzregisterPage
  {
    'lvc94tu8': {
      'en': 'Register',
      'ar': '',
    },
    '7mh5j0mu': {
      'en': 'Create an account below, by entering your information.',
      'ar': '',
    },
    'ttigqvx4': {
      'en': 'Email Address',
      'ar': '',
    },
    's1c39zaq': {
      'en': 'Enter your email address...',
      'ar': '',
    },
    'wmufltzp': {
      'en': 'Password',
      'ar': '',
    },
    'h5qape1d': {
      'en': 'Enter Password',
      'ar': '',
    },
    'tjfmvqox': {
      'en': 'Confirm Password',
      'ar': '',
    },
    '94jeinfv': {
      'en': 'Enter Password',
      'ar': '',
    },
    '79bpv1t3': {
      'en': 'Create Account',
      'ar': '',
    },
    'nd3rtiv3': {
      'en': 'Home',
      'ar': '',
    },
  },
  // zzzzverifyPhone
  {
    'ej006vlz': {
      'en': 'Verify Phone',
      'ar': '',
    },
    'v84gows9': {
      'en': 'Please enter the code that you received via text message (SMS).',
      'ar': '',
    },
    'gbl8ae3h': {
      'en': 'Enter Code ',
      'ar': '',
    },
    'e7v0ddhs': {
      'en': '000000',
      'ar': '',
    },
    'x7mijnkr': {
      'en': 'Verify',
      'ar': '',
    },
    'vah3knp1': {
      'en': 'Home',
      'ar': '',
    },
  },
  // d1_home-client
  {
    'co5msj2q': {
      'en': 'Search for service provider...',
      'ar': '',
    },
    'vqkxw657': {
      'en': 'Find a service provider',
      'ar': '',
    },
    'wac4oa3y': {
      'en': '6m',
      'ar': '',
    },
    'qyyo9p73': {
      'en': 'People',
      'ar': '',
    },
    '2opthrmt': {
      'en': '647k',
      'ar': '',
    },
    'yo0nait0': {
      'en': 'Today',
      'ar': '',
    },
    'yx0db811': {
      'en': '9k',
      'ar': '',
    },
    '3o0q5858': {
      'en': 'Now',
      'ar': '',
    },
    'a8y831u8': {
      'en': 'Create a Job',
      'ar': '',
    },
    '0990scl1': {
      'en': 'Cars',
      'ar': '',
    },
    'q1i7x24k': {
      'en': 'Education',
      'ar': '',
    },
    '2p2my83p': {
      'en': 'Dentist',
      'ar': '',
    },
    'fdwiyza1': {
      'en': 'Doctors',
      'ar': '',
    },
    'kjd4mctk': {
      'en': 'Corprate',
      'ar': '',
    },
    '890yw65a': {
      'en': 'Houses',
      'ar': '',
    },
    '7o781xbk': {
      'en': 'Elderly',
      'ar': '',
    },
    'gjecohf0': {
      'en': 'Beauty',
      'ar': '',
    },
    'c0kyt0r0': {
      'en': 'Home',
      'ar': '',
    },
  },
  // a1_first-page
  {
    'g8k7ehuh': {
      'en': 'Enter your mobile number',
      'ar': '',
    },
    'yaqbvlfz': {
      'en': '+2',
      'ar': '',
    },
    'abx3km1n': {
      'en': 'Continue',
      'ar': '',
    },
    'ne7azdwf': {
      'en': 'or',
      'ar': '',
    },
    '4k0e0yey': {
      'en': 'Continue with Email',
      'ar': '',
    },
    'z60n6tiz': {
      'en': 'Continue with Google',
      'ar': '',
    },
    'szg9mys3': {
      'en': 'Continue with Facebook',
      'ar': '',
    },
    '0zsdjjz9': {
      'en': 'Continue with Apple',
      'ar': '',
    },
    '6j0acri5': {
      'en': 'Testing button',
      'ar': '',
    },
    'is4g6spl': {
      'en': 'Home',
      'ar': '',
    },
  },
  // a2phone_OTP-code
  {
    'by2nlkfc': {
      'en': 'Confirm your Code',
      'ar': '',
    },
    '3hnswaat': {
      'en': 'Enter the 6-digit code sent to you',
      'ar': '',
    },
    'n9kkxa4z': {
      'en': 'Didn\'t receive a code?',
      'ar': '',
    },
    'b5vs309q': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Loading
  {
    '9kxzicij': {
      'en': 'Welcome to Mawjood',
      'ar': '',
    },
    'xchs5p74': {
      'en': 'We\'re setting up things for you...',
      'ar': '',
    },
    'oojpkmag': {
      'en': 'Home',
      'ar': '',
    },
  },
  // zzzzsignup-aftersignupwithemail
  {
    '5zxv9axf': {
      'en': 'Create an account',
      'ar': '',
    },
    'vj5akm6p': {
      'en': 'Let\'s get started by filling out the form below.',
      'ar': '',
    },
    'npim3jgq': {
      'en': 'Phone number',
      'ar': '',
    },
    'b8szscr7': {
      'en': 'Password',
      'ar': '',
    },
    '91e9arpo': {
      'en': 'Confirm Password',
      'ar': '',
    },
    '15z6u2d0': {
      'en': 'Create Account',
      'ar': '',
    },
    '227s6n80': {
      'en': 'OR',
      'ar': '',
    },
    '5cdotz3q': {
      'en': 'Continue with Google',
      'ar': '',
    },
    'yldey24m': {
      'en': 'Continue with Apple',
      'ar': '',
    },
    'qckjg9iw': {
      'en': 'Already have an account? ',
      'ar': '',
    },
    'bipuvqhq': {
      'en': 'Log in',
      'ar': '',
    },
    'te5px9nk': {
      'en': 'UserName',
      'ar': '',
    },
    'ffrwk32h': {
      'en': 'Overall',
      'ar': '',
    },
    'xryzlrep': {
      'en': '5',
      'ar': '',
    },
    'm5bciqgj': {
      'en':
          'Nice outdoor courts, solid concrete and good hoops for the neighborhood.',
      'ar': '',
    },
    'gjz3d82t': {
      'en': 'Home',
      'ar': '',
    },
  },
  // a3Confirm-your-info
  {
    'w026kavq': {
      'en': 'Confirm your info.',
      'ar': '',
    },
    'mx6fxsab': {
      'en': 'Let us know how to properly address you',
      'ar': '',
    },
    '86jqtv43': {
      'en': 'First Name',
      'ar': '',
    },
    'dum8k2n6': {
      'en': 'Last Name',
      'ar': '',
    },
    'bic6hb9i': {
      'en': 'Your Phone Number',
      'ar': '',
    },
    'dy5hhzjy': {
      'en': 'Choose Who You Are:',
      'ar': '',
    },
    'vh0q3tso': {
      'en': 'Client',
      'ar': '',
    },
    '4jwwnfn7': {
      'en': 'Client',
      'ar': '',
    },
    'riak70zv': {
      'en': 'Vendor',
      'ar': '',
    },
    'n40c4pp0': {
      'en': 'Service Location',
      'ar': '',
    },
    '2ourvip3': {
      'en': 'Select Location',
      'ar': '',
    },
    'v8v1hvtp': {
      'en': 'Field is required',
      'ar': '',
    },
    'feqqexie': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'b2g119ed': {
      'en': 'Field is required',
      'ar': '',
    },
    'x9u8mtqa': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'snmctdzg': {
      'en': 'Field is required',
      'ar': '',
    },
    'ue6bitx4': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'h3oifoff': {
      'en': 'Home',
      'ar': '',
    },
  },
  // ZZZa4_fp_OTP-2-email
  {
    '8n7u7hd2': {
      'en': 'Welcome Back,',
      'ar': '',
    },
    'nfl82yhw': {
      'en': 'Enter the 4-digit code sent to you at: \nname@gmail.com',
      'ar': '',
    },
    'myaoaj6m': {
      'en': 'Didn\'t receive a code?',
      'ar': '',
    },
    'ppx17xxt': {
      'en': 'Home',
      'ar': '',
    },
  },
  // c3_email-OTP-2-email
  {
    'r8pw9quv': {
      'en': 'Confirm your Code',
      'ar': '',
    },
    'ru8nhi65': {
      'en': 'Enter the 4-digit code sent to you at: \nname@gmail.com',
      'ar': '',
    },
    '1ym5g8m7': {
      'en': 'Didn\'t receive a code?',
      'ar': '',
    },
    '1uuaeyea': {
      'en': 'Home',
      'ar': '',
    },
  },
  // c3_email-enter-your-phone
  {
    '2pfsd7jc': {
      'en': 'Enter Your Mobile Number',
      'ar': '',
    },
    '3eqc4wn4': {
      'en': 'Your Phone Number',
      'ar': '',
    },
    'q5xte83f': {
      'en': 'Home',
      'ar': '',
    },
  },
  // ZZZc5email_account-password
  {
    'z1by2ur0': {
      'en': 'Create your Account Password',
      'ar': '',
    },
    'ru3ik0ai': {
      'en': 'Enter Your Password',
      'ar': '',
    },
    'vdv96md3': {
      'en': 'Home',
      'ar': '',
    },
  },
  // c1email_Enter-your-email
  {
    'dowmmlb6': {
      'en': 'What\'s your email address?',
      'ar': '',
    },
    'r7cquvap': {
      'en': 'Email Address',
      'ar': '',
    },
    'gy195y4s': {
      'en': 'Field is required',
      'ar': '',
    },
    'v6y92kj9': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'o7ylidum': {
      'en': 'Home',
      'ar': '',
    },
  },
  // a4Accept-terms
  {
    'etcz17ra': {
      'en': 'Accept Mawjood\'s \nTerms & Review \nPrivacy Notice',
      'ar': '',
    },
    'kydqouwq': {
      'en':
          'By Selecting "I Agree" below, I have reviewed and agree to the following Terms & acknowledge the privacy Notice. I am at least 18 years of age.',
      'ar': '',
    },
    'nzy87phr': {
      'en': 'Terms of Use ',
      'ar': '',
    },
    '8r3etcp5': {
      'en': 'privacy Notice',
      'ar': '',
    },
    'azvy2jjj': {
      'en': 'I agree',
      'ar': '',
    },
    'hyv64jps': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Post
  {
    '3qpmeyyg': {
      'en': 'Create Your Post',
      'ar': '',
    },
    'gqr134nf': {
      'en': 'Service Title',
      'ar': '',
    },
    '6svswcnz': {
      'en': 'Category',
      'ar': '',
    },
    '5i441n1l': {
      'en': 'Plumbing',
      'ar': '',
    },
    'rjbztugu': {
      'en': 'Car repair',
      'ar': '',
    },
    'ypi13hrb': {
      'en': 'Electronics',
      'ar': '',
    },
    'hmejrukh': {
      'en': 'Please select...',
      'ar': '',
    },
    'j3moo2js': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'g1tesch5': {
      'en': 'Post Description',
      'ar': '',
    },
    '8xenc1vd': {
      'en': 'Upload Image',
      'ar': '',
    },
    'a7minec0': {
      'en': 'Create Post',
      'ar': '',
    },
    'qtu4tahj': {
      'en': 'Home',
      'ar': '',
    },
  },
  // ZZZ_dffdfd
  {
    'yhk3cn95': {
      'en': 'Create Post',
      'ar': '',
    },
    '6h1cilkw': {
      'en': 'Please enter the information below to create your post.',
      'ar': '',
    },
    'bek16b87': {
      'en': 'Add Photo',
      'ar': '',
    },
    'gpq3v2ds': {
      'en': 'Upload an image here...',
      'ar': '',
    },
    'g4oq4kft': {
      'en': 'Post Title',
      'ar': '',
    },
    'abii5zil': {
      'en': 'Description here...',
      'ar': '',
    },
    '7b2snljr': {
      'en': 'URL of the project',
      'ar': '',
    },
    'l174ru0i': {
      'en': 'Clonable Link URL...',
      'ar': '',
    },
    'lyrlg8rk': {
      'en': 'Create Post',
      'ar': '',
    },
    'lllfrzcs': {
      'en': 'Field is required',
      'ar': '',
    },
    's0idp42g': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'w4cfq51l': {
      'en': 'Field is required',
      'ar': '',
    },
    'ouox3bjf': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'vock2o5r': {
      'en': 'Field is required',
      'ar': '',
    },
    'uxmcq0zz': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'cbah59oe': {
      'en': 'Field is required',
      'ar': '',
    },
    '5wp9xz8t': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '65j9bw9d': {
      'en': 'Home',
      'ar': '',
    },
  },
  // e1_home-vendor
  {
    'y6m6mean': {
      'en': 'Job List',
      'ar': '',
    },
    't0crsg9g': {
      'en': 'active',
      'ar': '',
    },
    'pbdg9kez': {
      'en': 'inactive',
      'ar': '',
    },
    'qotbq89r': {
      'en': 'Status',
      'ar': '',
    },
    '1qpzwt4w': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'km6mqd72': {
      'en': 'Search',
      'ar': '',
    },
    'xikkx732': {
      'en': 'Option 1',
      'ar': '',
    },
    'oymlerbn': {
      'en': 'Welcome, Mohamed',
      'ar': '',
    },
    'rtiy5db8': {
      'en': 'Create Post',
      'ar': '',
    },
    '1y7ofsqb': {
      'en': 'Recent Job Posts',
      'ar': '',
    },
    '66muy4va': {
      'en': 'Below you will find recent job posts,.',
      'ar': '',
    },
    'tot4rq8u': {
      'en': ' • ',
      'ar': '',
    },
    'q5ls4kq8': {
      'en': 'Vendor',
      'ar': '',
    },
  },
  // d3_applications
  {
    'ixgvhnev': {
      'en': 'Applications',
      'ar': '',
    },
    '01xy2ij9': {
      'en': 'Welcome, Mohamed',
      'ar': '',
    },
    'mf1kg1bg': {
      'en': 'Applications',
      'ar': '',
    },
    'xviiq1ea': {
      'en': '4.5',
      'ar': '',
    },
    '19tmjq4s': {
      'en': '(140)',
      'ar': '',
    },
    'f9ipfdh2': {
      'en': 'Applied:',
      'ar': '',
    },
    'h778yeey': {
      'en': '5 min ago',
      'ar': '',
    },
    'g17d8lr5': {
      'en': 'Activity',
      'ar': '',
    },
  },
  // f1_ccountSettings
  {
    'o10xzjvr': {
      'en': 'Account Settings',
      'ar': '',
    },
    'xp4wt2iz': {
      'en': 'Settings',
      'ar': '',
    },
    'rhn2fvz4': {
      'en': 'Profile Settings',
      'ar': '',
    },
    'pp0zsggc': {
      'en': 'Messages',
      'ar': '',
    },
    'gme665a2': {
      'en': 'Earn by Providing services',
      'ar': '',
    },
    'hoq73rcx': {
      'en': 'App Settings',
      'ar': '',
    },
    'jbsewrkm': {
      'en': 'Terms of Service',
      'ar': '',
    },
    'blq2lr8i': {
      'en': 'Help Center',
      'ar': '',
    },
    'b0reboor': {
      'en': 'Dark Mode',
      'ar': '',
    },
    'wqjszzs3': {
      'en': 'Account',
      'ar': '',
    },
  },
  // f3_TermsAndService
  {
    '8vcexoiw': {
      'en':
          'Please read these Terms of Service carefully before using our service.',
      'ar': '',
    },
    'vnj07wyw': {
      'en': '1. Acceptance of Terms',
      'ar': '',
    },
    'ccneyq7z': {
      'en':
          'By accessing or using the service, you agree to be bound by these Terms of Service. If you do not agree to all the terms and conditions of this agreement, then you may not access or use the service.',
      'ar': '',
    },
    'bl7g7x7l': {
      'en': '2. Description of Service',
      'ar': '',
    },
    'xnusf2zx': {
      'en':
          'Our service is a platform that connects service providers with customers seeking their services. We do not provide the actual services ourselves, but rather facilitate the connection between service providers and customers.',
      'ar': '',
    },
    '3zx8rzvz': {
      'en': '3. User Responsibilities',
      'ar': '',
    },
    'lbzdsajh': {
      'en':
          'As a user of our service, you are responsible for ensuring the accuracy and completeness of any information you provide. You are also responsible for complying with all applicable laws and regulations.',
      'ar': '',
    },
    'qhhto0bo': {
      'en': '4. Intellectual Property',
      'ar': '',
    },
    '8g340y82': {
      'en':
          'The service and its original content, features, and functionality are owned by us and are protected by international copyright, trademark, patent, trade secret, and other intellectual property or proprietary rights laws.',
      'ar': '',
    },
    'l4iqqord': {
      'en': '5. Limitation of Liability',
      'ar': '',
    },
    'wqy63icv': {
      'en':
          'In no event shall we be liable for any indirect, incidental, special, consequential or punitive damages, including without limitation, loss of profits, data, use, goodwill, or other intangible losses, resulting from your access to or use of or inability to access or use the service.',
      'ar': '',
    },
    'dt2rhx6s': {
      'en': '6. Governing Law',
      'ar': '',
    },
    'vqq8i54p': {
      'en':
          'These Terms of Service shall be governed and construed in accordance with the laws of [your country], without regard to its conflict of law provisions.',
      'ar': '',
    },
    'eh6cgp60': {
      'en': '7. Changes to Terms of Service',
      'ar': '',
    },
    's8ph7lp1': {
      'en':
          'We reserve the right, at our sole discretion, to modify or replace these Terms of Service at any time. If a revision is material, we will provide at least 30 days\' notice prior to any new terms taking effect. What constitutes a material change will be determined at our sole discretion.',
      'ar': '',
    },
    'oj7100uq': {
      'en': '8. Contact Us',
      'ar': '',
    },
    'o338tatt': {
      'en':
          'If you have any questions about these Terms of Service, please contact us at [contact email].',
      'ar': '',
    },
    'rll3b54f': {
      'en': 'Terms of Service',
      'ar': '',
    },
  },
  // f2_Help_Center
  {
    'zf3fgm0f': {
      'en': 'Help and Support',
      'ar': '',
    },
    'ms3dd0wz': {
      'en': 'Frequently Asked Questions',
      'ar': '',
    },
    'cyt9v7w5': {
      'en': 'Search for a  question',
      'ar': '',
    },
    '8n2xbumr': {
      'en': 'Ask a question',
      'ar': '',
    },
    '4wvxe0d5': {
      'en': 'Popular Questions',
      'ar': '',
    },
    '2mfbybhm': {
      'en': 'How do I reset my password?',
      'ar': '',
    },
    '9trye9xk': {
      'en': 'How can I update my profile\ninformation?',
      'ar': '',
    },
    '73q4spnq': {
      'en': 'What payment method do you \naccept?',
      'ar': '',
    },
    '52qza98w': {
      'en': 'Contact Support',
      'ar': '',
    },
    'ns9su9li': {
      'en': 'Call Support',
      'ar': '',
    },
    '8w6os251': {
      'en': 'Email support',
      'ar': '',
    },
    '42ymnxk5': {
      'en': 'Home',
      'ar': '',
    },
  },
  // c4_phone_OTP-code
  {
    'fit75vv0': {
      'en': 'Confirm your Code',
      'ar': '',
    },
    'ci9664kq': {
      'en': 'Enter the 6-digit code sent to you',
      'ar': '',
    },
    '7npcvotc': {
      'en': 'Didn\'t receive a code?',
      'ar': '',
    },
    'c2frr4ge': {
      'en': 'Home',
      'ar': '',
    },
  },
  // ZZZ_Card
  {
    '6idoof39': {
      'en': '[Display_Name]',
      'ar': '',
    },
    'dzxzifdf': {
      'en': '4.7',
      'ar': '',
    },
    '4nuuxydu': {
      'en': '\$220 USD',
      'ar': '',
    },
    'jskjoump': {
      'en': '+040223556',
      'ar': '',
    },
    'ko31yxjy': {
      'en': '27 Old Grocery',
      'ar': '',
    },
    '6qedp77d': {
      'en': 'Home',
      'ar': '',
    },
  },
  // f4_EarnbyProvidingservices
  {
    'bs8gq5ya': {
      'en': 'Earn by Providing services',
      'ar': '',
    },
    'q5vr602d': {
      'en': 'Choose Who You Are:',
      'ar': '',
    },
    'cv1y8e44': {
      'en': 'Client',
      'ar': '',
    },
    'kpi8t6oj': {
      'en': 'Client',
      'ar': '',
    },
    'uydnujb9': {
      'en': 'Vendor',
      'ar': '',
    },
    'yh6j9625': {
      'en': 'Service Location',
      'ar': '',
    },
    '61xfvo3e': {
      'en': 'Select Location',
      'ar': '',
    },
    'oneqvu0w': {
      'en': 'Submit',
      'ar': '',
    },
    '2f7fiakp': {
      'en': 'Home',
      'ar': '',
    },
  },
  // chattttttt
  {
    '4nqd2d99': {
      'en': 'Messages',
      'ar': '',
    },
    'n92uigzq': {
      'en': 'Edit',
      'ar': '',
    },
    'i92s8c3g': {
      'en': 'Home',
      'ar': '',
    },
  },
  // respon
  {
    'sw42vut5': {
      'en': 'Up to 70 EGP',
      'ar': '',
    },
    '1gc6meeh': {
      'en': '4.5',
      'ar': '',
    },
    'dbf2a8b4': {
      'en': '(140)',
      'ar': '',
    },
    'qvxuj2bj': {
      'en': 'Home',
      'ar': '',
    },
  },
  // f5_profile-client-settings
  {
    'gct132x6': {
      'en': 'Account Settings',
      'ar': '',
    },
    'obddrghy': {
      'en': 'Edit Profile',
      'ar': '',
    },
    'gasnfn2q': {
      'en': 'Log out',
      'ar': '',
    },
    '2fv0g4t0': {
      'en': 'Profile',
      'ar': '',
    },
  },
  // c2emailEnterYourPassword
  {
    'j0pommqh': {
      'en': 'Enter Your Password',
      'ar': '',
    },
    'ymm01seq': {
      'en': 'Password',
      'ar': '',
    },
    'wkhsqv20': {
      'en': 'Confirm Password',
      'ar': '',
    },
    '9swg3prk': {
      'en': 'Home',
      'ar': '',
    },
  },
  // a_Navigate_To_Confirm
  {
    'rje6h3i4': {
      'en': 'Home',
      'ar': '',
    },
  },
  // d3_applicationsCopy
  {
    '72nzux8i': {
      'en': 'Applications',
      'ar': '',
    },
    'expuw2jg': {
      'en': 'Search',
      'ar': '',
    },
    'x9d07812': {
      'en': 'Welcome, Mohamed',
      'ar': '',
    },
    'w463ph5j': {
      'en': 'Applications',
      'ar': '',
    },
    't07w86rf': {
      'en': 'Electrical Engineer Needed',
      'ar': '',
    },
    '2m7qbmc7': {
      'en': 'Zagazig, Eygpt',
      'ar': '',
    },
    'wimzy249': {
      'en': 'Mohamed hassan',
      'ar': '',
    },
    '9bfbrf9b': {
      'en': 'Up to 70 EGP',
      'ar': '',
    },
    'dc94sxcv': {
      'en': '4.5',
      'ar': '',
    },
    'xaevm3sy': {
      'en': '(140)',
      'ar': '',
    },
    '65on0r2v': {
      'en': 'Applied:',
      'ar': '',
    },
    '2uoh593f': {
      'en': '5 min ago',
      'ar': '',
    },
    '27httlk1': {
      'en': 'Eslam khaled',
      'ar': '',
    },
    't5yi3fu7': {
      'en': 'Up to 50 EGP',
      'ar': '',
    },
    '7fm1nl5h': {
      'en': '3.5',
      'ar': '',
    },
    'l2nfwiel': {
      'en': '(242)',
      'ar': '',
    },
    '0y8jgscm': {
      'en': 'Applied:',
      'ar': '',
    },
    'es88kzq2': {
      'en': '7 min ago',
      'ar': '',
    },
    '52sdcnts': {
      'en': 'Ahmed Amr',
      'ar': '',
    },
    'yuzu6q06': {
      'en': 'Up to 45 EGP',
      'ar': '',
    },
    '9nxki48s': {
      'en': '2.5',
      'ar': '',
    },
    '1r6wj9s2': {
      'en': '(55)',
      'ar': '',
    },
    'olwrvvb2': {
      'en': 'Applied:',
      'ar': '',
    },
    'smrh6po8': {
      'en': '10 min ago',
      'ar': '',
    },
    'meaamjg6': {
      'en': 'Wael Sherif',
      'ar': '',
    },
    'qf7bhvot': {
      'en': 'Up to 30 EGP',
      'ar': '',
    },
    'cu05c3ow': {
      'en': '1.5',
      'ar': '',
    },
    'wm1z5y04': {
      'en': '(22)',
      'ar': '',
    },
    'ijek5qjv': {
      'en': 'Applied:',
      'ar': '',
    },
    'ac29xzxn': {
      'en': '20 min ago',
      'ar': '',
    },
    'uh71npyp': {
      'en': 'Applicant Name',
      'ar': '',
    },
    'nbvz3zde': {
      'en': 'UX Designer',
      'ar': '',
    },
    '9ywqa0xx': {
      'en': 'Bronx, New York',
      'ar': '',
    },
    '0e3hlktv': {
      'en': 'Applied:',
      'ar': '',
    },
    'hm318c1y': {
      'en': 'A few moments ago',
      'ar': '',
    },
    'sc66wmlu': {
      'en': 'Chef  Needed',
      'ar': '',
    },
    'ys2k8wfy': {
      'en': 'New cairo, Eygpt',
      'ar': '',
    },
    '02033kik': {
      'en': 'Rabea Mohamed',
      'ar': '',
    },
    'p6o3am4f': {
      'en': 'Up to 70 EGP',
      'ar': '',
    },
    'fkbg7394': {
      'en': '4.5',
      'ar': '',
    },
    'u9xe986u': {
      'en': '(140)',
      'ar': '',
    },
    'tzmm50mq': {
      'en': 'Applied:',
      'ar': '',
    },
    'dpt43yhi': {
      'en': '5 min ago',
      'ar': '',
    },
    'hwccexrh': {
      'en': 'Mazen',
      'ar': '',
    },
    'shmfqi45': {
      'en': 'Up to 50 EGP',
      'ar': '',
    },
    'kjunl1dv': {
      'en': '3.5',
      'ar': '',
    },
    'iukat4v3': {
      'en': '(242)',
      'ar': '',
    },
    'yrb46u02': {
      'en': 'Applied:',
      'ar': '',
    },
    'fn6bfggj': {
      'en': '7 min ago',
      'ar': '',
    },
    'lsdb91br': {
      'en': 'Ahmed Mohamed',
      'ar': '',
    },
    '9v063r0c': {
      'en': 'Up to 45 EGP',
      'ar': '',
    },
    'ioc5t00e': {
      'en': '2.5',
      'ar': '',
    },
    'xx8vvctq': {
      'en': '(55)',
      'ar': '',
    },
    'yiys12g0': {
      'en': 'Applied:',
      'ar': '',
    },
    'bdgyes1u': {
      'en': '10 min ago',
      'ar': '',
    },
    'unzx3nxy': {
      'en': 'Applicant Name',
      'ar': '',
    },
    'd7c9bngf': {
      'en': 'UX Designer',
      'ar': '',
    },
    'xs2s7ett': {
      'en': 'Bronx, New York',
      'ar': '',
    },
    'jsowwghx': {
      'en': 'Applied:',
      'ar': '',
    },
    'xkfnfzsy': {
      'en': 'A few moments ago',
      'ar': '',
    },
    'u5ptq4cx': {
      'en': 'Fast delivery Needed',
      'ar': '',
    },
    'r5cbh033': {
      'en': 'Zagazig, Eygpt',
      'ar': '',
    },
    'a19yyj3f': {
      'en': 'Mohamed hassan',
      'ar': '',
    },
    'do4zv1oe': {
      'en': 'Up to 70 EGP',
      'ar': '',
    },
    '3fahvxig': {
      'en': '4.5',
      'ar': '',
    },
    '3m2lar17': {
      'en': '(140)',
      'ar': '',
    },
    '49042l0p': {
      'en': 'Applied:',
      'ar': '',
    },
    'b93yhbyi': {
      'en': '5 min ago',
      'ar': '',
    },
    'qk82gt5r': {
      'en': 'Amir amr',
      'ar': '',
    },
    'x0v1mvbc': {
      'en': 'Up to 50 EGP',
      'ar': '',
    },
    'dryr8nt5': {
      'en': '3.5',
      'ar': '',
    },
    '3g0asxxq': {
      'en': '(242)',
      'ar': '',
    },
    '2ztyysj1': {
      'en': 'Applied:',
      'ar': '',
    },
    'rzgi9bqf': {
      'en': '7 min ago',
      'ar': '',
    },
    'n70njiwn': {
      'en': 'Tawfek',
      'ar': '',
    },
    'hp8ulg4x': {
      'en': 'Up to 45 EGP',
      'ar': '',
    },
    'zjfypxqg': {
      'en': '2.5',
      'ar': '',
    },
    'waqxyioa': {
      'en': '(55)',
      'ar': '',
    },
    'm4i3t2dm': {
      'en': 'Applied:',
      'ar': '',
    },
    '3eicebwe': {
      'en': '10 min ago',
      'ar': '',
    },
    'p79mxr7x': {
      'en': 'Abanob',
      'ar': '',
    },
    'r924vjph': {
      'en': 'Up to 30 EGP',
      'ar': '',
    },
    'd6vuf0cv': {
      'en': '1.5',
      'ar': '',
    },
    '25ey43of': {
      'en': '(22)',
      'ar': '',
    },
    'pxn9mnjs': {
      'en': 'Applied:',
      'ar': '',
    },
    'go3r2s3j': {
      'en': '20 min ago',
      'ar': '',
    },
    '1uk4sj3v': {
      'en': 'Applicant Name',
      'ar': '',
    },
    'keyioxex': {
      'en': 'UX Designer',
      'ar': '',
    },
    'zr3wfebk': {
      'en': 'Bronx, New York',
      'ar': '',
    },
    '1gb83zo4': {
      'en': 'Applied:',
      'ar': '',
    },
    '7ifemdkf': {
      'en': 'A few moments ago',
      'ar': '',
    },
    'xd74arl4': {
      'en': 'Activity',
      'ar': '',
    },
  },
  // e1_home-vendorCopy
  {
    'v0gy59a9': {
      'en': 'Job List',
      'ar': '',
    },
    '77imxlg3': {
      'en': 'Active',
      'ar': '',
    },
    'sjj544cv': {
      'en': 'Inactive',
      'ar': '',
    },
    '2ol1chyy': {
      'en': 'Status',
      'ar': '',
    },
    'r66y634v': {
      'en': 'Search for an item...',
      'ar': '',
    },
    't6rg3ner': {
      'en': 'Search',
      'ar': '',
    },
    'd4om3kzv': {
      'en': 'Welcome, Mohamed',
      'ar': '',
    },
    '4mo5vyla': {
      'en': 'Create Post',
      'ar': '',
    },
    'ofwwig04': {
      'en': 'Recent Job Posts',
      'ar': '',
    },
    'vrihkjxv': {
      'en': 'Below you will find recent job posts,.',
      'ar': '',
    },
    '5bn3c0hu': {
      'en': 'Engineer',
      'ar': '',
    },
    'nqs0w617': {
      'en': ' • ',
      'ar': '',
    },
    'e9gyflm5': {
      'en': '4 mins ago',
      'ar': '',
    },
    'fdf8m7mk': {
      'en': 'Electrical Engineer',
      'ar': '',
    },
    '6nq3bm2l': {
      'en':
          'Hey everyone, can any specialist fit my car\'s engine problem pleease....',
      'ar': '',
    },
    '9buy9kj3': {
      'en': '21',
      'ar': '',
    },
    'glct1rea': {
      'en': '12',
      'ar': '',
    },
    '9gj85nqw': {
      'en': 'Zagazig, Eygpt',
      'ar': '',
    },
    'uxjtxhfe': {
      'en': 'Technical',
      'ar': '',
    },
    'zg5ltqpi': {
      'en': ' • ',
      'ar': '',
    },
    '04y3fkhl': {
      'en': '6 mins ago',
      'ar': '',
    },
    'd5ql7wv6': {
      'en': 'Electrical Engineer',
      'ar': '',
    },
    's0qf32cv': {
      'en':
          'Hey everyone, can any specialist tell me whats wrong with my fan it doesn\'t work like before pleease....',
      'ar': '',
    },
    '7a4n3o55': {
      'en': '21',
      'ar': '',
    },
    'y8n1ghsi': {
      'en': '12',
      'ar': '',
    },
    '2pub5dax': {
      'en': 'Zagazig, Eygpt',
      'ar': '',
    },
    'h0jtkbbb': {
      'en': 'Delivery',
      'ar': '',
    },
    'ib2i8hxw': {
      'en': ' • ',
      'ar': '',
    },
    'gwtyfihg': {
      'en': '10 mins ago',
      'ar': '',
    },
    'rc28jsuk': {
      'en': 'Fast delivery',
      'ar': '',
    },
    'qlrsm07k': {
      'en':
          'Hello guys i delever any product from any where in short time if you want my service contact with me.',
      'ar': '',
    },
    'r7lcczpw': {
      'en': '21',
      'ar': '',
    },
    '4a1w5lqo': {
      'en': '12',
      'ar': '',
    },
    'occ34lzu': {
      'en': 'Zagazig, Eygpt',
      'ar': '',
    },
    '1wt8gal5': {
      'en': 'Food',
      'ar': '',
    },
    'pmlwjppw': {
      'en': ' • ',
      'ar': '',
    },
    '1kcyfh17': {
      'en': '19 mins ago',
      'ar': '',
    },
    '5wi7h3oz': {
      'en': 'The Chef',
      'ar': '',
    },
    'qi56gt8p': {
      'en': 'My food you will never ever get like it in your life try my food.',
      'ar': '',
    },
    '85vy8zgi': {
      'en': '21',
      'ar': '',
    },
    'ipqhc1nk': {
      'en': '12',
      'ar': '',
    },
    '1avomdwz': {
      'en': 'Zagazig, Eygpt',
      'ar': '',
    },
    '8oemam90': {
      'en': 'Vendor',
      'ar': '',
    },
  },
  // e3_Applytojobdetails
  {
    'hhlnsdwk': {
      'en': 'Price:',
      'ar': '',
    },
    'bf4m47bu': {
      'en':
          '                                                                                                   EGP',
      'ar': '',
    },
    'xgi2g29e': {
      'en': 'Description:',
      'ar': '',
    },
    'x8bga16k': {
      'en': 'Submit',
      'ar': '',
    },
    '0b8za4qy': {
      'en': 'Field is required',
      'ar': '',
    },
    '7egsx8kr': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'c4yzmq9d': {
      'en': 'Field is required',
      'ar': '',
    },
    'ux9txlwf': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'mzw12ye6': {
      'en': 'Home',
      'ar': '',
    },
  },
  // e3_Applytojobdetails2
  {
    '697msdkf': {
      'en': 'Engineer',
      'ar': '',
    },
    '78xkhsfq': {
      'en': 'Electrical Engineer',
      'ar': '',
    },
    'c8e5rz2g': {
      'en': 'Job Requirements',
      'ar': '',
    },
    'o5lvr4i8': {
      'en': 'Zagazig, Eygpt',
      'ar': '',
    },
    'p6mw4ckt': {
      'en': 'Price:',
      'ar': '',
    },
    'tr0otn2n': {
      'en':
          '                                                                                                   EGP',
      'ar': '',
    },
    '1z2u0koy': {
      'en': 'Description:',
      'ar': '',
    },
    '69u856p7': {
      'en': 'Submit',
      'ar': '',
    },
    'rb3spm2j': {
      'en': 'Home',
      'ar': '',
    },
  },
  // AllChatsPage
  {
    'ng3lz6fj': {
      'en': 'All Chats',
      'ar': '',
    },
  },
  // Intro
  {
    'cnoy28jx': {
      'en': 'Home',
      'ar': '',
    },
  },
  // d5_vendorActivity
  {
    'i6umaa43': {
      'en': 'Your Bids',
      'ar': '',
    },
    '59i4ohlg': {
      'en': 'Welcome, Mohamed',
      'ar': '',
    },
    'zioyc3q1': {
      'en': 'Your Bids',
      'ar': '',
    },
    '6sd8q9aq': {
      'en': 'Activity',
      'ar': '',
    },
  },
  // layer
  {
    'f2oo5gb8': {
      'en': 'Home',
      'ar': '',
    },
  },
  // f1_ccountSettingsCopy
  {
    '51oebal1': {
      'en': 'Account Settings',
      'ar': '',
    },
    'lflu7odj': {
      'en': 'Documents',
      'ar': '',
    },
    '5b6ndu7t': {
      'en': 'Notifications',
      'ar': '',
    },
    'xd0636dd': {
      'en': 'Settings',
      'ar': '',
    },
    's8r19sbn': {
      'en': 'Profile Settings',
      'ar': '',
    },
    '26loj3s0': {
      'en': 'Language',
      'ar': '',
    },
    '3cxis9fj': {
      'en': 'English',
      'ar': '',
    },
    '4e51a8e1': {
      'en': 'Messages',
      'ar': '',
    },
    'jos681vs': {
      'en': 'Earn by Providing services',
      'ar': '',
    },
    '7bi9tv0k': {
      'en': 'App Settings',
      'ar': '',
    },
    'xybuasbp': {
      'en': 'Terms of Service',
      'ar': '',
    },
    't1uesraa': {
      'en': 'Help Center',
      'ar': '',
    },
    'xfubs02j': {
      'en': 'Dark Mode',
      'ar': '',
    },
    '4l75mxju': {
      'en': 'Account',
      'ar': '',
    },
  },
  // community
  {
    'i1arp6ih': {
      'en': 'community ',
      'ar': '',
    },
    'vnrwk5xm': {
      'en': 'Search',
      'ar': '',
    },
    'rm1ewa21': {
      'en': 'Welcome, Mohamed',
      'ar': '',
    },
    'eaphd7xr': {
      'en': 'Activity',
      'ar': '',
    },
  },
  // court_rateCourt
  {
    'zwmm57ic': {
      'en': 'Rate Service',
      'ar': '',
    },
    'jak9956w': {
      'en': 'Rate the Location\'s service below.',
      'ar': '',
    },
    '7i0v7xc4': {
      'en': 'What would you rate this service?',
      'ar': '',
    },
    '2lyydw3t': {
      'en': 'Write a comment',
      'ar': '',
    },
    'g9tyh1td': {
      'en': 'Text here...',
      'ar': '',
    },
    'idrlp3sg': {
      'en': 'Submit Rating',
      'ar': '',
    },
  },
  // e2_Jobdetails
  {
    '6mhtbsdp': {
      'en': 'Engineer',
      'ar': '',
    },
    'j8swbiso': {
      'en': '4 mins ago',
      'ar': '',
    },
    'lqwq0v98': {
      'en': 'Job Requirements',
      'ar': '',
    },
    'x045246z': {
      'en': 'Apply to Job',
      'ar': '',
    },
  },
  // ZZZApplications
  {
    'gjyhzjbq': {
      'en': 'Applications',
      'ar': '',
    },
    'wzrq9s9s': {
      'en': 'Below you will find recent applications that have been posted',
      'ar': '',
    },
    'kl535hh6': {
      'en': 'Company Name',
      'ar': '',
    },
    'wpstw2oe': {
      'en': 'Applicant Details',
      'ar': '',
    },
    'cxz2k66t': {
      'en': 'UI/UX Designer Needed',
      'ar': '',
    },
    'm3qotpbo': {
      'en': 'Up to \$70k',
      'ar': '',
    },
    'r7pka6xy': {
      'en': 'Bronx, New York',
      'ar': '',
    },
    '4ac4rgnj': {
      'en': 'Applicant Name',
      'ar': '',
    },
    'x2xlndld': {
      'en': 'UX Designer',
      'ar': '',
    },
    'jhz2tqwg': {
      'en': 'Bronx, New York',
      'ar': '',
    },
    'v6ghq9zl': {
      'en': 'Applied:',
      'ar': '',
    },
    'yzjhi0rg': {
      'en': 'A few moments ago',
      'ar': '',
    },
    'u0v4xjs7': {
      'en': 'Applicant Name',
      'ar': '',
    },
    'we750ei9': {
      'en': 'UX Designer',
      'ar': '',
    },
    'tk1glwol': {
      'en': 'Bronx, New York',
      'ar': '',
    },
    'bhheenka': {
      'en': 'Applied:',
      'ar': '',
    },
    'swi6o7yx': {
      'en': 'A few moments ago',
      'ar': '',
    },
    '1bgypr4o': {
      'en': 'Proficient FlutterFlow Developer',
      'ar': '',
    },
    'um0ii3n9': {
      'en': 'Up to \$70k',
      'ar': '',
    },
    'qlgkw10v': {
      'en': 'Bronx, New York',
      'ar': '',
    },
    'fug34alp': {
      'en': 'Applicant Name',
      'ar': '',
    },
    '7u15lvsl': {
      'en': 'UX Designer',
      'ar': '',
    },
    'h14tnly1': {
      'en': 'Bronx, New York',
      'ar': '',
    },
    'sa16eyz5': {
      'en': 'Applied:',
      'ar': '',
    },
    'vy8j1r5m': {
      'en': 'A few moments ago',
      'ar': '',
    },
    'n9nnz4mk': {
      'en': 'Applicant Name',
      'ar': '',
    },
    'l3er2c49': {
      'en': 'UX Designer',
      'ar': '',
    },
    'oibfet3q': {
      'en': 'Bronx, New York',
      'ar': '',
    },
    'yozgclx2': {
      'en': 'Applied:',
      'ar': '',
    },
    's9i7nlpr': {
      'en': 'A few moments ago',
      'ar': '',
    },
    '1ea28l0p': {
      'en': 'Proficient FlutterFlow Developer',
      'ar': '',
    },
    '7vv3x2dw': {
      'en': 'Up to \$70k',
      'ar': '',
    },
    '5fqhab88': {
      'en': 'Bronx, New York',
      'ar': '',
    },
    'ikpux3w1': {
      'en': 'Applicant Name',
      'ar': '',
    },
    'lwii7jnb': {
      'en': 'UX Designer',
      'ar': '',
    },
    'tgyt8hth': {
      'en': 'Bronx, New York',
      'ar': '',
    },
    'v0830dt9': {
      'en': 'Applied:',
      'ar': '',
    },
    'j4ijskhu': {
      'en': 'A few moments ago',
      'ar': '',
    },
    '437y007j': {
      'en': 'Applicant Name',
      'ar': '',
    },
    'ql7xffqu': {
      'en': 'UX Designer',
      'ar': '',
    },
    '65v0hr52': {
      'en': 'Bronx, New York',
      'ar': '',
    },
    'cn47ae5o': {
      'en': 'Applied:',
      'ar': '',
    },
    '9widee3a': {
      'en': 'A few moments ago',
      'ar': '',
    },
    '6kbok07j': {
      'en': 'Proficient FlutterFlow Developer',
      'ar': '',
    },
    '0agjyu88': {
      'en': 'Up to \$70k',
      'ar': '',
    },
    'zjsj1pm3': {
      'en': 'Bronx, New York',
      'ar': '',
    },
    'tfvtxshc': {
      'en': 'Applicant Name',
      'ar': '',
    },
    'rf0hp94e': {
      'en': 'UX Designer',
      'ar': '',
    },
    '9g3fxb39': {
      'en': 'Bronx, New York',
      'ar': '',
    },
    '5org7ijx': {
      'en': 'Applied:',
      'ar': '',
    },
    '2sptsqoq': {
      'en': 'A few moments ago',
      'ar': '',
    },
    'x5ip5a3p': {
      'en': 'Applicant Name',
      'ar': '',
    },
    '45nyx9os': {
      'en': 'UX Designer',
      'ar': '',
    },
    'xayd7g36': {
      'en': 'Bronx, New York',
      'ar': '',
    },
    'mzpy9bm2': {
      'en': 'Applied:',
      'ar': '',
    },
    '8jvuil3m': {
      'en': 'A few moments ago',
      'ar': '',
    },
  },
  // d4_applicationdetails
  {
    'xigl5ml5': {
      'en': 'Engineer',
      'ar': '',
    },
    'rarkl3uw': {
      'en': '4.5',
      'ar': '',
    },
    'z6lcfh5s': {
      'en': '(140)',
      'ar': '',
    },
    '60wd6e4e': {
      'en': 'About',
      'ar': '',
    },
    'mgmb2rj2': {
      'en': 'Email:',
      'ar': '',
    },
    'uyi0nvb7': {
      'en': 'Number:',
      'ar': '',
    },
    'z8qe9onh': {
      'en': 'Applied:',
      'ar': '',
    },
    '2zq168ge': {
      'en': '5 min ago',
      'ar': '',
    },
    'dx6b4mcz': {
      'en': 'Call',
      'ar': '',
    },
    '9sdz9f6b': {
      'en': 'Message',
      'ar': '',
    },
    '7xob1ifa': {
      'en': 'WhatsApp',
      'ar': '',
    },
  },
  // Cardv2
  {
    '2uq53hom': {
      'en': '4.7',
      'ar': '',
    },
    'soqpw45d': {
      'en': 'Active',
      'ar': '',
    },
    'uul348mi': {
      'en': '+040223556',
      'ar': '',
    },
  },
  // myTestBottomSheet2
  {
    'v6sdhvpf': {
      'en': '[Display_Name]',
      'ar': '',
    },
    'x0s80xp1': {
      'en': '4.7',
      'ar': '',
    },
    'bddn9djb': {
      'en': 'Active',
      'ar': '',
    },
    'g2n3kosq': {
      'en': '+040223556',
      'ar': '',
    },
    'h2sv6soo': {
      'en': '27 Old Grocery',
      'ar': '',
    },
  },
  // e2_JobdetailsCopy
  {
    'trba2qzl': {
      'en': 'Engineer',
      'ar': '',
    },
    '0o43a8tj': {
      'en': '4 mins ago',
      'ar': '',
    },
    '94b416og': {
      'en':
          'Hey everyone, can any specialist fit my car\'s engine problem pleease....',
      'ar': '',
    },
    '4txtuq5j': {
      'en': 'Job Requirements',
      'ar': '',
    },
    'qjzyij3h': {
      'en': 'Zagazig, Eygpt',
      'ar': '',
    },
    'ik9mulc6': {
      'en': 'Apply to Job',
      'ar': '',
    },
  },
  // Cardv2Copy
  {
    'kn7qzuh1': {
      'en': '4.7',
      'ar': '',
    },
    't5rrdkc5': {
      'en': 'Active',
      'ar': '',
    },
    'mqjoenjb': {
      'en': '+040223556',
      'ar': '',
    },
    '4avxuuh7': {
      'en': '27 Old Grocery',
      'ar': '',
    },
  },
  // navbar
  {
    '1b9z0q0v': {
      'en': 'Home',
      'ar': '',
    },
    'f0dh6qxi': {
      'en': 'Activity',
      'ar': '',
    },
    '32613kt3': {
      'en': 'Account',
      'ar': '',
    },
    'v6zrau27': {
      'en': 'community ',
      'ar': '',
    },
  },
  // empty
  {
    'r4li32el': {
      'en': 'No Data',
      'ar': '',
    },
    'wb0jibj3': {
      'en': 'Maybe there no data try later.',
      'ar': '',
    },
  },
  // Miscellaneous
  {
    'eya9a7ar': {
      'en': '',
      'ar': '',
    },
    '4d0l1zte': {
      'en': '',
      'ar': '',
    },
    'xbl4cqkd': {
      'en': '',
      'ar': '',
    },
    '06fjtqc9': {
      'en': '',
      'ar': '',
    },
    'gebsuv3a': {
      'en': '',
      'ar': '',
    },
    'basxv2dx': {
      'en': '',
      'ar': '',
    },
    'edc4rbxw': {
      'en': '',
      'ar': '',
    },
    'c82jwg17': {
      'en': '',
      'ar': '',
    },
    'rz1ydfik': {
      'en': '',
      'ar': '',
    },
    'ukz5se1d': {
      'en': '',
      'ar': '',
    },
    'w8qmgrzd': {
      'en': '',
      'ar': '',
    },
    'bhk264cl': {
      'en': '',
      'ar': '',
    },
    'ml2a3xe9': {
      'en': '',
      'ar': '',
    },
    'deg3bjpi': {
      'en': '',
      'ar': '',
    },
    'am569uio': {
      'en': '',
      'ar': '',
    },
    'l3jvckkf': {
      'en': '',
      'ar': '',
    },
    '1lj8bj00': {
      'en': '',
      'ar': '',
    },
    'nper1f6f': {
      'en': '',
      'ar': '',
    },
    'vnc0yif6': {
      'en': '',
      'ar': '',
    },
    'jqi87z7j': {
      'en': '',
      'ar': '',
    },
    'fekyic4y': {
      'en': '',
      'ar': '',
    },
    '9sfglg55': {
      'en': '',
      'ar': '',
    },
    'titbepwn': {
      'en': '',
      'ar': '',
    },
    'i1lavo0c': {
      'en': '',
      'ar': '',
    },
    'gffly3dm': {
      'en': '',
      'ar': '',
    },
    'swq3xdr7': {
      'en': '',
      'ar': '',
    },
    's4xettan': {
      'en': '',
      'ar': '',
    },
    '4p7a6uh2': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
