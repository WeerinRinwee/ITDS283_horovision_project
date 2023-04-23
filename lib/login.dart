import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'profile.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginScreenState extends StatefulWidget {
  const LoginScreenState({super.key});

  @override
  State<LoginScreenState> createState() => _LoginScreenStateState();
}

class _LoginScreenStateState extends State<LoginScreenState> {
  final platternkey = GlobalKey<FormState>();
  Profile profile = Profile();

  // object ที่ไว้เพื่อกำหนดค่าสำหรับตัว firebase ที่กำหนดค่าเริ่มต้น
  final Future<FirebaseApp> firebase =
      Firebase.initializeApp(); // เอาไว้เพื่อประกาศใช้งาน firebase

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        //snapshot เป็นผลจากการเรียกใช้งาน firebase
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: const Text("Error"),
              ),
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }
          //ถ้าไม่มี error หรือ app can connect firebase ได้
          if (snapshot.connectionState == ConnectionState.done) {
            //FutureBuilder check ว่ามีการเชื่อมโยงกับ firebase ไหม
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0xff9190C1),
                title: const Text("Login"),
              ),
              // body: Center(
              body: SafeArea(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: <Widget>[
                      Positioned(
                          top: 22,
                          child: Container(
                            width: 500,
                            height: 300,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/photo/login.png'))),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Form(
                            key: platternkey,
                            child: Padding(
                              // padding: const EdgeInsets.all(16.0),
                              padding: EdgeInsets.only(bottom: 20, top: 300),
                              child: Column(
                                children: [
                                  const SizedBox(height: 20.0),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: "Email",
                                      hintText: "Enter your email",
                                      border: OutlineInputBorder(),
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    validator: MultiValidator([
                                      RequiredValidator(
                                          errorText: "Please input your email"),
                                      EmailValidator(
                                          errorText: "Invalid email format")
                                    ]), //เตือนเมื่อไม่มีการใส่ email เเละ รูปเเบบของ email ไม่ถูกต้อง
                                    onSaved: (String? email) {
                                      profile.email =
                                          email; // นำค่าเข้าไปเก็บไว้ใน object profile
                                    },
                                  ),
                                  const SizedBox(height: 20.0),
                                  TextFormField(
                                    obscureText:
                                        true, //ปิดรหัสหลังจากที่มีการพิมพ์
                                    decoration: const InputDecoration(
                                      labelText: "Password",
                                      hintText: "Enter your password",
                                      border: OutlineInputBorder(),
                                    ),
                                    validator: RequiredValidator(
                                        errorText:
                                            "Please input your password"), //เตือนเมื่อไม่มีการใส่ password
                                    onSaved: (String? pwd) {
                                      profile.pwd =
                                          pwd; // นำค่าเข้าไปเก็บไว้ใน object profile
                                    }, // on save จะสามารถทำงานได้ก็ต่อเมื่อ user กดปุ่ม register
                                  ),
                                  const SizedBox(height: 20.0),
                                  ElevatedButton(
                                    onPressed: () async {
                                      if (platternkey.currentState!
                                          .validate()) {
                                        platternkey.currentState
                                            ?.save(); //เพื่อทำการบอกให้ platternkey ไปสั่ง save ให้ไปเลือกใช้งานใน method textfromfiled
                                        // print(
                                        //     "email: ${profile.email} password: ${profile.pwd}");
                                        try {
                                          // signInWithEmailAndPassword คำสั่งในการ login
                                          await FirebaseAuth.instance
                                              .signInWithEmailAndPassword(
                                                  email: profile.email!,
                                                  password: profile.pwd!)
                                              .then((value) {
                                            platternkey.currentState?.reset();
                                            Navigator.pushNamed(
                                                context, '/homepage');
                                          });
                                        }
                                        //FirebaseAuthException เป็นรูปเเบบของ error ใน auth
                                        on FirebaseAuthException catch (e) {
                                          // print(e.code);//code error
                                          // print(e.message);//massage error
                                          // String message;
                                          //เเสดงกล่องเเจ้งเตือนว่ามีข้อผิดพลาดอะไรเกิดขึ้นบ้าง
                                          Fluttertoast.showToast(
                                            msg: e.message!,
                                          );
                                        }
                                      }
                                    },
                                    child: const Text("Login",style: TextStyle(fontSize: 25),),
                                    style: ButtonStyle(backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (Set<MaterialState> State) {
                                      if (State.contains(MaterialState.hovered))
                                        return Color(0xffFEC8D8);
                                      return Color(0xffD291BC);
                                    })),
                                  ),
                                ],
                              ),
                            )),
                      )
                    ],
                  ),
                ),
                // ),
              ),
            );
          }
          return Scaffold(
            body: CircularProgressIndicator(),
          );
        });
  }
}
