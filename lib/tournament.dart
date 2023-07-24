import 'package:flutter/material.dart';
import 'package:otpauth/view/bottomnavigation.dart';

class Ticket extends StatefulWidget {
  const Ticket({Key? key}) : super(key: key);

  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding:  const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Center(
                  child: Image.asset('assetss/freeroll.jpeg',
               ),


                ),const SizedBox(height: 35,),
                Column(

                  children: const [
                    Text("2 Tables running at present",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
fontSize: 16
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12,),
                Container(
                  width: 270.0,
                  height: 120.0,
                  decoration:   BoxDecoration(
                      border: Border.all(width:5,color:Colors.black),
                      boxShadow: const [BoxShadow(
                        blurRadius: 2
                      )],
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Color.fromARGB(211, 12, 70, 25)
                  ),

                  alignment: Alignment.center, // where to position the child
                  child: Container(
                    width: 200.0,
                    height: 90.0,
    decoration: BoxDecoration( boxShadow: const [ BoxShadow(
        blurRadius: 0
    )],
      border: Border.all(color:const Color.fromARGB(18, 171, 224, 197)),
    borderRadius: const BorderRadius.all(Radius.circular(50)),
        color: Color.fromARGB(211, 12, 70, 25)
                  ),

    child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    const Padding(
      padding: EdgeInsets.all(15.0),
      child: Text(
      '20K-100/200',
style: TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w500,
  fontSize: 18
),
      ),
    ),
    //SizedBox(height: 10,),
    SizedBox(
height: 30,
      width: 113,
      child: ElevatedButton(

        onPressed: () {

        },
        style: ElevatedButton.styleFrom(
          elevation: 2,
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)
          ),
          backgroundColor: Color.fromARGB(255, 236, 179, 75)
          // Set the text color of the button
        ),
        child: Text('BLOCK SEAT',
        style: TextStyle(

        ),), // Text displayed on the button
      )

    ),
    ],
    ),
    ),
    ),
                const SizedBox(height: 35,),
                Column(

                  children: const [
                    Text("3 Tables running at present",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12,),
                Container(
                  width: 270.0,
                  height: 120.0,
                  decoration:   BoxDecoration(
                      border: Border.all(width:5,color:Colors.black),
                      boxShadow: const [BoxShadow(
                          blurRadius: 2
                      )],
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Color.fromARGB(211, 12, 70, 25)
                  ),

                  alignment: Alignment.center, // where to position the child
                  child: Container(
                    width: 200.0,
                    height: 90.0,
                    decoration: BoxDecoration( boxShadow: const [ BoxShadow(
                        blurRadius: 0
                    )],
                        border: Border.all(color:const Color.fromARGB(18, 171, 224, 197)),
                        borderRadius: const BorderRadius.all(Radius.circular(50)),
                        color: Color.fromARGB(211, 12, 70, 25)
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            '10K - 100/200',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18
                            ),
                          ),
                        ),
                        //SizedBox(height: 10,),
                        SizedBox(
                            height: 30,
                            width: 113,
                            child: ElevatedButton(

                              onPressed: () {

                              },
                              style: ElevatedButton.styleFrom(
                                  elevation: 2,
                                  shadowColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)
                                  ),
                                  backgroundColor: Color.fromARGB(255, 236, 179, 75)
                                // Set the text color of the button
                              ),
                              child: Text('BLOCK SEAT',
                                style: TextStyle(

                                ),), // Text displayed on the button
                            )

                        ),
                      ],
                    ),

                  ),
                ),

    ],
            ),
    ),
    ],
      ),bottomNavigationBar: const BottomNavigation(),
    );
  }

}
