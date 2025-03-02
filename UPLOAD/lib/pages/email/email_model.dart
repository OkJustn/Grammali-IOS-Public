import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'email_widget.dart' show EmailWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EmailModel extends FlutterFlowModel<EmailWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for passwordfield widget.
  FocusNode? passwordfieldFocusNode;
  TextEditingController? passwordfieldTextController;
  late bool passwordfieldVisibility;
  String? Function(BuildContext, String?)? passwordfieldTextControllerValidator;
  // State field(s) for emailfield widget.
  FocusNode? emailfieldFocusNode;
  TextEditingController? emailfieldTextController;
  String? Function(BuildContext, String?)? emailfieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordfieldVisibility = false;
  }

  @override
  void dispose() {
    passwordfieldFocusNode?.dispose();
    passwordfieldTextController?.dispose();

    emailfieldFocusNode?.dispose();
    emailfieldTextController?.dispose();
  }
}
