import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  UnderlineInputBorder _buildUnderlineBorder(Color color) {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: color),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff75A944),
            Color(0xff79AC46),
            Color(0xff599621),
            Color(0xff75A944),
            Color(0xff91B95F),
            Color(0xff669F30),
            Color(0xff3F870B)
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Register here",
            style: GoogleFonts.robotoCondensed(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 35,
            ),
            textAlign: TextAlign.center,
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.fromLTRB(250, 50, 250, 50),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Add your details here",
                  style: GoogleFonts.robotoCondensed(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 25),
                _buildTextField("Your Name", "Enter Your Name"),
                const SizedBox(height: 25),
                _buildTextField("Vehicle Number", "Enter Your Vehicle Number"),
                const SizedBox(height: 25),
                _buildTextField("Mobile Number", "Enter Your Mobile Number",
                    keyboardType: TextInputType.phone, maxLength: 10),
                const SizedBox(height: 25),
                _buildTextField("Email ID", "Enter Your Email ID"),
                const SizedBox(height: 25),
                _buildTextField("Adhaar Number", "Enter Your Adhaar Number"),
                const SizedBox(height: 25),
                _buildTextField("Emergency Contact Number",
                    "Enter Emergency Contact Number",
                    keyboardType: TextInputType.phone, maxLength: 10,),
                const SizedBox(height: 25),
                _buildTextField("District", "Enter Your District"),
                const SizedBox(height: 25),
                _buildTextField("State", "Enter Your State"),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffd6b4fc),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Text(
                      "Register",
                      style: GoogleFonts.robotoCondensed(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint,
      {TextInputType keyboardType = TextInputType.text, int? maxLength}) {
    return TextField(
      keyboardType: keyboardType,
      inputFormatters: maxLength != null
          ? [LengthLimitingTextInputFormatter(maxLength)]
          : null,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        hintStyle: GoogleFonts.poppins(
          color: const Color.fromARGB(142, 255, 255, 255),
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        labelStyle: GoogleFonts.robotoCondensed(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        border: _buildUnderlineBorder(Colors.white),
        enabledBorder: _buildUnderlineBorder(Colors.white),
        focusedBorder: _buildUnderlineBorder(Colors.white),
        errorBorder: _buildUnderlineBorder(Colors.red),
        counterText: "", // This removes the character counter below the field
      ),
      style: GoogleFonts.robotoCondensed(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}