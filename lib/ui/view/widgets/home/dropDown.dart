import 'package:calorie_tracker/data/constants/constants.dart';
import 'package:calorie_tracker/ui/view/screens/about_us.dart';
import 'package:calorie_tracker/ui/view/screens/login_screen.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeDropDown extends StatelessWidget {
  const HomeDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      'About Us',
    ];
    String? selectedValue;
    return Center(
      child: DropdownButtonHideUnderline(
        child: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: DropdownButton2(
            customButton: const Icon(
              Icons.list,
              size: 46,
              color: Colors.black,
            ),
            items: items
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Center(
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ))
                .toList(),
            value: selectedValue,
            onChanged: (value) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutUsScreen(),
                ),
              );
            },
            buttonStyleData: ButtonStyleData(
              height: 50,
              width: 160,
              padding: const EdgeInsets.only(left: 14, right: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Colors.black26,
                ),
                color: bgGreen,
              ),
              elevation: 2,
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 200,
              width: 200,
              padding: null,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: bgGreen,
              ),
              elevation: 8,
              offset: const Offset(-20, 0),
              scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(40),
                thickness: MaterialStateProperty.all<double>(6),
                thumbVisibility: MaterialStateProperty.all<bool>(true),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 60,
              padding: EdgeInsets.only(left: 14, right: 14),
            ),
          ),
        ),
      ),
    );
  }
}
