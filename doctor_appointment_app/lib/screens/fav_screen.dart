import "package:flutter/material.dart";

class FavScreen extends StatefulWidget {
  FavScreen({Key? key}) : super(key: key);

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Column(
          children: [
            const Text(
              'My Favorite Doctors',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // Expanded(
            //   child: Consumer<AuthModel>(
            //     builder: (context, auth, child) {
            //       return ListView.builder(
            //         itemCount: 7,
            //         itemBuilder: (context, index) {
            //           return DoctorCard(
            //      route: ,
            //           );
            //         },
            //       );
            //     },
            //     //child:
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
