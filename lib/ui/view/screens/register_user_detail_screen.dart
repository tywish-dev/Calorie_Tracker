import 'package:calorie_tracker/data/constants/constants.dart';
import 'package:calorie_tracker/ui/view/screens/login_screen.dart';
import 'package:calorie_tracker/ui/view/widgets/login/custom_button.dart';
import 'package:provider/provider.dart';
import '../../providers/bmi_provider.dart';
import '../widgets/register/gender_card.dart';
import '../widgets/register/numeric_card.dart';
import '../widgets/register/slider_card.dart';
import 'package:flutter/material.dart';

class RegisterUserDetail extends StatelessWidget {
  const RegisterUserDetail({super.key});

  @override
  Widget build(BuildContext context) {
    BmiProvider bmiProvider = Provider.of<BmiProvider>(context);
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
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const LoginScreen(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
