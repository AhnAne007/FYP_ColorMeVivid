// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// import '../../../constants.dart';
//
// class SignUpScreenTopImage extends StatelessWidget {
//   const SignUpScreenTopImage({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Column(
//       children: [
//         Text(
//           "Sign Up".toUpperCase(),
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         SizedBox(height: defaultPadding),
//         Row(
//           children: [
//             const Spacer(),
//             Expanded(
//               flex: 8,
//               child: Container(
//                   width: size.width - 100,
//                   height: size.height * 0.45,
//                   child: SvgPicture.asset("assets/icons/signup.svg")),
//             ),
//             const Spacer(),
//           ],
//         ),
//         SizedBox(height: defaultPadding),
//       ],
//     );
//   }
// }
