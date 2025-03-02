import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'create_account_widget.dart' show CreateAccountWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateAccountModel extends FlutterFlowModel<CreateAccountWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for confirmpasswordfield widget.
  FocusNode? confirmpasswordfieldFocusNode;
  TextEditingController? confirmpasswordfieldTextController;
  late bool confirmpasswordfieldVisibility;
  String? Function(BuildContext, String?)?
      confirmpasswordfieldTextControllerValidator;
  // State field(s) for emailfield widget.
  FocusNode? emailfieldFocusNode;
  TextEditingController? emailfieldTextController;
  String? Function(BuildContext, String?)? emailfieldTextControllerValidator;
  // State field(s) for passwordfield widget.
  FocusNode? passwordfieldFocusNode;
  TextEditingController? passwordfieldTextController;
  late bool passwordfieldVisibility;
  String? Function(BuildContext, String?)? passwordfieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    confirmpasswordfieldVisibility = false;
    passwordfieldVisibility = false;
  }

  @override
  void dispose() {
    confirmpasswordfieldFocusNode?.dispose();
    confirmpasswordfieldTextController?.dispose();

    emailfieldFocusNode?.dispose();
    emailfieldTextController?.dispose();

    passwordfieldFocusNode?.dispose();
    passwordfieldTextController?.dispose();
  }
}
