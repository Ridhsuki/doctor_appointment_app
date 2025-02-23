import 'package:doctor_appointment_app/utils/config.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key, required this.route});

  final String route;

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      height: 150,
      child: GestureDetector(
        child: Card(
          elevation: 5,
          color: Colors.white,
          child: Row(
            children: [
              SizedBox(
                width: Config.widthSize * 0.33,
                child: Image.asset('assets/profile1.jpg', fit: BoxFit.fill),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Dr Asakusa',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Dental',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(Icons.star_border_rounded,
                              color: Colors.amberAccent, size: 16),
                          Spacer(flex: 1),
                          Text('4.5'),
                          Spacer(flex: 1),
                          Text('Reviews'),
                          Spacer(flex: 1),
                          Text('(20)'),
                          Spacer(flex: 7),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        // redirect to doctor detail screen
        onTap: () => Navigator.of(context).pushNamed(route),
      ),
    );
  }
}
