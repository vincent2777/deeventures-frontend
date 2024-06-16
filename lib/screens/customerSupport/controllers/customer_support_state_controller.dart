import 'package:get/get.dart';

import '../models/social_media_contact_model.dart';

class CustomerSupportStateController extends GetxController {

  final List<SocialMediaItem> _contacts = [
    SocialMediaItem(title: "WhatsApp", icon: "assets/images/whatsapp.png"),
    SocialMediaItem(title: "Call Line", icon: "assets/images/call.png"),
  ];
  final List<SocialMediaItem> _socialMedia = [
    SocialMediaItem(title: "Facebook", icon: "assets/images/facebook.png"),
    SocialMediaItem(title: "Instagram", icon: "assets/images/instagram.png"),
    SocialMediaItem(title: "Twitter", icon: "assets/images/twitter.png"),
    SocialMediaItem(title: "Telegram", icon: "assets/images/telegram.png"),
    SocialMediaItem(title: "Youtube", icon: "assets/images/youtube.png"),
  ];


  /*
  * GETTERS
  * */
  List<SocialMediaItem> get contacts => _contacts;
  List<SocialMediaItem> get socialMedia => _socialMedia;
}