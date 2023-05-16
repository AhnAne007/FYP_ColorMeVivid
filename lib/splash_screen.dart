import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fyp/Screens/Welcome/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 4)).then((value) =>
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const WelcomeScreen())
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SizedBox(
       width: double.infinity,
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Image(image: AssetImage("assets/images/ColorMeVivid.png")),
           SizedBox(
             height: 50,
           ),
           SpinKitCircle(
             size: 70.0,
             itemBuilder: (_, int index) {
               return DecoratedBox(
                 decoration: BoxDecoration(
                   color: giveColor(index),
                   shape: BoxShape.circle,
                 ),
               );
             },
           )

         ],
       ),
     ),

    );
  }

  MaterialColor giveColor(int index){
    if(index == 1 || index == 6 || index == 11)
      {
        return Colors.orange;
      }
    else if(index == 2 || index == 7 || index == 12)
    {
      return Colors.green;
    }
    else if(index == 3 || index == 8 || index == 13)
    {
      return Colors.red;
    }
    else if(index == 4 || index == 9 || index == 14)
    {
      return Colors.purple;
    }
    else
      {
        return Colors.yellow;
      }
  }
}
