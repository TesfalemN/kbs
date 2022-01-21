import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddStudentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                'Add New Student',
                style: GoogleFonts.kanit(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 120,
          ),
          SizedBox(
            width: 550,
            child: Form(
              child: Column(
                children: [
                  const TextField(
                    decoration: InputDecoration(
                      isDense: true,
                      labelText: 'Student Id',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      isDense: true,
                      labelText: 'Student Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      isDense: true,
                      labelText: 'Department',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  MaterialButton(
                    color: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        4,
                      ),
                    ),
                    height: 55,
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.add_circle_outline,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Add Student',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
