import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:kalpaka_app/core/global_variables/global_variables.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/pallete.dart';
import '../auth/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController phnController = TextEditingController();

  Country country = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: "India",
    displayName: "India",
    displayNameNoCountryCode: "IN",
    e164Key: "",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Pallete.containerColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          height: h,
          width: w,
          color: Pallete.containerColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: h * 0.27,
                width: w * 0.6,
                color: Colors.blue,
                // child: const Image(
                //   image: AssetImage(AssetConstants.logo),
                // ),
              ),
              SizedBox(
                height: h * 0.12,
              ),
              Container(
                width: w,
                height: h * 0.34,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Pallete.shadowColor,
                        blurRadius: 15,
                        spreadRadius: 1,
                        offset: Offset(4, 1))
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(h * 0.05),
                    topRight: Radius.circular(h * 0.05),
                  ),
                  color: Pallete.primaryColor,
                ),
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: h * 0.04, right: h * 0.04, top: h * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sign in',
                          style: TextStyle(
                              fontSize: w * 0.06, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Sign in to get started quickly',
                          style: TextStyle(
                            fontSize: w * 0.03,
                          ),
                        ),
                        SizedBox(
                          height: h * 0.03,
                        ),
                        TextFormField(
                          cursorColor: Pallete.secondaryColor,
                          controller: phnController,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                              fontSize: h * 0.0165,
                              fontWeight: FontWeight.w700),
                          decoration: InputDecoration(
                            hintText: 'Enter Phone Number',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(h * 0.02),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(h * 0.02),
                            ),
                            prefixIcon: Container(
                              padding: EdgeInsets.all(h * 0.015),
                              child: InkWell(
                                onTap: () {
                                  showCountryPicker(
                                    context: context,
                                    onSelect: (value) {
                                      setState(() {
                                        country = value;
                                      });
                                    },
                                  );
                                },
                                child: Text(
                                  '${country.flagEmoji}  + ${country.phoneCode}',
                                  style: TextStyle(
                                      fontSize: h * 0.0165,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
                          validator: (phone) {
                            if (phone == null || phone.isEmpty) {
                              return 'Phone number is required';
                            }
                            if (phone.length != 13) {
                              return 'Phone number must be 10 digits';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: h * 0.03),
                        Center(
                          child: InkWell(
                            onTap: () => sendPhoneNumber(),
                            child: Container(
                              height: h * 0.065,
                              width: w,
                              decoration: BoxDecoration(
                                  color: Pallete.secondaryColor,
                                  borderRadius:
                                      BorderRadiusDirectional.circular(20),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 15,
                                        spreadRadius: 1,
                                        offset: Offset(4, 1))
                                  ]),
                              child: Center(
                                child: Text(
                                  "GET OTP",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: h * 0.017),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void sendPhoneNumber() {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    String phoneNumber = phnController.text.trim();
    ap.signInWithPhone(context, "+${country.phoneCode}$phoneNumber");
  }
}
