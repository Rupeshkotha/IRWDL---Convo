import "package:convo/Common/utils/utils.dart";
import "package:convo/Features/authorisation/controller/auth_controller.dart";
import "package:convo/colors.dart";
import "package:country_picker/country_picker.dart";
import "package:flutter/material.dart";
import 'package:convo/Common/widgets/custom_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeName = '/login-screen';
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}



  final TextEditingController phoneController = TextEditingController();
  Country selectedCountry = Country(
    phoneCode: '91',
    countryCode: 'IN',
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: 'India',
    example: 'India',
    displayName: 'India',
    displayNameNoCountryCode: 'IN',
    e164Key: "",
  );

  class _LoginScreenState extends ConsumerState<LoginScreen> {
  void sendPhoneNumber() {
    String phoneNumber = phoneController.text.trim();
    if (phoneNumber.isNotEmpty) {
      ref.read(authControllerProvider).signInWithPhone(context, '+${selectedCountry.phoneCode}$phoneNumber');
    } else {
      showSnackBar(context: context, content: 'Fill out Reqiured Fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    phoneController.selection = TextSelection.fromPosition(
      TextPosition(
        offset: phoneController.text.length,
      ),
    );
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
            child: Column(
              children: [
                const SizedBox(
                  width: 200,
                  height: 200,
                ),
                const SizedBox(height: 20),
                const Text(
                  "Get Started",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Convo Needs To Verify Your Phone Number. We'll send you a verification code",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black38,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 45),
                TextFormField(
                  cursorColor: Colors.amber,
                  controller: phoneController,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  onChanged: (value) {
                    setState(() {
                      phoneController.text = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Enter Phone number",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.grey.shade600,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                    prefixIcon: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: () {
                              showCountryPicker(
                                  context: context,
                                  countryListTheme: const CountryListThemeData(
                                      bottomSheetHeight: 500),
                                  onSelect: (value) {
                                    setState(() {
                                      selectedCountry = value;
                                    });
                                  });
                            },
                            child: Text(
                              "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: black,
                                  fontWeight: FontWeight.bold),
                            ))),
                    suffixIcon: phoneController.text.length > 9
                        ? Container(
                            height: 30,
                            width: 30,
                            margin: const EdgeInsets.all(10.0),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.green),
                            child: const Icon(
                              Icons.done,
                              color: Colors.white,
                              size: 20,
                            ),
                          )
                        : null,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: 90,
                  child: CustomBotton(
                    onPressed: () => sendPhoneNumber,
                    text: 'Next',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
