import 'package:flutter/material.dart';

class User extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      // appBar: AppBar(
      //   backgroundColor: Color(0xff9190C1),
      //   title: const Text("Register or Login"),
      // ),
      body: Column(
        //  Padding(
        // padding: const EdgeInsets.all(16.0),
        children: [
          Center(
            child: SafeArea(
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget>[
                  Image.asset(
                    'assets/photo/your.png',
                    height: MediaQuery.of(context).size.height * 0.9,
                  ),

                  // register
                  Positioned(
                    top: 580,
                    child: SizedBox(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(context, '/regist');
                        },
                        label: const Text(
                          "Register",
                          style: TextStyle(fontSize: 35),
                        ),
                        icon: Icon(Icons.app_registration),
                        style: ButtonStyle(backgroundColor:
                            MaterialStateColor.resolveWith(
                                (Set<MaterialState> State) {
                          if (State.contains(MaterialState.hovered))
                            return Color(0xffFEC8D8);
                          return Color(0xffD291BC);
                        })),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 640,
                    child: SizedBox(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        label: Text(
                          "Login",
                          style: TextStyle(fontSize: 35),
                        ),
                        icon: Icon(Icons.favorite),
                        style: ButtonStyle(backgroundColor:
                            MaterialStateColor.resolveWith(
                                (Set<MaterialState> State) {
                          if (State.contains(MaterialState.hovered))
                            return Color(0xffFEC8D8);
                          return Color(0xffD291BC);
                        })),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        // ),
      ),
    );
  }
}
