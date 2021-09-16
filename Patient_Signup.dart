import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:psghospitalapp/Temp/Values.dart';
import 'package:psghospitalapp/widget/button_widget.dart';
import 'package:psghospitalapp/widget/textfield_widget.dart';

class P_Signup extends StatefulWidget {
  const P_Signup({Key? key}) : super(key: key);
  @override
  _P_SignupState createState() => _P_SignupState();
}

class _P_SignupState extends State<P_Signup> {
  final List<String> Gender = ['Male', 'Female'];
  var _currentgenderType;
  TextEditingController dateinput = TextEditingController();
  String Password1 = "";
  String Password2 = "";
  bool errorindicator0 = false;
  bool errorindicator = false;

  bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool mainPassObscure = true;
  bool confirmPassObscure = true;
  @override
  void initState() {
    dateinput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff4A64FE),
            centerTitle: true,
            elevation: 0,
            title: Text(
              "Physiotherapist",
              style: GoogleFonts.lato(
                color: Color(0xffffffff),
                fontSize: 25,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          backgroundColor: Color(0xffffffff),
          body: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Demographic Data",
                                    style: GoogleFonts.lato(
                                      color: Color(0xff4A64FE),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TextFieldWidget(
                              error: false,
                              index: 0,
                              Num: true,
                              hintText: 'Patient ID',
                              obscureText: false,
                              prefixIconData: Icons.account_circle_outlined,
                              suffixIconData: Icons.verified_user,
                              onChanged: (value) {},
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            TextFieldWidget(
                              error: false,
                              Num: false,
                              index: 1,
                              hintText: 'Patient Name',
                              obscureText: false,
                              prefixIconData: Icons.account_box_outlined,
                              suffixIconData: Icons.verified_user,
                              onChanged: () {},
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            TextField(
                              onChanged: (value) {
                                setState(() {
                                  Patient.Password = value;
                                });
                                Patient.PatientInfo[2] = value;
                                if (validateStructure(value)) {
                                  setState(() {
                                    errorindicator0 = false;
                                  });
                                } else {
                                  setState(() {
                                    errorindicator0 = true;
                                  });
                                }
                                if (Patient.Password == Password2) {
                                  setState(() {
                                    errorindicator = false;
                                  });
                                } else {
                                  setState(() {
                                    errorindicator = true;
                                  });
                                }
                              },
                              obscureText: mainPassObscure,
                              cursorColor: Color(0xff4A64FE),
                              style: GoogleFonts.lato(
                                color: errorindicator0
                                    ? Colors.red
                                    : Color(0xff4A64FE),
                                fontSize: 16.0,
                              ),
                              decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    color: errorindicator0
                                        ? Colors.red
                                        : Color(0xff4A64FE)),
                                focusColor: errorindicator0
                                    ? Colors.red
                                    : Color(0xff4A64FE),
                                filled: true,
                                enabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: errorindicator0
                                          ? Colors.red
                                          : Color(0xff4A64FE)),
                                ),
                                labelText: "Password",
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  size: 18,
                                  color: errorindicator0
                                      ? Colors.red
                                      : Color(0xff4A64FE),
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    if (mainPassObscure) {
                                      setState(() {
                                        mainPassObscure = false;
                                      });
                                    } else {
                                      setState(() {
                                        mainPassObscure = true;
                                      });
                                    }
                                  },
                                  child: Icon(
                                    mainPassObscure
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    size: 18,
                                    color: errorindicator0
                                        ? Colors.red
                                        : Color(0xff4A64FE),
                                  ),
                                ),
                              ),
                              keyboardType: false
                                  ? TextInputType.number
                                  : TextInputType.text,
                              inputFormatters: false
                                  ? <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ]
                                  : null,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            TextField(
                              onTap: () {},
                              onChanged: (value) {
                                Password2 = value;
                                if (Patient.Password == value) {
                                  setState(() {
                                    errorindicator = false;
                                  });
                                } else {
                                  setState(() {
                                    errorindicator = true;
                                  });
                                }
                                Patient.PatientInfo[3] = value.toString();
                              },
                              obscureText: confirmPassObscure,
                              cursorColor: Color(0xff4A64FE),
                              style: GoogleFonts.lato(
                                color: errorindicator
                                    ? Colors.red
                                    : Color(0xff4A64FE),
                                fontSize: 16.0,
                              ),
                              decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    color: errorindicator
                                        ? Colors.red
                                        : Color(0xff4A64FE)),
                                focusColor: errorindicator
                                    ? Colors.red
                                    : Color(0xff4A64FE),
                                filled: true,
                                enabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: errorindicator
                                          ? Colors.red
                                          : Color(0xff4A64FE)),
                                ),
                                labelText: "Confirm Password",
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  size: 18,
                                  color: errorindicator
                                      ? Colors.red
                                      : Color(0xff4A64FE),
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    if (confirmPassObscure) {
                                      setState(() {
                                        confirmPassObscure = false;
                                      });
                                    } else {
                                      setState(() {
                                        confirmPassObscure = true;
                                      });
                                    }
                                  },
                                  child: Icon(
                                    confirmPassObscure
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    size: 18,
                                    color: errorindicator
                                        ? Colors.red
                                        : Color(0xff4A64FE),
                                  ),
                                ),
                              ),
                              keyboardType: false
                                  ? TextInputType.number
                                  : TextInputType.text,
                              inputFormatters: false
                                  ? <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ]
                                  : null,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            TextField(
                                maxLength: 10,
                                onChanged: (value) {},
                                cursorColor: Color(0xff4A64FE),
                                style: GoogleFonts.lato(
                                  color: Color(0xff4A64FE),
                                  fontSize: 16.0,
                                ),
                                decoration: InputDecoration(
                                  labelStyle:
                                      TextStyle(color: Color(0xff4A64FE)),
                                  focusColor: Color(0xff4A64FE),
                                  filled: true,
                                  enabledBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Color(0xff4A64FE)),
                                  ),
                                  labelText: "Contact Number",
                                  prefixIcon: Icon(
                                    Icons.phone,
                                    size: 18,
                                    color: Color(0xff4A64FE),
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ]),
                            SizedBox(
                              height: 10.0,
                            ),
                            TextField(
                              maxLines: 5,
                              onChanged: (value) {},
                              cursorColor: Color(0xff4A64FE),
                              style: GoogleFonts.lato(
                                color: Color(0xff4A64FE),
                                fontSize: 16.0,
                              ),
                              decoration: InputDecoration(
                                labelStyle: TextStyle(color: Color(0xff4A64FE)),
                                focusColor: Color(0xff4A64FE),
                                filled: true,
                                enabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Color(0xff4A64FE)),
                                ),
                                labelText: "Address",
                                prefixIcon: Icon(
                                  Icons.home,
                                  size: 18,
                                  color: Color(0xff4A64FE),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            //new Divider(
                            // thickness: 3,
                            //           color: Colors.black12,
                            //           indent: 100,
                            //           endIndent: 100,
                            //         ),
                            SizedBox(
                              height: 10.0,
                            ),
                            TextField(
                                maxLength: 3,
                                onChanged: (value) {},
                                cursorColor: Color(0xff4A64FE),
                                style: GoogleFonts.lato(
                                  color: Color(0xff4A64FE),
                                  fontSize: 16.0,
                                ),
                                decoration: InputDecoration(
                                  labelStyle:
                                      TextStyle(color: Color(0xff4A64FE)),
                                  focusColor: Color(0xff4A64FE),
                                  filled: true,
                                  enabledBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Color(0xff4A64FE)),
                                  ),
                                  labelText: "Age",
                                  prefixIcon: Icon(
                                    Icons.arrow_right,
                                    size: 20,
                                    color: Color(0xff4A64FE),
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ]),
                            SizedBox(
                              height: 10.0,
                            ),
                            DropdownButtonFormField(
                              decoration: InputDecoration(
                                labelStyle: TextStyle(color: Color(0xff4A64FE)),
                                focusColor: Color(0xff4A64FE),
                                filled: true,
                                enabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Color(0xff4A64FE)),
                                ),
                                labelText: "Gender",
                                prefixIcon: Icon(
                                  Icons.arrow_right,
                                  size: 20,
                                  color: Color(0xff4A64FE),
                                ),
                              ),
                              value: Gender[0],
                              items: Gender.map((gen) {
                                return DropdownMenuItem(
                                  value: gen,
                                  child: Text(gen),
                                );
                              }).toList(),
                              onChanged: (val) {
                                setState(() {
                                  _currentgenderType = val;
                                  Patient.PatientInfo[7] = val.toString();
                                });
                              },
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            TextFieldWidget_M(
                              error: false,
                              index: 8,
                              Num: false,
                              hintText: 'Occupation',
                              obscureText: false,
                              prefixIconData: Icons.arrow_right,
                              suffixIconData: Icons.verified_user,
                              onChanged: () {},
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            TextFieldWidget_M(
                              error: false,
                              index: 9,
                              Num: false,
                              hintText: 'Source of History',
                              obscureText: false,
                              prefixIconData: Icons.arrow_right,
                              suffixIconData: Icons.verified_user,
                              onChanged: () {},
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            TextField(
                              controller: dateinput,
                              decoration: InputDecoration(
                                labelStyle: TextStyle(color: Color(0xff4A64FE)),
                                focusColor: Color(0xff4A64FE),
                                filled: true,
                                enabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Color(0xff4A64FE)),
                                ),
                                labelText: "Date of admission",
                                prefixIcon: Icon(
                                  Icons.arrow_right,
                                  size: 20,
                                  color: Color(0xff4A64FE),
                                ),
                              ),
                              readOnly: true,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1800),
                                    lastDate: DateTime(2101));
                                if (pickedDate != null) {
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);
                                  setState(() {
                                    dateinput.text = formattedDate;
                                    Patient.PatientInfo[10] = formattedDate;
                                  });
                                } else {
                                  print("Date is not selected");
                                }
                              },
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 18.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => P_Signup1()),
                            );
                          },
                          child: ButtonWidget(
                            title: 'Next',
                            hasBorder: false,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class P_Signup1 extends StatefulWidget {
  const P_Signup1({Key? key}) : super(key: key);
  @override
  _P_Signup1State createState() => _P_Signup1State();
}

class _P_Signup1State extends State<P_Signup1> {
  final List<String> Marital_Status = [
    'Married',
    'Unmarried',
    'Divorced',
  ];
  var _currentMaritalType;
  final List<String> Liveswith = [
    'Joint Family',
    'Nuclear Family',
    'Micro Nuclear Family',
  ];
  var _currentLiveswithType;
  final List<String> Accommodation = [
    'Rural',
    'Urban',
    'Crowded',
    'Isolated',
    'Ground Floor',
    'Stairs - Steps',
    'Stairs - Flights',
  ];
  var _currentAccommodationType;
  final List<String> AssistiveEquip = [
    'Hearing aids',
    'Spectacles',
    'Mobility aids',
  ];
  var _currentAssistiveEquipType;
  final List<String> WorkingStatus = [
    'Sedentary',
    'Mobile',
    'Strenuous',
  ];
  var _currentWorkingStatusType;
  final List<String> WorkingEnvironment = [
    'Calm',
    'Noisy',
    'Polluted',
    'Hygiene',
  ];
  var _currentWorkingEnvironmentType;
  final List<String> ProbAtWork = [
    'Fear of Angina',
    'Fear of Dyspnea',
    'Fear of Palpitations',
    'Others',
  ];
  var _currentProbAtWorkType;
  final List<String> Hobbies = [
    'Indoor-Gaming',
    'Outdoor-Gaming',
    'Sedentary Hobbies',
    'Others',
  ];
  var _currentHobbiesType;
  bool Others = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff4A64FE),
            centerTitle: true,
            elevation: 0,
            title: Text(
              "Physiotherapist",
              style: GoogleFonts.lato(
                color: Color(0xffffffff),
                fontSize: 25,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          backgroundColor: Color(0xffffffff),
          body: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Socio Economic History",
                                style: GoogleFonts.lato(
                                  color: Color(0xff4A64FE),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            DropdownButtonFormField(
                              decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    fontSize: 16.0, color: Color(0xff4A64FE)),
                                focusColor: Color(0xff4A64FE),
                                filled: true,
                                enabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Color(0xff4A64FE)),
                                ),
                                labelText: "Marital Status",
                                prefixIcon: Icon(
                                  Icons.arrow_right,
                                  size: 20,
                                  color: Color(0xff4A64FE),
                                ),
                              ),
                              value: Marital_Status[0],
                              items: Marital_Status.map((gen) {
                                return DropdownMenuItem(
                                  value: gen,
                                  child: Text(gen),
                                );
                              }).toList(),
                              onChanged: (val) {
                                setState(() {
                                  _currentMaritalType = val;
                                  Patient.PatientInfo[11] = val.toString();
                                });
                              },
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            DropdownButtonFormField(
                              decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    fontSize: 16.0, color: Color(0xff4A64FE)),
                                focusColor: Color(0xff4A64FE),
                                filled: true,
                                enabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Color(0xff4A64FE)),
                                ),
                                labelText: "Lives with",
                                prefixIcon: Icon(
                                  Icons.arrow_right,
                                  size: 20,
                                  color: Color(0xff4A64FE),
                                ),
                              ),
                              value: Liveswith[0],
                              items: Liveswith.map((gen) {
                                return DropdownMenuItem(
                                  value: gen,
                                  child: Text(gen),
                                );
                              }).toList(),
                              onChanged: (val) {
                                setState(() {
                                  _currentLiveswithType = val;
                                  Patient.PatientInfo[12] = val.toString();
                                });
                              },
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            DropdownButtonFormField(
                              decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    fontSize: 16.0, color: Color(0xff4A64FE)),
                                focusColor: Color(0xff4A64FE),
                                filled: true,
                                enabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Color(0xff4A64FE)),
                                ),
                                labelText: "Accommodation",
                                prefixIcon: Icon(
                                  Icons.arrow_right,
                                  size: 20,
                                  color: Color(0xff4A64FE),
                                ),
                              ),
                              value: Accommodation[0],
                              items: Accommodation.map((gen) {
                                return DropdownMenuItem(
                                  value: gen,
                                  child: Text(gen),
                                );
                              }).toList(),
                              onChanged: (val) {
                                setState(() {
                                  _currentAccommodationType = val;
                                  Patient.PatientInfo[13] = val.toString();
                                });
                              },
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            DropdownButtonFormField(
                              decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    fontSize: 16.0, color: Color(0xff4A64FE)),
                                focusColor: Color(0xff4A64FE),
                                filled: true,
                                enabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Color(0xff4A64FE)),
                                ),
                                labelText: "Assistive Equipment",
                                prefixIcon: Icon(
                                  Icons.arrow_right,
                                  size: 20,
                                  color: Color(0xff4A64FE),
                                ),
                              ),
                              value: AssistiveEquip[0],
                              items: AssistiveEquip.map((gen) {
                                return DropdownMenuItem(
                                  value: gen,
                                  child: Text(gen),
                                );
                              }).toList(),
                              onChanged: (val) {
                                setState(() {
                                  _currentAssistiveEquipType = val;
                                  Patient.PatientInfo[14] = val.toString();
                                });
                              },
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            DropdownButtonFormField(
                              decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    fontSize: 16.0, color: Color(0xff4A64FE)),
                                focusColor: Color(0xff4A64FE),
                                filled: true,
                                enabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Color(0xff4A64FE)),
                                ),
                                labelText: "Working Status",
                                prefixIcon: Icon(
                                  Icons.arrow_right,
                                  size: 20,
                                  color: Color(0xff4A64FE),
                                ),
                              ),
                              value: WorkingStatus[0],
                              items: WorkingStatus.map((gen) {
                                return DropdownMenuItem(
                                  value: gen,
                                  child: Text(gen),
                                );
                              }).toList(),
                              onChanged: (val) {
                                setState(() {
                                  _currentWorkingStatusType = val;
                                  Patient.PatientInfo[15] = val.toString();
                                });
                              },
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            DropdownButtonFormField(
                              decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    fontSize: 16.0, color: Color(0xff4A64FE)),
                                focusColor: Color(0xff4A64FE),
                                filled: true,
                                enabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Color(0xff4A64FE)),
                                ),
                                labelText: "Working Environment",
                                prefixIcon: Icon(
                                  Icons.arrow_right,
                                  size: 20,
                                  color: Color(0xff4A64FE),
                                ),
                              ),
                              value: WorkingEnvironment[0],
                              items: WorkingEnvironment.map((gen) {
                                return DropdownMenuItem(
                                  value: gen,
                                  child: Text(gen),
                                );
                              }).toList(),
                              onChanged: (val) {
                                setState(() {
                                  _currentWorkingEnvironmentType = val;
                                  Patient.PatientInfo[16] = val.toString();
                                });
                              },
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            TextFieldWidget_M(
                              error: false,
                              index: 17,
                              Num: false,
                              hintText: 'Job Title',
                              obscureText: false,
                              prefixIconData: Icons.arrow_right,
                              suffixIconData: Icons.verified_user,
                              onChanged: () {},
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            DropdownButtonFormField(
                              decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    fontSize: 16.0, color: Color(0xff4A64FE)),
                                focusColor: Color(0xff4A64FE),
                                filled: true,
                                enabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Color(0xff4A64FE)),
                                ),
                                labelText:
                                    "Problems at work due to your condition",
                                prefixIcon: Icon(
                                  Icons.arrow_right,
                                  size: 20,
                                  color: Color(0xff4A64FE),
                                ),
                              ),
                              value: ProbAtWork[0],
                              items: ProbAtWork.map((gen) {
                                return DropdownMenuItem(
                                  value: gen,
                                  child: Text(gen),
                                );
                              }).toList(),
                              onChanged: (val) {
                                setState(() {
                                  _currentProbAtWorkType = val;
                                  Patient.PatientInfo[18] = val.toString();
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        DropdownButtonFormField(
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                                fontSize: 16.0, color: Color(0xff4A64FE)),
                            focusColor: Color(0xff4A64FE),
                            filled: true,
                            enabledBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Color(0xff4A64FE)),
                            ),
                            labelText: "Hobbies",
                            prefixIcon: Icon(
                              Icons.arrow_right,
                              size: 20,
                              color: Color(0xff4A64FE),
                            ),
                          ),
                          value: Hobbies[0],
                          items: Hobbies.map((gen) {
                            return DropdownMenuItem(
                              value: gen,
                              child: Text(gen),
                            );
                          }).toList(),
                          onChanged: (val) {
                            setState(() {
                              if (val == "Others") {
                                Others = true;
                              } else {
                                _currentHobbiesType = val;
                                Others = false;
                                Patient.PatientInfo[19] = val.toString();
                              }
                            });
                          },
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Others
                            ? TextFieldWidget_M(
                                error: false,
                                index: 19,
                                Num: false,
                                hintText: 'Enter your Hobbies',
                                obscureText: true,
                                prefixIconData: Icons.arrow_right,
                                suffixIconData: Icons.verified_user,
                                onChanged: () {},
                              )
                            : Container(),
                        SizedBox(
                          height: 18.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => P_Signup2()),
                            );
                          },
                          child: ButtonWidget(
                            title: 'Next',
                            hasBorder: false,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class P_Signup2 extends StatefulWidget {
  const P_Signup2({Key? key}) : super(key: key);
  @override
  _P_Signup2State createState() => _P_Signup2State();
}

class _P_Signup2State extends State<P_Signup2> {
  final List<String> MedicalDiagnosis = [
    'ACS - STEMI',
    'NSTEMI',
    'UNSTABLE ANGINA',
    'AWMI',
    'IWMI',
    'PWMI',
    'HLMI',
    'RVMI'
  ];
  var _currentMedicalDiagnosisType;
  TextEditingController dateinput = TextEditingController();
  //text editing controller for text field
  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff4A64FE),
            centerTitle: true,
            elevation: 0,
            title: Text(
              "Physiotherapist",
              style: GoogleFonts.lato(
                color: Color(0xffffffff),
                fontSize: 25,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          backgroundColor: Color(0xffffffff),
          body: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Medical History",
                                  style: GoogleFonts.lato(
                                    color: Color(0xff4A64FE),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              TextFieldWidget_M(
                                error: false,
                                index: 18,
                                Num: false,
                                hintText: 'Referred by',
                                obscureText: false,
                                prefixIconData: Icons.arrow_right,
                                suffixIconData: Icons.verified_user,
                                onChanged: () {},
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              TextField(
                                controller: dateinput,
                                decoration: InputDecoration(
                                  labelStyle:
                                      TextStyle(color: Color(0xff4A64FE)),
                                  focusColor: Color(0xff4A64FE),
                                  filled: true,
                                  enabledBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Color(0xff4A64FE)),
                                  ),
                                  labelText: "Date of assessment",
                                  prefixIcon: Icon(
                                    Icons.arrow_right,
                                    size: 20,
                                    color: Color(0xff4A64FE),
                                  ),
                                ),
                                readOnly: true,
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1800),
                                      lastDate: DateTime(2101));
                                  if (pickedDate != null) {
                                    String formattedDate =
                                        DateFormat('yyyy-MM-dd')
                                            .format(pickedDate);
                                    setState(() {
                                      dateinput.text = formattedDate;
                                      Patient.PatientInfo[21] = formattedDate;
                                    });
                                  } else {
                                    print("Date is not selected");
                                  }
                                },
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              DropdownButtonFormField(
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(
                                      fontSize: 16.0, color: Color(0xff4A64FE)),
                                  focusColor: Color(0xff4A64FE),
                                  filled: true,
                                  enabledBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Color(0xff4A64FE)),
                                  ),
                                  labelText: "Medical Diagnosis",
                                  prefixIcon: Icon(
                                    Icons.arrow_right,
                                    size: 20,
                                    color: Color(0xff4A64FE),
                                  ),
                                ),
                                value: MedicalDiagnosis[0],
                                items: MedicalDiagnosis.map((gen) {
                                  return DropdownMenuItem(
                                    value: gen,
                                    child: Text(gen),
                                  );
                                }).toList(),
                                onChanged: (val) {
                                  setState(() {
                                    _currentMedicalDiagnosisType = val;
                                    Patient.PatientInfo[22] = val.toString();
                                  });
                                },
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              TextFieldWidget_M(
                                error: false,
                                index: 23,
                                Num: false,
                                hintText: 'Current Medical History',
                                obscureText: false,
                                prefixIconData: Icons.arrow_right,
                                suffixIconData: Icons.verified_user,
                                onChanged: () {},
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              TextFieldWidget_M(
                                error: false,
                                index: 24,
                                Num: false,
                                hintText:
                                    'Previous Treatment for this condition',
                                obscureText: false,
                                prefixIconData: Icons.arrow_right,
                                suffixIconData: Icons.verified_user,
                                onChanged: () {},
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              TextFieldWidget_M(
                                error: false,
                                index: 25,
                                Num: false,
                                hintText: 'Past Medical / Surgical History',
                                obscureText: false,
                                prefixIconData: Icons.arrow_right,
                                suffixIconData: Icons.verified_user,
                                onChanged: () {},
                              ),
                              SizedBox(
                                height: 18.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  print(Patient.PatientInfo);
                                  // Navigator.push(
                                  //   context,
                                  //  MaterialPageRoute(
                                  //      builder: (context) => P_Signup1()),
                                  //);
                                },
                                child: ButtonWidget(
                                  title: 'Done',
                                  hasBorder: false,
                                ),
                              ),
                            ],
                          ),
                        ]),
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
