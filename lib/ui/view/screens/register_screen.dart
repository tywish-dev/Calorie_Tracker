import 'package:calorie_tracker/ui/view/widgets/signUp/user_information.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return UserInformation(
        image: "assets/userInformation/height.png",
        text: "height(cm)",
        value: 0,
        maxValue: 250);
  }
}
