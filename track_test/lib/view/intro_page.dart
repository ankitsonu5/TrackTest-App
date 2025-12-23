import 'package:flutter/material.dart';
import 'package:track_test/view/login_Page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration:  BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/IntroImg.png"),
            fit: BoxFit.cover
          ),
          // gradient: LinearGradient(
          //   colors: [
          //     Color(0xff6A11CB),
          //     Color(0xff2575FC),
          //   ],
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          // ),
        ),
        child: SafeArea(
          // child: SingleChildScrollView(

            child: Center(
              child: Padding(
                padding: EdgeInsetsGeometry.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text("Getting Started",style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.w900),),
                        Text("Track Test Getting Started",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),),
                      ],
                    ),
                    // Text("Getting Started",style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.w900),),
                    // Text("Track Test Getting Started",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),),
                    SizedBox(height: 40,),
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            // context,
                              MaterialPageRoute(builder:(context)=>LoginPage())
                          );
                        },

                        style: ElevatedButton.styleFrom(
                          // backgroundColor: Colors.white,
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xff2575FC),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          elevation: 5,
                        ),
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Lets Go ",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 5,),
                            Icon(Icons.headphones, size: 24,)
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      // ),
    );
  }
}
