
import 'package:flutter/material.dart';
import 'package:leafdiseasedetection/features/result/screens/treatments_screen.dart';

import '../../../data.dart';
import '../../../shared/models/result_data_model.dart';
import '../../../shared/widgets/app_main_button.dart';
import '../../select_mode/screens/select_mode_screen.dart';

class DetailScreen extends StatefulWidget {
  String title = " ";
  DetailScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
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
      appBar: AppBar(title: Text('Result'), backgroundColor: Colors.green,),
      backgroundColor: const Color(0xffdef1da),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: double.infinity, height: 30,),
            Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(resultData.title ?? "Result",style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 32, color: Colors.green),),
            ),

            Image.asset(resultData.img),
            Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(resultData.description ?? "Result",style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.black),),
            ),
            const SizedBox(height: 20,),



            Padding(
              padding: const EdgeInsets.all(18.0),
              child: AppMainButton(
                text: "View Treatments",
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => TreatmentScreen(title: resultData.title)));
                },
                width: MediaQuery.of(context).size.width * 3 / 4,
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


          ],
        ),
      ),
    );
  }
}
