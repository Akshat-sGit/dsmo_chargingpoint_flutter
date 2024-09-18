// ignore_for_file: unused_field

import 'package:chargingpoint/pages/overview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isPressed = false;
  bool _isLocked = true;
  var fluttertts = FlutterTts();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTap() {
    setState(() {
      _isPressed = !_isPressed;
      _controller.forward().then((value) {
        _navigateToNextPage();
        fluttertts.speak("Welcome to Kheer\n Your Personalized Assistant");
      });
    });
  }

  void _navigateToNextPage() {
    Navigator.of(context).push(_createRoute());
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const Overview(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: animation,
            child: child,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: width,
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
          child: Stack(
            children: <Widget>[
              Positioned(
                left: width * 0.2,
                top: height * 0.2,
                child: SizedBox(
                  child: Text(
                    "Hello",
                    style: GoogleFonts.robotoCondensed(
                      color: Colors.black,
                      fontSize: height * 0.05,
                      height: 1.5,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: width * 0.2,
                top: height * 0.254,
                child: SizedBox(
                  child: Text(
                    'NAMO',
                    style: GoogleFonts.robotoCondensed(
                      color: Colors.black,
                      fontSize: height * 0.13,
                      height: 1,
                      letterSpacing: -4.59,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: height * 0.32,
                left: width * 0.45,
                child: ClipOval(
                  child: Container(
                    height: height * 1.2,
                    width: width * 1.5,
                    decoration: const ShapeDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xffD9D9D9), Color(0xffFFFFFF)],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft),
                      shape: OvalBorder(),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: height * 0.5,
                left: width * 0.5,
                child: GestureDetector(
                  onTap: _onTap,
                  child: IconButton(
                    icon: Icon(
                      _isLocked ? Icons.lock : Icons.lock_open,
                      size: height * 0.1,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      setState(() {
                        _isLocked = !_isLocked;
                      });

                      if (!_isLocked) {
                        await Future.delayed(const Duration(milliseconds: 300));
                        if (context.mounted) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Overview(),
                            ),
                          );
                        }
                        _isLocked = true;
                      }
                    },
                  ),
                ),
              ),
              Positioned(
                top: height * 0.86,
                left: width * 0.9,
                child: Column(
                  children: [
                    const Text("Powered By"),
                    Container(
                      height: height * 0.09,
                      width: width * 0.09,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/logo.png"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
