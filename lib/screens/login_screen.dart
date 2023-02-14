import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Log in',
          style: GoogleFonts.poppins(
              fontSize: 25, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Column(
        children: [
          Text('My Peltar'),
          Text('Loginlah di my peltar'),
          SizedBox(
            height: 100,
          ),
          Expanded(
              child: Container(
            decoration: const BoxDecoration(
                color: Color(0xFFB74093),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(55),
                    topRight: Radius.circular(55))),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: [
                  const SizedBox(height: 60),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Email',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color(0xFFB74093),
                                  blurRadius: 20,
                                  offset: Offset(0, 10))
                            ]),
                        child: const TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.mail),
                              hintText: 'Email'),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Text(
                        'Password',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0xFFB74093),
                              blurRadius: 20,
                              offset: Offset(0, 10))
                        ]),
                    child: const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: Icon(Icons.visibility),
                          hintText: 'Password'),
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  //button
                  Container(
                    height: 45,
                    margin: const EdgeInsets.symmetric(horizontal: 60),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0xFFB74093),
                              blurRadius: 200,
                              offset: Offset(0, 10))
                        ]),
                    child: const Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Color(0xFFB74093),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
