



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher.dart';
import '../../utills/FontSize.dart';

class CustomWidget extends StatelessWidget {

  CustomWidget();


  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
  @override
  Widget build(BuildContext context)
  {
    return Center(
        child: InkWell(
          onTap: () {
            // launchUrl(Uri.parse('https://pmagy.gov.in/new-dashboard/Terms-And-Condition'))
          }

          ,child: RichText(

          text: TextSpan(

            text: ' By signing up, you agree to our ',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: FontSize.sp_13,
            ),
            children: const [
              TextSpan(
                text: '\nTerms of Use',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.blue,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
              TextSpan(
                text: ' and ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
              TextSpan(
                text: ' Privacy Policy ',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.blue,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),

        ),
        )
    );



  }
}