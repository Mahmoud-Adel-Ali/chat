// flutter awesome dialog
import 'package:awesome_dialog/awesome_dialog.dart';

awesomeDialog(
    {required context,
    required DialogType dialogType,
    required String title,
    required String desc}) {
  return AwesomeDialog(
    context: context,
    dialogType: dialogType,
    animType: AnimType.rightSlide,
    title: title,
    desc: desc,
    btnCancelOnPress: () {},
    btnOkOnPress: () {},
  )..show();
}
