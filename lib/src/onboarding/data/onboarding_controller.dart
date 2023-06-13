import 'package:flutter/material.dart';

class OnBoardingController {

  final PageController pageController = PageController(initialPage: 0, viewportFraction: 0.98);
  
  int page = 0;
  int get indexPage => page;

  /// função para ir para a próxima pagina do onboarding 
  void nextPage({required Function() onPressedNavigator, required bool pageEnd}){    
    if (pageEnd) {
      onPressedNavigator();
    }else {

      page = pageController.page!.floor() + 1;

      pageController.nextPage(
        duration: const Duration(milliseconds: 500), 
        curve: Curves.decelerate
      );
    }
  }

  /// função para ser chamada ao arrastar a pagina do Onboarding para o lado  
  void changePage(int value){
    page = value;

    pageController.animateToPage(
      page, 
      duration: const Duration(milliseconds: 500), 
      curve: Curves.decelerate
    );
  }

}