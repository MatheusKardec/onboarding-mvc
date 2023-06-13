import 'models/onboarding_models.dart';

class OnboadingData {
  final List<OnboardingItem> infoPages = [
    OnboardingItem(
      title: "Título para a primeira página", 
      text: "Aqui ficaria o texto para a primeira página", 
      image: "assets/images/img_1.png"
    ),
    OnboardingItem(
      title: "Título para a segunda página ", 
      text: "Aqui ficaria o texto para a segunda página", 
      image: "assets/images/img_2.png"
    ),
    OnboardingItem(
      title: "Título para a terceira página ", 
      text: "Aqui ficaria o texto para a terceira página ", 
      image: "assets/images/img_3.png"
    ),
  ]; 
}