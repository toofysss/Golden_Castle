import 'package:coldencastle/constant/constant.dart';
import 'package:coldencastle/screen/electronictransactions/Certificate%20of%20Origin/information.dart';
import 'package:flutter/material.dart';

class ElectronicCertificateOfOrigin extends StatefulWidget {
  const ElectronicCertificateOfOrigin({super.key});

  @override
  State<ElectronicCertificateOfOrigin> createState() => _ElectronicCertificateOfOriginsState();
}

class _ElectronicCertificateOfOriginsState extends State<ElectronicCertificateOfOrigin> {


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        //  رجوع
       
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: ElectronicTransactionsClass.pageControllers,
          children: const [
CertificateOfRiginInformation()
          ],
        ),
      ),
    );
  }
}
