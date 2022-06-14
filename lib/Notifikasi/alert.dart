import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_go_job/shared/shared.dart';


class ShowAlert {
  void _coolAlertSucces(String text, BuildContext context, String textButton) {
    CoolAlert.show(
        context: context,
        type: CoolAlertType.success,
        title: text,
        backgroundColor: primarycolor,
        confirmBtnText: textButton);
  }

  get coolAlertSucces => _coolAlertSucces;
  void _coolAlertFail(String text, BuildContext context, String textButton) {
    CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        title: text,
        backgroundColor: primarycolor,
        autoCloseDuration: Duration(seconds: 3),
        confirmBtnText: textButton);
  }

  get coolAlertFail => _coolAlertFail;
}