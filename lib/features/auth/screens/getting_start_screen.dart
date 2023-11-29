import 'package:leafdiseasedetection/main.dart';
import 'package:flutter/material.dart';

import '../../../shared/widgets/app_main_button.dart';
import 'login_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: double.infinity,
                height: 60,
              ),
              Image.asset('assets/images/logo.png'),
              const Text(
                "Detecting tomato diseases early, \nfor a healthier harvest.",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                    fontSize: 18,
                    color: Color(0xffadadad)),
              ),

              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffA0D991),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  width: double.infinity,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Image.asset('assets/images/planthand.png'),
                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.15
                      ),
                      AppMainButton(
                        text: "CONTINUE",
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => LoginScreen()));
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
