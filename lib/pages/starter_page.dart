import 'package:car_application/pages/home_page.dart';
import 'package:car_application/pages/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class StarterPage extends StatefulWidget {
  const StarterPage({super.key});

  @override
  State<StarterPage> createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage> with TickerProviderStateMixin {
  late final AnimationController _scaleController;
  late final Animation<double> _scaleAnimation;

  bool hide = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800)
      );
    
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 30.0
    ).animate(_scaleController)..addStatusListener((status) {
      if(status == AnimationStatus.completed) {
        Navigator.push(context, PageTransition(
          child: const HomePage(),
          type: PageTransitionType.fade));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/third-car.png',
              ),
              fit: BoxFit.cover),
        ),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
              Colors.black.withOpacity(.9),
              Colors.black.withOpacity(.4)
          ])),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget> [
                const Text('Brand New Perspective',style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                const SizedBox(height: 20,),
                const Text("Let's start with our new collection",style: TextStyle(color: Colors.white, fontSize: 20),),
                const SizedBox(height: 100,),
                InkWell(
                  onTap: () {
                    setState(() {
                      hide = true;
                    });
                    _scaleController.forward();
                  },
                  child: AnimatedBuilder(
                    animation: _scaleController,
                    builder: (context, child) => Transform.scale(
                      scale: _scaleAnimation.value,
                      child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white
                      ),
                      child: Center(child: hide == false ? const Text('Get start', style: TextStyle(fontWeight: FontWeight.bold,),) : Container()),
                    ),
                    ),
                    
                  ),
                ),
                const SizedBox(height: 30,),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.white)
                  ),
                  child: const Center(child: Text('Create Account', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)),
                ),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    const SizedBox(width: 3,),
                    GestureDetector(
                      onTap: () => goToSignInPage(context),
                      child: Text('Sign In', style: TextStyle(color: Colors.blue[300], fontWeight: FontWeight.bold),))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void goToSignInPage (context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignInPage()));
}
