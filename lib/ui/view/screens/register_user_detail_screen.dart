import 'package:calorie_tracker/data/constants/constants.dart';
import 'package:calorie_tracker/data/services/user_services.dart';
import 'package:calorie_tracker/ui/view/screens/login_screen.dart';
import 'package:provider/provider.dart';
import '../../providers/bmi_provider.dart';
import '../../providers/user_auth_provider.dart';
import '../widgets/register/gender_card.dart';
import '../widgets/register/numeric_card.dart';
import '../widgets/register/slider_card.dart';
import 'package:flutter/material.dart';

class RegisterUserDetail extends StatelessWidget {
  const RegisterUserDetail({super.key});

  @override
  Widget build(BuildContext context) {
    BmiProvider bmiProvider = Provider.of<BmiProvider>(context);
    UserAuthProvider userAuthProvider = Provider.of<UserAuthProvider>(context);
    BmiProvider bmiInformation = Provider.of<BmiProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                GenderCard(
                  gender: 1,
                ),
                GenderCard(
                  gender: 0,
                ),
              ],
            ),
            Container(
              width: size.width * 0.78,
              height: size.height * 0.25,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 26, 23, 29),
                  borderRadius: BorderRadius.circular(15)),
              child: const SliderCard(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                NumericCard(
                  numeric: 0,
                ),
                NumericCard(
                  numeric: 1,
                ),
              ],
            ),
            ElevatedButton(
              child: Text(
                "Get Started",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(bgGreen)),
              onPressed: () async {
                userAuthProvider.user!.gender =
                    bmiProvider.getGender == 1 ? "Male" : "Female";
                userAuthProvider.user!.height = bmiProvider.getHeight.toInt();
                userAuthProvider.user!.weight = bmiProvider.getWeight;
                userAuthProvider.user!.age = bmiProvider.getAge;
                bmiInformation
                    .setHeight(userAuthProvider.user!.height!.toDouble());
                bmiInformation.setWeight(userAuthProvider.user!.weight!);
                await UserServices().updateUserById(
                    userAuthProvider.user!.localId!, userAuthProvider.user!);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const LoginScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
