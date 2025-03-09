import 'package:doctor_appointment_app/components/button.dart';
import 'package:doctor_appointment_app/components/custom_appbar.dart';
import 'package:doctor_appointment_app/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({super.key});

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  // top favourite button
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        appTitle: 'Doctor Details',
        icon: FaIcon(Icons.arrow_back_ios),
        actions: [
          // favourite button
          IconButton(
            onPressed: () {
              setState(() {
                isFav = !isFav;
              });
            },
            icon: FaIcon(
              isFav ? Icons.favorite_rounded : Icons.favorite_border_outlined,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: SafeArea(
          child: Column(
            children: <Widget>[
              AboutDoctor(),
              DetailBody(),
              const Spacer(),
              Padding(
                padding: EdgeInsets.all(20),
                child: Button(
                  width: double.infinity,
                  title: 'Book Appointment',
                  disable: false,
                  onpressed: () {
                    Navigator.of(context).pushNamed(
                      'booking_page',
                    );
                  },
                ),
              )
            ],
          )),
    );
  }
}

class AboutDoctor extends StatelessWidget {
  const AboutDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          const CircleAvatar(
            radius: 65.1,
            backgroundImage: AssetImage('assets/profile3.jpg'),
            backgroundColor: Colors.white,
          ),
          Config.spaceMedium,
          Text(
            'Dr Tenma Kenzo',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Config.spaceSmall,
          SizedBox(
            width: Config.widthSize * 0.75,
            child: Text(
              "Japanese neurosurgeon working at Eisler Memorial Hospital in Düsseldorf. his father and brother also being doctors and that his family ties grew weaker when he left Japan for Germany.",
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
          Config.spaceSmall,
          SizedBox(
            width: Config.widthSize * 0.75,
            child: Text(
              'Eisler Memorial Hospital in Düsseldorf, Germany.',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class DetailBody extends StatelessWidget {
  const DetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Config.spaceSmall,
          DoctorInfo(),
          Config.spaceMedium,
          Text(
            'About Doctor',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          // Config.spaceSmall,
          Text(
            "lorem ipsum dolor sit amet",
            style: TextStyle(fontWeight: FontWeight.w500, height: 1.5),
            softWrap: true,
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }
}

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        InfoCard(label: 'Patiens', value: '73'),
        SizedBox(width: 15),
        InfoCard(label: 'Experiences', value: '10 years'),
        SizedBox(width: 15),
        InfoCard(label: 'rating', value: '4.5'),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({super.key, required this.label, required this.value});

  final String label;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Config.primaryColor,
        ),
        padding: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 15,
        ),
        child: Column(
          children: <Widget>[
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              value,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
