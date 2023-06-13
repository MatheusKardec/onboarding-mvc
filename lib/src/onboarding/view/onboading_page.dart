import 'package:flutter/material.dart';

import '../../home/home_page.dart';
import '../data/onboarding_controller.dart';
import '../data/onboarding_data.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);
  @override
  State<OnboardingPage> createState() => OnboardingPageState();
}
class OnboardingPageState extends State<OnboardingPage> {

  final OnBoardingController _controller = OnBoardingController();

  @override
  void dispose(){
  _controller.pageController.dispose();
  super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: ()=> Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (context) => const HomePage())),
            child: const Text(
              'Pular',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              )
            )
          )
        ],
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      // backgroundColor: Colors.grey[350],
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: PageView.builder(
                      padEnds: true,
                      itemCount: OnboadingData().infoPages.length,
                      controller: _controller.pageController,
                      onPageChanged: (int page){
                        setState(() {
                          _controller.changePage(page);
                        });
                      },
                      itemBuilder: (context, index){
                        return Align(
                          child: Column(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  child: Center(
                                    child: Image.asset(
                                      OnboadingData().infoPages[index].image,
                                      height: MediaQuery.of(context).size.height * 0.2733,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                ),
                              ),
                              const SizedBox(height: 80,),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.9,
                                    child: Text(
                                      OnboadingData().infoPages[index].title,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height * 0.03,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.9,
                                    child: Text(
                                      OnboadingData().infoPages[index].text,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                                ),
                              )
                        
                            ],
                          ),
                        );
                      }
                    ),
                  ),
                  // INDICATOR PAGE
                  Column(
                    children: [
                      const Spacer(),
                      SizedBox(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            OnboadingData().infoPages.length, (index){
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 3),
                                child: AnimatedContainer(
                                  width: index == _controller.indexPage ? 30 : 15,
                                  height: 6,
                                  duration: const Duration(milliseconds: 500),
                                  decoration:  BoxDecoration(
                                    color: index == _controller.indexPage ? const Color(0xFF212121) : Colors.grey,
                                    borderRadius: const BorderRadius.all(Radius.circular(30))
                                  ),
                                ),
                              );
                            }
                          )
                        )
                      ),
                      const Spacer(),
                    ],
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _controller.nextPage(
                    onPressedNavigator: ()=> Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (context) => const HomePage())), 
                    pageEnd: _controller.indexPage == (OnboadingData().infoPages.length -1)
                  );
                });
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, 
                backgroundColor: const Color(0xFF212121), 
                minimumSize: Size(MediaQuery.of(context).size.width * 0.9, 40),
                elevation: 3,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text(
                      'Próximo',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 8,),
                    Icon(Icons.arrow_forward)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
