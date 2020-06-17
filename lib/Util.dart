
import 'package:shared_preferences/shared_preferences.dart';

class Util
{
  static String myHomeTitle = 'Home Menu';
  static String myHomeDescription = 'Click home button for view all all application profile settings and other options';

  static String myProfileTitle = 'Profile Settings';
  static String myProfileDescription = 'Set your profile with all details like Name, Profile Pic, etc.';

  static String myLocationTitle = 'Location';
  static String myLocationDescription = 'You can track center location from your current location.';



 static addCoachMark(value) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('tutorial_coach_mark', value);

    print(prefs.getBool('tutorial_coach_mark'));
  }


 static Future<bool> getCoachMark() async
 {
   SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('tutorial_coach_mark')?? false;
 }

}