

import 'package:flutter/material.dart';

import '../../../data.dart';
import '../../../shared/models/result_data_model.dart';
import '../../../shared/widgets/app_main_button.dart';
import '../../select_mode/screens/select_mode_screen.dart';

class TreatmentScreen extends StatefulWidget {
  String title = "";
  TreatmentScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<TreatmentScreen> createState() => _TreatmentScreenState();
}

class _TreatmentScreenState extends State<TreatmentScreen> {
  late ResultData resultData;

  @override
  void initState() {
    // TODO: implement initState
    switch (widget.title) {
      case 'Leaf Curl':
        resultData = resultDatas[0];
        break;
      case 'Leaf Miner':
        resultData = resultDatas[1];
        break;
      case 'Leaf Yellowing':
        resultData = resultDatas[2];
        break;
      case 'Septoria Leaf Spot':
        resultData = resultDatas[3];
        break;
      default:
        resultData = resultDatas[0];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Treatments'), backgroundColor: Colors.green,),
      backgroundColor: const Color(0xffdef1da),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: double.infinity, height: 10,),
            Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(resultData.title ?? "Result",style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 28, color: Colors.green),),
            ),

            Image.asset(resultData.img),
            Padding(
              padding: EdgeInsets.all(18.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),),
                width: double.infinity,
                padding: EdgeInsets.all(20),

                child: Text(resultData.treatment ?? "Result",
                  textAlign: TextAlign.start,
                  style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black),),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(18.0),
              child: AppMainButton(
                text: "Start Again",
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => SelectModeScreen()));
                },
                width: MediaQuery.of(context).size.width * 3 / 4,
              ),
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
