import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/social_media_contact_model.dart';

class CustomerSupportStateController extends GetxController {
  String phoneNumber = '+2348139247617'; // Replace with your phone number

  final List<SocialMediaItem> _contacts = [
    SocialMediaItem(title: "WhatsApp", icon: "assets/images/whatsapp.png"),
    SocialMediaItem(title: "Call Line", icon: "assets/images/call.png"),
  ];
  final List<SocialMediaItem> _socialMedia = [
    // SocialMediaItem(title: "Facebook", icon: "assets/images/facebook.png"),
    SocialMediaItem(title: "Instagram", icon: "assets/images/instagram.png"),
    SocialMediaItem(title: "Telegram", icon: "assets/images/telegram.png"),
  ];

  /*
  * GETTERS
  * */
  List<SocialMediaItem> get contacts => _contacts;

  List<SocialMediaItem> get socialMedia => _socialMedia;

  Future<void> launchWhatsAppWithMessage() async {
    String message = 'Hello Deeventures!';

    Uri uri = Uri.parse('whatsapp://send?phone=$phoneNumber&text=${Uri.encodeComponent(message)}');

    try {
      await launchUrl(uri);
    } catch (e) {
      print('WhatsApp is not installed or cannot be launched.');
    }
  }

  Future<void> launchWhatsAppVoiceCall() async {

    Uri uri = Uri.parse('whatsapp://call?phone=$phoneNumber');

    try {
      await launchUrl(uri);
    } catch (e) {
      print('WhatsApp is not installed or cannot be launched.');
    }
  }

  Future<void> launchWhatsAppVideoCall() async {
    String phoneNumber = '1234567890'; // Replace with the desired phone number

    Uri uri = Uri.parse('whatsapp://videocall?phone=$phoneNumber');

    try {
      await launchUrl(uri);
    } catch (e) {
      print('WhatsApp is not installed or cannot be launched.');
    }
  }


  Future<void> makePhoneCall() async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}
