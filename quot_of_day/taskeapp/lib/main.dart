import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // removes debug banner
      home: BlankPage(), // opens blank page
    );
  }
}

class BlankPage extends StatelessWidget {
  const BlankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ❌ removed const
      appBar: AppBar(
        title: const Text(
          "QUOT OF DAY",
          style: TextStyle(color: Color.fromARGB(255, 233, 232, 230)),
        ), // ✅ can keep const here
        backgroundColor: const Color.fromARGB(
          255,
          109,
          108,
          111,
        ), 
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: EdgeInsets.all(16),
             decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 12,
                  spreadRadius: 2,


                )
              ]
            ),
            

           
            
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "the journey of thousand mies begine with a single step",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 10,),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "intelkeen Skilss",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),

          
          ),
        ),
      ),
      backgroundColor: Colors.blue[50],
    );
  }
}
