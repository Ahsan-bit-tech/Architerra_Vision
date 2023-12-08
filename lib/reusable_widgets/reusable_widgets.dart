import 'package:flutter/material.dart';

import '../constants.dart';

Container firebaseUIButton(BuildContext context, String title, Function onTap) {
  Size size = MediaQuery.of(context).size;
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    width: size.width * 0.8,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(29),
      child: TextButton(
        style: TextButton.styleFrom(
          padding:
          EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          backgroundColor: kPrimaryColor,
          foregroundColor: Colors.white,
        ),
        onPressed: () {
          onTap();
        },
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  );
}

/*Container resetButton(BuildContext context, String title, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    ),
  );

}
*/