
import 'package:happy_tech_mastering_api_with_flutter/screens/profile_screen.dart';
import 'package:happy_tech_mastering_api_with_flutter/utilities/pages_names.dart';
import 'package:page_transition/page_transition.dart';

onGenerateRoute(settings)
{

  switch(settings.name)
  {
    case PagesNames.profilePage:
      return
        PageTransition(
            child: const ProfileScreen(),
            type: PageTransitionType.leftToRight,
            settings: settings

        );
  }

}