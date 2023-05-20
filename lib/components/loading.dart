import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitCircle(
        size: 70.0,
        itemBuilder: (_, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: giveColor(index),
              shape: BoxShape.circle,
            ),
          );
        },
      ),
    );
  }
}
