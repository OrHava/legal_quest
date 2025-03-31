// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Legal Quest`
  String get appTitle {
    return Intl.message(
      'Legal Quest',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get homeTitle {
    return Intl.message(
      'Home',
      name: 'homeTitle',
      desc: '',
      args: [],
    );
  }

  /// `My Work`
  String get workTitle {
    return Intl.message(
      'My Work',
      name: 'workTitle',
      desc: '',
      args: [],
    );
  }

  /// `About Me`
  String get aboutTitle {
    return Intl.message(
      'About Me',
      name: 'aboutTitle',
      desc: '',
      args: [],
    );
  }

  /// `Contact`
  String get contactTitle {
    return Intl.message(
      'Contact',
      name: 'contactTitle',
      desc: '',
      args: [],
    );
  }

  /// `Testimonials`
  String get testimonialsTitle {
    return Intl.message(
      'Testimonials',
      name: 'testimonialsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Where Creativity Meets Innovation`
  String get text_home_1 {
    return Intl.message(
      'Where Creativity Meets Innovation',
      name: 'text_home_1',
      desc: '',
      args: [],
    );
  }

  /// `Explore Cutting-Edge Projects`
  String get text_home_2 {
    return Intl.message(
      'Explore Cutting-Edge Projects',
      name: 'text_home_2',
      desc: '',
      args: [],
    );
  }

  /// `Let's Push the Boundaries Together`
  String get text_home_3 {
    return Intl.message(
      'Let\'s Push the Boundaries Together',
      name: 'text_home_3',
      desc: '',
      args: [],
    );
  }

  /// `Launch Space Dodge`
  String get launch_Space_Dodge {
    return Intl.message(
      'Launch Space Dodge',
      name: 'launch_Space_Dodge',
      desc: '',
      args: [],
    );
  }

  /// `Learn More`
  String get learn_more {
    return Intl.message(
      'Learn More',
      name: 'learn_more',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Or Hava Portfolio`
  String get welcome_to_Or_Hava_Portfolio {
    return Intl.message(
      'Welcome to Or Hava Portfolio',
      name: 'welcome_to_Or_Hava_Portfolio',
      desc: '',
      args: [],
    );
  }

  /// `View On GitHub`
  String get view_Demo {
    return Intl.message(
      'View On GitHub',
      name: 'view_Demo',
      desc: '',
      args: [],
    );
  }

  /// `See Project Details`
  String get see_Project_Details {
    return Intl.message(
      'See Project Details',
      name: 'see_Project_Details',
      desc: '',
      args: [],
    );
  }

  /// `👋 Hi, I'm Or Hava!`
  String get greeting {
    return Intl.message(
      '👋 Hi, I\'m Or Hava!',
      name: 'greeting',
      desc: '',
      args: [],
    );
  }

  /// `I’m a visionary software engineer with a passion for transforming ideas into impactful applications. \nI specialize in crafting personalized solutions that resonate with users and elevate businesses to new heights.`
  String get introduction {
    return Intl.message(
      'I’m a visionary software engineer with a passion for transforming ideas into impactful applications. \nI specialize in crafting personalized solutions that resonate with users and elevate businesses to new heights.',
      name: 'introduction',
      desc: '',
      args: [],
    );
  }

  /// `I believe in the magic of user-centric design and seamless functionality. Together, let’s unlock the potential of your ideas and create experiences that inspire. 🚀`
  String get belief {
    return Intl.message(
      'I believe in the magic of user-centric design and seamless functionality. Together, let’s unlock the potential of your ideas and create experiences that inspire. 🚀',
      name: 'belief',
      desc: '',
      args: [],
    );
  }

  /// `My Skills`
  String get my_Skills {
    return Intl.message(
      'My Skills',
      name: 'my_Skills',
      desc: '',
      args: [],
    );
  }

  /// `Contact Me`
  String get contact_me {
    return Intl.message(
      'Contact Me',
      name: 'contact_me',
      desc: '',
      args: [],
    );
  }

  /// `name`
  String get name {
    return Intl.message(
      'name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get message {
    return Intl.message(
      'Message',
      name: 'message',
      desc: '',
      args: [],
    );
  }

  /// `Send Message`
  String get send_message {
    return Intl.message(
      'Send Message',
      name: 'send_message',
      desc: '',
      args: [],
    );
  }

  /// `Get in Touch`
  String get get_in_touch {
    return Intl.message(
      'Get in Touch',
      name: 'get_in_touch',
      desc: '',
      args: [],
    );
  }

  /// `or6562@gmail.com`
  String get email_value {
    return Intl.message(
      'or6562@gmail.com',
      name: 'email_value',
      desc: '',
      args: [],
    );
  }

  /// `+972 0524509188`
  String get phone_value {
    return Intl.message(
      '+972 0524509188',
      name: 'phone_value',
      desc: '',
      args: [],
    );
  }

  /// `Tel Aviv, Israel`
  String get location_value {
    return Intl.message(
      'Tel Aviv, Israel',
      name: 'location_value',
      desc: '',
      args: [],
    );
  }

  /// `Chat on WhatsApp`
  String get chat_on_whatsapp {
    return Intl.message(
      'Chat on WhatsApp',
      name: 'chat_on_whatsapp',
      desc: '',
      args: [],
    );
  }

  /// `Message sent successfully!`
  String get message_sent {
    return Intl.message(
      'Message sent successfully!',
      name: 'message_sent',
      desc: '',
      args: [],
    );
  }

  /// `Failed to send message: `
  String get message_failed {
    return Intl.message(
      'Failed to send message: ',
      name: 'message_failed',
      desc: '',
      args: [],
    );
  }

  /// `About Me`
  String get about_me {
    return Intl.message(
      'About Me',
      name: 'about_me',
      desc: '',
      args: [],
    );
  }

  /// `Who I Am`
  String get who_i_am {
    return Intl.message(
      'Who I Am',
      name: 'who_i_am',
      desc: '',
      args: [],
    );
  }

  /// `Our Services`
  String get our_services {
    return Intl.message(
      'Our Services',
      name: 'our_services',
      desc: '',
      args: [],
    );
  }

  /// `Why Me?`
  String get why_me {
    return Intl.message(
      'Why Me?',
      name: 'why_me',
      desc: '',
      args: [],
    );
  }

  /// `Digital Transformation`
  String get digital_transformation {
    return Intl.message(
      'Digital Transformation',
      name: 'digital_transformation',
      desc: '',
      args: [],
    );
  }

  /// `Web Development`
  String get web_development {
    return Intl.message(
      'Web Development',
      name: 'web_development',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Development`
  String get mobile_development {
    return Intl.message(
      'Mobile Development',
      name: 'mobile_development',
      desc: '',
      args: [],
    );
  }

  /// `AI & Machine Learning`
  String get ai_machine_learning {
    return Intl.message(
      'AI & Machine Learning',
      name: 'ai_machine_learning',
      desc: '',
      args: [],
    );
  }

  /// `Expertise`
  String get expertise {
    return Intl.message(
      'Expertise',
      name: 'expertise',
      desc: '',
      args: [],
    );
  }

  /// `Innovation`
  String get innovation {
    return Intl.message(
      'Innovation',
      name: 'innovation',
      desc: '',
      args: [],
    );
  }

  /// `Client-Focused`
  String get client_focused {
    return Intl.message(
      'Client-Focused',
      name: 'client_focused',
      desc: '',
      args: [],
    );
  }

  /// `Proven Results`
  String get proven_results {
    return Intl.message(
      'Proven Results',
      name: 'proven_results',
      desc: '',
      args: [],
    );
  }

  /// `I am a passionate software developer with expertise in web and mobile application development. With years of experience in the tech industry, I specialize in creating innovative solutions that drive business growth and enhance user experiences.`
  String get who_i_am_content {
    return Intl.message(
      'I am a passionate software developer with expertise in web and mobile application development. With years of experience in the tech industry, I specialize in creating innovative solutions that drive business growth and enhance user experiences.',
      name: 'who_i_am_content',
      desc: '',
      args: [],
    );
  }

  /// `Transforming businesses with tech-driven solutions`
  String get digital_transformation_description {
    return Intl.message(
      'Transforming businesses with tech-driven solutions',
      name: 'digital_transformation_description',
      desc: '',
      args: [],
    );
  }

  /// `Creating modern web applications`
  String get web_development_description {
    return Intl.message(
      'Creating modern web applications',
      name: 'web_development_description',
      desc: '',
      args: [],
    );
  }

  /// `Building iOS and Android apps`
  String get mobile_development_description {
    return Intl.message(
      'Building iOS and Android apps',
      name: 'mobile_development_description',
      desc: '',
      args: [],
    );
  }

  /// `Building smart, scalable AI-powered solutions`
  String get ai_machine_learning_description {
    return Intl.message(
      'Building smart, scalable AI-powered solutions',
      name: 'ai_machine_learning_description',
      desc: '',
      args: [],
    );
  }

  /// `Years of experience with deep industry knowledge.`
  String get expertise_description {
    return Intl.message(
      'Years of experience with deep industry knowledge.',
      name: 'expertise_description',
      desc: '',
      args: [],
    );
  }

  /// `Leveraging the latest trends for cutting-edge solutions.`
  String get innovation_description {
    return Intl.message(
      'Leveraging the latest trends for cutting-edge solutions.',
      name: 'innovation_description',
      desc: '',
      args: [],
    );
  }

  /// `I prioritize client needs to deliver tailor-made solutions.`
  String get client_focused_description {
    return Intl.message(
      'I prioritize client needs to deliver tailor-made solutions.',
      name: 'client_focused_description',
      desc: '',
      args: [],
    );
  }

  /// `Successfully delivered projects, on time and within budget.`
  String get proven_results_description {
    return Intl.message(
      'Successfully delivered projects, on time and within budget.',
      name: 'proven_results_description',
      desc: '',
      args: [],
    );
  }

  /// `To request a meeting about building a project and more, contact me directly or fill out the form.`
  String get meeting_request_description {
    return Intl.message(
      'To request a meeting about building a project and more, contact me directly or fill out the form.',
      name: 'meeting_request_description',
      desc: '',
      args: [],
    );
  }

  /// `Your Name`
  String get contact_form_name_label {
    return Intl.message(
      'Your Name',
      name: 'contact_form_name_label',
      desc: '',
      args: [],
    );
  }

  /// `Your Email`
  String get contact_form_email_label {
    return Intl.message(
      'Your Email',
      name: 'contact_form_email_label',
      desc: '',
      args: [],
    );
  }

  /// `Your Message`
  String get contact_form_message_label {
    return Intl.message(
      'Your Message',
      name: 'contact_form_message_label',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your name`
  String get contact_form_name_error {
    return Intl.message(
      'Please enter your name',
      name: 'contact_form_name_error',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid email`
  String get contact_form_email_error {
    return Intl.message(
      'Enter a valid email',
      name: 'contact_form_email_error',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a message`
  String get contact_form_message_error {
    return Intl.message(
      'Please enter a message',
      name: 'contact_form_message_error',
      desc: '',
      args: [],
    );
  }

  /// `Send Message`
  String get contact_form_send_button {
    return Intl.message(
      'Send Message',
      name: 'contact_form_send_button',
      desc: '',
      args: [],
    );
  }

  /// `Get in Touch`
  String get contact_info_title {
    return Intl.message(
      'Get in Touch',
      name: 'contact_info_title',
      desc: '',
      args: [],
    );
  }

  /// `or6562@gmail.com`
  String get contact_info_email {
    return Intl.message(
      'or6562@gmail.com',
      name: 'contact_info_email',
      desc: '',
      args: [],
    );
  }

  /// `+972 0524509188`
  String get contact_info_phone {
    return Intl.message(
      '+972 0524509188',
      name: 'contact_info_phone',
      desc: '',
      args: [],
    );
  }

  /// `Tel Aviv, Israel`
  String get contact_info_location {
    return Intl.message(
      'Tel Aviv, Israel',
      name: 'contact_info_location',
      desc: '',
      args: [],
    );
  }

  /// `Chat on WhatsApp`
  String get whatsapp_chat_label {
    return Intl.message(
      'Chat on WhatsApp',
      name: 'whatsapp_chat_label',
      desc: '',
      args: [],
    );
  }

  /// `You Reached Your Daily Limits.`
  String get daily_limit_reached_message {
    return Intl.message(
      'You Reached Your Daily Limits.',
      name: 'daily_limit_reached_message',
      desc: '',
      args: [],
    );
  }

  /// `copied to clipboard!`
  String get clipboard_copy_message {
    return Intl.message(
      'copied to clipboard!',
      name: 'clipboard_copy_message',
      desc: '',
      args: [],
    );
  }

  /// `Let's`
  String get lets {
    return Intl.message(
      'Let\'s',
      name: 'lets',
      desc: '',
      args: [],
    );
  }

  /// `Talk`
  String get talk {
    return Intl.message(
      'Talk',
      name: 'talk',
      desc: '',
      args: [],
    );
  }

  /// `Write your message here`
  String get write_your_message_here {
    return Intl.message(
      'Write your message here',
      name: 'write_your_message_here',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacy_policy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Service`
  String get terms_of_service {
    return Intl.message(
      'Terms of Service',
      name: 'terms_of_service',
      desc: '',
      args: [],
    );
  }

  /// `Cookie Policy`
  String get cookie_policy {
    return Intl.message(
      'Cookie Policy',
      name: 'cookie_policy',
      desc: '',
      args: [],
    );
  }

  /// `© 2024 Or Hava Portfolio. All rights reserved.`
  String get portfolio_footer_text {
    return Intl.message(
      '© 2024 Or Hava Portfolio. All rights reserved.',
      name: 'portfolio_footer_text',
      desc: '',
      args: [],
    );
  }

  /// `I built this page to showcase my projects and skills to potential clients and employers. My focus is on creating exceptional web and mobile applications, whether you need a website, a mobile app, or both for Android, iOS, and web platforms. I am determined and committed to delivering exactly what my clients need. I won't stop until I achieve your vision, ensuring you are satisfied with the final product.`
  String get description_text {
    return Intl.message(
      'I built this page to showcase my projects and skills to potential clients and employers. My focus is on creating exceptional web and mobile applications, whether you need a website, a mobile app, or both for Android, iOS, and web platforms. I am determined and committed to delivering exactly what my clients need. I won\'t stop until I achieve your vision, ensuring you are satisfied with the final product.',
      name: 'description_text',
      desc: '',
      args: [],
    );
  }

  /// `🌐 Custom Websites`
  String get skill_custom_websites {
    return Intl.message(
      '🌐 Custom Websites',
      name: 'skill_custom_websites',
      desc: '',
      args: [],
    );
  }

  /// `📱 Mobile Apps (Android/iOS)`
  String get skill_mobile_apps {
    return Intl.message(
      '📱 Mobile Apps (Android/iOS)',
      name: 'skill_mobile_apps',
      desc: '',
      args: [],
    );
  }

  /// `🔌 Backend Integration`
  String get skill_backend_integration {
    return Intl.message(
      '🔌 Backend Integration',
      name: 'skill_backend_integration',
      desc: '',
      args: [],
    );
  }

  /// `🤝 Client Collaboration`
  String get skill_client_collaboration {
    return Intl.message(
      '🤝 Client Collaboration',
      name: 'skill_client_collaboration',
      desc: '',
      args: [],
    );
  }

  /// `Let's connect and discuss how I can help bring your ideas to life!`
  String get closing_message {
    return Intl.message(
      'Let\'s connect and discuss how I can help bring your ideas to life!',
      name: 'closing_message',
      desc: '',
      args: [],
    );
  }

  /// `Learn More About Me`
  String get app_bar_title {
    return Intl.message(
      'Learn More About Me',
      name: 'app_bar_title',
      desc: '',
      args: [],
    );
  }

  /// `Hi, I'm Or Hava`
  String get greeting_name {
    return Intl.message(
      'Hi, I\'m Or Hava',
      name: 'greeting_name',
      desc: '',
      args: [],
    );
  }

  /// `A Passionate Software Engineer`
  String get greeting_profession {
    return Intl.message(
      'A Passionate Software Engineer',
      name: 'greeting_profession',
      desc: '',
      args: [],
    );
  }

  /// `How It Works`
  String get how_it_work {
    return Intl.message(
      'How It Works',
      name: 'how_it_work',
      desc: '',
      args: [],
    );
  }

  /// `Our website connects users with AI-powered tools to generate legal documents quickly and efficiently. By leveraging the ChatGPT API and user data, we create customized legal contracts, agreements, and other documents that are tailored to your specific needs. Our system processes your inputs, analyzes the information, and produces documents that are legally sound and ready for use.`
  String get how_it_works_content {
    return Intl.message(
      'Our website connects users with AI-powered tools to generate legal documents quickly and efficiently. By leveraging the ChatGPT API and user data, we create customized legal contracts, agreements, and other documents that are tailored to your specific needs. Our system processes your inputs, analyzes the information, and produces documents that are legally sound and ready for use.',
      name: 'how_it_works_content',
      desc: '',
      args: [],
    );
  }

  /// `Generate contracts, agreements, and other legal documents using AI.`
  String get legal_document_generation {
    return Intl.message(
      'Generate contracts, agreements, and other legal documents using AI.',
      name: 'legal_document_generation',
      desc: '',
      args: [],
    );
  }

  /// `We ensure your personal data is securely processed and not shared.`
  String get data_privacy {
    return Intl.message(
      'We ensure your personal data is securely processed and not shared.',
      name: 'data_privacy',
      desc: '',
      args: [],
    );
  }

  /// `Get your documents generated quickly without any hassle.`
  String get fast_processing {
    return Intl.message(
      'Get your documents generated quickly without any hassle.',
      name: 'fast_processing',
      desc: '',
      args: [],
    );
  }

  /// `Choose from a variety of templates to suit your needs.`
  String get customizable_templates {
    return Intl.message(
      'Choose from a variety of templates to suit your needs.',
      name: 'customizable_templates',
      desc: '',
      args: [],
    );
  }

  /// `Our documents are powered by the latest AI technology to ensure accuracy and reliability.`
  String get ai_powered {
    return Intl.message(
      'Our documents are powered by the latest AI technology to ensure accuracy and reliability.',
      name: 'ai_powered',
      desc: '',
      args: [],
    );
  }

  /// `We focus on providing a seamless experience for users to easily generate their legal documents.`
  String get user_centric {
    return Intl.message(
      'We focus on providing a seamless experience for users to easily generate their legal documents.',
      name: 'user_centric',
      desc: '',
      args: [],
    );
  }

  /// `We take your privacy seriously and ensure your data is processed securely.`
  String get secure_and_private {
    return Intl.message(
      'We take your privacy seriously and ensure your data is processed securely.',
      name: 'secure_and_private',
      desc: '',
      args: [],
    );
  }

  /// `Access high-quality legal documents at an affordable price without the need for expensive lawyers.`
  String get affordable {
    return Intl.message(
      'Access high-quality legal documents at an affordable price without the need for expensive lawyers.',
      name: 'affordable',
      desc: '',
      args: [],
    );
  }

  /// `Alice Green`
  String get name1 {
    return Intl.message(
      'Alice Green',
      name: 'name1',
      desc: '',
      args: [],
    );
  }

  /// `LegalEase Solutions`
  String get company1 {
    return Intl.message(
      'LegalEase Solutions',
      name: 'company1',
      desc: '',
      args: [],
    );
  }

  /// `This platform makes creating customized legal documents fast and easy. The AI is spot-on, saving us a ton of time.`
  String get testimonial1 {
    return Intl.message(
      'This platform makes creating customized legal documents fast and easy. The AI is spot-on, saving us a ton of time.',
      name: 'testimonial1',
      desc: '',
      args: [],
    );
  }

  /// `Samuel Carter`
  String get name2 {
    return Intl.message(
      'Samuel Carter',
      name: 'name2',
      desc: '',
      args: [],
    );
  }

  /// `Carter Legal Consulting`
  String get company2 {
    return Intl.message(
      'Carter Legal Consulting',
      name: 'company2',
      desc: '',
      args: [],
    );
  }

  /// `Impressive! The ChatGPT API generates high-quality contracts and agreements in minutes, with precision and speed.`
  String get testimonial2 {
    return Intl.message(
      'Impressive! The ChatGPT API generates high-quality contracts and agreements in minutes, with precision and speed.',
      name: 'testimonial2',
      desc: '',
      args: [],
    );
  }

  /// `Rachel Lee`
  String get name3 {
    return Intl.message(
      'Rachel Lee',
      name: 'name3',
      desc: '',
      args: [],
    );
  }

  /// `Innovative Legal Services`
  String get company3 {
    return Intl.message(
      'Innovative Legal Services',
      name: 'company3',
      desc: '',
      args: [],
    );
  }

  /// `A game changer! Custom legal documents are generated quickly, and they're always legally sound.`
  String get testimonial3 {
    return Intl.message(
      'A game changer! Custom legal documents are generated quickly, and they\'re always legally sound.',
      name: 'testimonial3',
      desc: '',
      args: [],
    );
  }

  /// `David Turner`
  String get name4 {
    return Intl.message(
      'David Turner',
      name: 'name4',
      desc: '',
      args: [],
    );
  }

  /// `Turner Legal Group`
  String get company4 {
    return Intl.message(
      'Turner Legal Group',
      name: 'company4',
      desc: '',
      args: [],
    );
  }

  /// `We save hours on document creation. The AI tool is fast, reliable, and easy to use. Highly recommend!`
  String get testimonial4 {
    return Intl.message(
      'We save hours on document creation. The AI tool is fast, reliable, and easy to use. Highly recommend!',
      name: 'testimonial4',
      desc: '',
      args: [],
    );
  }

  /// `Understanding Our Process`
  String get understanding_our_process {
    return Intl.message(
      'Understanding Our Process',
      name: 'understanding_our_process',
      desc: '',
      args: [],
    );
  }

  /// `Services We Offer`
  String get services_we_offer {
    return Intl.message(
      'Services We Offer',
      name: 'services_we_offer',
      desc: '',
      args: [],
    );
  }

  /// `Why Choose Us?`
  String get why_choose_us {
    return Intl.message(
      'Why Choose Us?',
      name: 'why_choose_us',
      desc: '',
      args: [],
    );
  }

  /// `Legal Document Generation`
  String get legal_document_generation_title {
    return Intl.message(
      'Legal Document Generation',
      name: 'legal_document_generation_title',
      desc: '',
      args: [],
    );
  }

  /// `Data Privacy`
  String get data_privacy_title {
    return Intl.message(
      'Data Privacy',
      name: 'data_privacy_title',
      desc: '',
      args: [],
    );
  }

  /// `Fast Processing`
  String get fast_processing_title {
    return Intl.message(
      'Fast Processing',
      name: 'fast_processing_title',
      desc: '',
      args: [],
    );
  }

  /// `Customizable Templates`
  String get customizable_templates_title {
    return Intl.message(
      'Customizable Templates',
      name: 'customizable_templates_title',
      desc: '',
      args: [],
    );
  }

  /// `AI-Powered`
  String get ai_powered_title {
    return Intl.message(
      'AI-Powered',
      name: 'ai_powered_title',
      desc: '',
      args: [],
    );
  }

  /// `User-Centric`
  String get user_centric_title {
    return Intl.message(
      'User-Centric',
      name: 'user_centric_title',
      desc: '',
      args: [],
    );
  }

  /// `Secure & Private`
  String get secure_private_title {
    return Intl.message(
      'Secure & Private',
      name: 'secure_private_title',
      desc: '',
      args: [],
    );
  }

  /// `Affordable`
  String get affordable_title {
    return Intl.message(
      'Affordable',
      name: 'affordable_title',
      desc: '',
      args: [],
    );
  }

  /// `Connect with AI-powered tools for quick and efficient legal document creation.`
  String get animated_text_1 {
    return Intl.message(
      'Connect with AI-powered tools for quick and efficient legal document creation.',
      name: 'animated_text_1',
      desc: '',
      args: [],
    );
  }

  /// `Generate personalized contracts, agreements, and more in minutes.`
  String get animated_text_2 {
    return Intl.message(
      'Generate personalized contracts, agreements, and more in minutes.',
      name: 'animated_text_2',
      desc: '',
      args: [],
    );
  }

  /// `Let AI help you with all your legal document needs.`
  String get animated_text_3 {
    return Intl.message(
      'Let AI help you with all your legal document needs.',
      name: 'animated_text_3',
      desc: '',
      args: [],
    );
  }

  /// `Create Contract`
  String get create_contract {
    return Intl.message(
      'Create Contract',
      name: 'create_contract',
      desc: '',
      args: [],
    );
  }

  /// `Create Lawsuit`
  String get create_lawsuit {
    return Intl.message(
      'Create Lawsuit',
      name: 'create_lawsuit',
      desc: '',
      args: [],
    );
  }

  /// `Create Defense`
  String get create_defense {
    return Intl.message(
      'Create Defense',
      name: 'create_defense',
      desc: '',
      args: [],
    );
  }

  /// `Welcome To Legal Quest`
  String get welcome_title {
    return Intl.message(
      'Welcome To Legal Quest',
      name: 'welcome_title',
      desc: '',
      args: [],
    );
  }

  /// `Generate a detailed contract based on the following details:`
  String get generate_contract_prompt {
    return Intl.message(
      'Generate a detailed contract based on the following details:',
      name: 'generate_contract_prompt',
      desc: '',
      args: [],
    );
  }

  /// `Party A:`
  String get party_a {
    return Intl.message(
      'Party A:',
      name: 'party_a',
      desc: '',
      args: [],
    );
  }

  /// `Party B:`
  String get party_b {
    return Intl.message(
      'Party B:',
      name: 'party_b',
      desc: '',
      args: [],
    );
  }

  /// `ID:`
  String get id {
    return Intl.message(
      'ID:',
      name: 'id',
      desc: '',
      args: [],
    );
  }

  /// `Subject of Contract:`
  String get subject_of_contract {
    return Intl.message(
      'Subject of Contract:',
      name: 'subject_of_contract',
      desc: '',
      args: [],
    );
  }

  /// `details`
  String get details {
    return Intl.message(
      'details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `Ensure the contract is professional, legally valid, and formatted properly.`
  String get ensure_contract {
    return Intl.message(
      'Ensure the contract is professional, legally valid, and formatted properly.',
      name: 'ensure_contract',
      desc: '',
      args: [],
    );
  }

  /// `No contract to download. Generate it first!`
  String get no_contract_to_download {
    return Intl.message(
      'No contract to download. Generate it first!',
      name: 'no_contract_to_download',
      desc: '',
      args: [],
    );
  }

  /// `Create Your Contract`
  String get create_your_contract {
    return Intl.message(
      'Create Your Contract',
      name: 'create_your_contract',
      desc: '',
      args: [],
    );
  }

  /// `Generate professional contracts in minutes`
  String get generate_professional_contracts {
    return Intl.message(
      'Generate professional contracts in minutes',
      name: 'generate_professional_contracts',
      desc: '',
      args: [],
    );
  }

  /// `Quick Start`
  String get quick_start {
    return Intl.message(
      'Quick Start',
      name: 'quick_start',
      desc: '',
      args: [],
    );
  }

  /// `partyAName`
  String get party_a_name {
    return Intl.message(
      'partyAName',
      name: 'party_a_name',
      desc: '',
      args: [],
    );
  }

  /// `partyAId`
  String get party_a_id {
    return Intl.message(
      'partyAId',
      name: 'party_a_id',
      desc: '',
      args: [],
    );
  }

  /// `partyBName`
  String get party_b_name {
    return Intl.message(
      'partyBName',
      name: 'party_b_name',
      desc: '',
      args: [],
    );
  }

  /// `partyBId`
  String get party_b_id {
    return Intl.message(
      'partyBId',
      name: 'party_b_id',
      desc: '',
      args: [],
    );
  }

  /// `Subject of Contract`
  String get subject_of_contract_field {
    return Intl.message(
      'Subject of Contract',
      name: 'subject_of_contract_field',
      desc: '',
      args: [],
    );
  }

  /// `Contract Details`
  String get contract_details {
    return Intl.message(
      'Contract Details',
      name: 'contract_details',
      desc: '',
      args: [],
    );
  }

  /// `Provide clear and detailed information such as key terms, responsibilities, payment terms, and any special conditions.`
  String get contract_details_hint {
    return Intl.message(
      'Provide clear and detailed information such as key terms, responsibilities, payment terms, and any special conditions.',
      name: 'contract_details_hint',
      desc: '',
      args: [],
    );
  }

  /// `Generate Contract`
  String get generate_contract_button {
    return Intl.message(
      'Generate Contract',
      name: 'generate_contract_button',
      desc: '',
      args: [],
    );
  }

  /// `Generated Contract`
  String get generated_contract {
    return Intl.message(
      'Generated Contract',
      name: 'generated_contract',
      desc: '',
      args: [],
    );
  }

  /// `Edit your info here...`
  String get edit_contract_hint {
    return Intl.message(
      'Edit your info here...',
      name: 'edit_contract_hint',
      desc: '',
      args: [],
    );
  }

  /// `Download PDF`
  String get download_pdf {
    return Intl.message(
      'Download PDF',
      name: 'download_pdf',
      desc: '',
      args: [],
    );
  }

  /// `Changes saved successfully!`
  String get changes_saved {
    return Intl.message(
      'Changes saved successfully!',
      name: 'changes_saved',
      desc: '',
      args: [],
    );
  }

  /// `Save Changes`
  String get save_changes {
    return Intl.message(
      'Save Changes',
      name: 'save_changes',
      desc: '',
      args: [],
    );
  }

  /// `Select Example`
  String get select_example {
    return Intl.message(
      'Select Example',
      name: 'select_example',
      desc: '',
      args: [],
    );
  }

  /// `Fill Example Data`
  String get fill_example_data {
    return Intl.message(
      'Fill Example Data',
      name: 'fill_example_data',
      desc: '',
      args: [],
    );
  }

  /// `Please select an example first.`
  String get please_select_example {
    return Intl.message(
      'Please select an example first.',
      name: 'please_select_example',
      desc: '',
      args: [],
    );
  }

  /// `Contract Generator`
  String get contract_generator {
    return Intl.message(
      'Contract Generator',
      name: 'contract_generator',
      desc: '',
      args: [],
    );
  }

  /// `Web Development Contract`
  String get name_example1 {
    return Intl.message(
      'Web Development Contract',
      name: 'name_example1',
      desc: '',
      args: [],
    );
  }

  /// `TechCorp Solutions Inc.`
  String get party_a_name1 {
    return Intl.message(
      'TechCorp Solutions Inc.',
      name: 'party_a_name1',
      desc: '',
      args: [],
    );
  }

  /// `TC-2023-0001`
  String get party_a_id1 {
    return Intl.message(
      'TC-2023-0001',
      name: 'party_a_id1',
      desc: '',
      args: [],
    );
  }

  /// `WebWizards LLC`
  String get party_b_name1 {
    return Intl.message(
      'WebWizards LLC',
      name: 'party_b_name1',
      desc: '',
      args: [],
    );
  }

  /// `WW-2023-0042`
  String get party_b_id1 {
    return Intl.message(
      'WW-2023-0042',
      name: 'party_b_id1',
      desc: '',
      args: [],
    );
  }

  /// `Web Application Development Agreement`
  String get contract_subject1 {
    return Intl.message(
      'Web Application Development Agreement',
      name: 'contract_subject1',
      desc: '',
      args: [],
    );
  }

  /// `This contract outlines the terms and conditions for the development of a custom e-commerce web application. TechCorp Solutions Inc. (the Developer) agrees to design, develop, and deliver a fully functional web application for WebWizards LLC (the Client) within 6 months from the contract start date. The project includes user authentication, product catalog, shopping cart functionality, and payment gateway integration. The total project cost is $75,000, payable in three installments.`
  String get details1 {
    return Intl.message(
      'This contract outlines the terms and conditions for the development of a custom e-commerce web application. TechCorp Solutions Inc. (the Developer) agrees to design, develop, and deliver a fully functional web application for WebWizards LLC (the Client) within 6 months from the contract start date. The project includes user authentication, product catalog, shopping cart functionality, and payment gateway integration. The total project cost is \$75,000, payable in three installments.',
      name: 'details1',
      desc: '',
      args: [],
    );
  }

  /// `Apartment Rental Agreement`
  String get name_example2 {
    return Intl.message(
      'Apartment Rental Agreement',
      name: 'name_example2',
      desc: '',
      args: [],
    );
  }

  /// `Greenfield Properties`
  String get party_a_name2 {
    return Intl.message(
      'Greenfield Properties',
      name: 'party_a_name2',
      desc: '',
      args: [],
    );
  }

  /// `GP-2023-0021`
  String get party_a_id2 {
    return Intl.message(
      'GP-2023-0021',
      name: 'party_a_id2',
      desc: '',
      args: [],
    );
  }

  /// `John Doe`
  String get party_b_name2 {
    return Intl.message(
      'John Doe',
      name: 'party_b_name2',
      desc: '',
      args: [],
    );
  }

  /// `JD-2023-0099`
  String get party_b_id2 {
    return Intl.message(
      'JD-2023-0099',
      name: 'party_b_id2',
      desc: '',
      args: [],
    );
  }

  /// `Residential Lease Agreement`
  String get contract_subject2 {
    return Intl.message(
      'Residential Lease Agreement',
      name: 'contract_subject2',
      desc: '',
      args: [],
    );
  }

  /// `This lease agreement is made between Greenfield Properties (the Landlord) and John Doe (the Tenant) for the rental of the apartment located at 123 Elm Street. The lease term is 12 months starting from January 1, 2024, with a monthly rent of $1,500 payable on the first day of each month. The apartment includes two bedrooms, one bathroom, a living room, and a fully equipped kitchen with modern appliances. Utilities such as water and trash removal are included in the rent, but electricity and internet must be arranged and paid for by the Tenant. The apartment is pet-friendly, allowing up to two pets under 50 pounds each, with a non-refundable pet deposit of $300 per pet and an additional monthly pet fee of $25 per pet. The Tenant is responsible for maintaining the cleanliness of the unit, reporting damages promptly, and adhering to quiet hours from 10:00 PM to 7:00 AM. The Tenant is prohibited from subletting the apartment without the Landlord's written consent. Smoking is strictly prohibited inside the apartment and common areas. Any modifications to the apartment, such as painting or installation of fixtures, require prior written approval from the Landlord. The Tenant is required to provide proof of renter's insurance with a minimum coverage of $50,000 before moving in. Parking is available on-site for one vehicle, with a second spot available for an additional $50 per month. The Landlord reserves the right to conduct periodic inspections with a 24-hour notice to ensure compliance with the lease terms. At the end of the lease term, the Tenant must return the unit in the same condition as when it was received, minus normal wear and tear, to receive the security deposit refund of $1,000. Any breach of the lease terms may result in penalties, eviction, or forfeiture of the security deposit. The Tenant acknowledges receipt of a copy of the property rules and regulations and agrees to abide by them throughout the lease term.`
  String get details2 {
    return Intl.message(
      'This lease agreement is made between Greenfield Properties (the Landlord) and John Doe (the Tenant) for the rental of the apartment located at 123 Elm Street. The lease term is 12 months starting from January 1, 2024, with a monthly rent of \$1,500 payable on the first day of each month. The apartment includes two bedrooms, one bathroom, a living room, and a fully equipped kitchen with modern appliances. Utilities such as water and trash removal are included in the rent, but electricity and internet must be arranged and paid for by the Tenant. The apartment is pet-friendly, allowing up to two pets under 50 pounds each, with a non-refundable pet deposit of \$300 per pet and an additional monthly pet fee of \$25 per pet. The Tenant is responsible for maintaining the cleanliness of the unit, reporting damages promptly, and adhering to quiet hours from 10:00 PM to 7:00 AM. The Tenant is prohibited from subletting the apartment without the Landlord\'s written consent. Smoking is strictly prohibited inside the apartment and common areas. Any modifications to the apartment, such as painting or installation of fixtures, require prior written approval from the Landlord. The Tenant is required to provide proof of renter\'s insurance with a minimum coverage of \$50,000 before moving in. Parking is available on-site for one vehicle, with a second spot available for an additional \$50 per month. The Landlord reserves the right to conduct periodic inspections with a 24-hour notice to ensure compliance with the lease terms. At the end of the lease term, the Tenant must return the unit in the same condition as when it was received, minus normal wear and tear, to receive the security deposit refund of \$1,000. Any breach of the lease terms may result in penalties, eviction, or forfeiture of the security deposit. The Tenant acknowledges receipt of a copy of the property rules and regulations and agrees to abide by them throughout the lease term.',
      name: 'details2',
      desc: '',
      args: [],
    );
  }

  /// `Software Engineer Employment Contract`
  String get name_example3 {
    return Intl.message(
      'Software Engineer Employment Contract',
      name: 'name_example3',
      desc: '',
      args: [],
    );
  }

  /// `Global Enterprises`
  String get party_a_name3 {
    return Intl.message(
      'Global Enterprises',
      name: 'party_a_name3',
      desc: '',
      args: [],
    );
  }

  /// `GE-2023-0055`
  String get party_a_id3 {
    return Intl.message(
      'GE-2023-0055',
      name: 'party_a_id3',
      desc: '',
      args: [],
    );
  }

  /// `Jane Smith`
  String get party_b_name3 {
    return Intl.message(
      'Jane Smith',
      name: 'party_b_name3',
      desc: '',
      args: [],
    );
  }

  /// `JS-2023-0110`
  String get party_b_id3 {
    return Intl.message(
      'JS-2023-0110',
      name: 'party_b_id3',
      desc: '',
      args: [],
    );
  }

  /// `Employment Agreement`
  String get contract_subject3 {
    return Intl.message(
      'Employment Agreement',
      name: 'contract_subject3',
      desc: '',
      args: [],
    );
  }

  /// `This employment agreement is between Global Enterprises (the Employer) and Jane Smith (the Employee). Jane Smith agrees to serve as a Software Engineer starting on February 1, 2024. The annual salary is $90,000 with benefits including health insurance and a retirement plan.`
  String get details3 {
    return Intl.message(
      'This employment agreement is between Global Enterprises (the Employer) and Jane Smith (the Employee). Jane Smith agrees to serve as a Software Engineer starting on February 1, 2024. The annual salary is \$90,000 with benefits including health insurance and a retirement plan.',
      name: 'details3',
      desc: '',
      args: [],
    );
  }

  /// `Charter Flight Service Contract`
  String get name_example4 {
    return Intl.message(
      'Charter Flight Service Contract',
      name: 'name_example4',
      desc: '',
      args: [],
    );
  }

  /// `BlueSky Airlines`
  String get party_a_name4 {
    return Intl.message(
      'BlueSky Airlines',
      name: 'party_a_name4',
      desc: '',
      args: [],
    );
  }

  /// `BS-2023-0077`
  String get party_a_id4 {
    return Intl.message(
      'BS-2023-0077',
      name: 'party_a_id4',
      desc: '',
      args: [],
    );
  }

  /// `SkyHigh Tours Ltd.`
  String get party_b_name4 {
    return Intl.message(
      'SkyHigh Tours Ltd.',
      name: 'party_b_name4',
      desc: '',
      args: [],
    );
  }

  /// `SH-2023-0123`
  String get party_b_id4 {
    return Intl.message(
      'SH-2023-0123',
      name: 'party_b_id4',
      desc: '',
      args: [],
    );
  }

  /// `Charter Flight Service Agreement`
  String get contract_subject4 {
    return Intl.message(
      'Charter Flight Service Agreement',
      name: 'contract_subject4',
      desc: '',
      args: [],
    );
  }

  /// `This agreement is between BlueSky Airlines (the Carrier) and SkyHigh Tours Ltd. (the Client) for charter flight services. The Carrier will provide a Boeing 737 for a charter flight from New York to Los Angeles on March 15, 2024. The total cost for the service is $50,000.`
  String get details4 {
    return Intl.message(
      'This agreement is between BlueSky Airlines (the Carrier) and SkyHigh Tours Ltd. (the Client) for charter flight services. The Carrier will provide a Boeing 737 for a charter flight from New York to Los Angeles on March 15, 2024. The total cost for the service is \$50,000.',
      name: 'details4',
      desc: '',
      args: [],
    );
  }

  /// `Educational Software License`
  String get name_example5 {
    return Intl.message(
      'Educational Software License',
      name: 'name_example5',
      desc: '',
      args: [],
    );
  }

  /// `StarTech Innovations`
  String get party_a_name5 {
    return Intl.message(
      'StarTech Innovations',
      name: 'party_a_name5',
      desc: '',
      args: [],
    );
  }

  /// `STI-2023-0088`
  String get party_a_id5 {
    return Intl.message(
      'STI-2023-0088',
      name: 'party_a_id5',
      desc: '',
      args: [],
    );
  }

  /// `BrightFuture Education Corp.`
  String get party_b_name5 {
    return Intl.message(
      'BrightFuture Education Corp.',
      name: 'party_b_name5',
      desc: '',
      args: [],
    );
  }

  /// `BFEC-2023-0134`
  String get party_b_id5 {
    return Intl.message(
      'BFEC-2023-0134',
      name: 'party_b_id5',
      desc: '',
      args: [],
    );
  }

  /// `Software Licensing Agreement`
  String get contract_subject5 {
    return Intl.message(
      'Software Licensing Agreement',
      name: 'contract_subject5',
      desc: '',
      args: [],
    );
  }

  /// `This agreement grants BrightFuture Education Corp. (the Licensee) a non-exclusive license to use StarTech Innovations' educational software suite. The license term is for two years starting from April 1, 2024, with a licensing fee of $10,000 per year.`
  String get details5 {
    return Intl.message(
      'This agreement grants BrightFuture Education Corp. (the Licensee) a non-exclusive license to use StarTech Innovations\' educational software suite. The license term is for two years starting from April 1, 2024, with a licensing fee of \$10,000 per year.',
      name: 'details5',
      desc: '',
      args: [],
    );
  }

  /// `Public Transportation Agreement`
  String get name_example6 {
    return Intl.message(
      'Public Transportation Agreement',
      name: 'name_example6',
      desc: '',
      args: [],
    );
  }

  /// `City Transport Services`
  String get party_a_name6 {
    return Intl.message(
      'City Transport Services',
      name: 'party_a_name6',
      desc: '',
      args: [],
    );
  }

  /// `CTS-2023-0099`
  String get party_a_id6 {
    return Intl.message(
      'CTS-2023-0099',
      name: 'party_a_id6',
      desc: '',
      args: [],
    );
  }

  /// `Urban Developments Ltd.`
  String get party_b_name6 {
    return Intl.message(
      'Urban Developments Ltd.',
      name: 'party_b_name6',
      desc: '',
      args: [],
    );
  }

  /// `UDL-2023-0145`
  String get party_b_id6 {
    return Intl.message(
      'UDL-2023-0145',
      name: 'party_b_id6',
      desc: '',
      args: [],
    );
  }

  /// `Public Transport Service Contract`
  String get contract_subject6 {
    return Intl.message(
      'Public Transport Service Contract',
      name: 'contract_subject6',
      desc: '',
      args: [],
    );
  }

  /// `City Transport Services (the Provider) agrees to supply public transport services to Urban Developments Ltd. (the Client) for their new residential complex. The contract duration is three years starting from May 1, 2024.`
  String get details6 {
    return Intl.message(
      'City Transport Services (the Provider) agrees to supply public transport services to Urban Developments Ltd. (the Client) for their new residential complex. The contract duration is three years starting from May 1, 2024.',
      name: 'details6',
      desc: '',
      args: [],
    );
  }

  /// `Marketing Campaign Contract`
  String get name_example7 {
    return Intl.message(
      'Marketing Campaign Contract',
      name: 'name_example7',
      desc: '',
      args: [],
    );
  }

  /// `Creative Media Agency`
  String get party_a_name7 {
    return Intl.message(
      'Creative Media Agency',
      name: 'party_a_name7',
      desc: '',
      args: [],
    );
  }

  /// `CMA-2023-0100`
  String get party_a_id7 {
    return Intl.message(
      'CMA-2023-0100',
      name: 'party_a_id7',
      desc: '',
      args: [],
    );
  }

  /// `Fashion Forward Inc.`
  String get party_b_name7 {
    return Intl.message(
      'Fashion Forward Inc.',
      name: 'party_b_name7',
      desc: '',
      args: [],
    );
  }

  /// `FFI-2023-0156`
  String get party_b_id7 {
    return Intl.message(
      'FFI-2023-0156',
      name: 'party_b_id7',
      desc: '',
      args: [],
    );
  }

  /// `Advertising Campaign Agreement`
  String get contract_subject7 {
    return Intl.message(
      'Advertising Campaign Agreement',
      name: 'contract_subject7',
      desc: '',
      args: [],
    );
  }

  /// `Creative Media Agency (the Agency) will create and manage an advertising campaign for Fashion Forward Inc. (the Client). The campaign will run from June to August 2024 with a total budget of $150,000.`
  String get details7 {
    return Intl.message(
      'Creative Media Agency (the Agency) will create and manage an advertising campaign for Fashion Forward Inc. (the Client). The campaign will run from June to August 2024 with a total budget of \$150,000.',
      name: 'details7',
      desc: '',
      args: [],
    );
  }

  /// `Office Building Construction Agreement`
  String get name_example8 {
    return Intl.message(
      'Office Building Construction Agreement',
      name: 'name_example8',
      desc: '',
      args: [],
    );
  }

  /// `EcoBuild Contractors`
  String get party_a_name8 {
    return Intl.message(
      'EcoBuild Contractors',
      name: 'party_a_name8',
      desc: '',
      args: [],
    );
  }

  /// `EBC-2023-0111`
  String get party_a_id8 {
    return Intl.message(
      'EBC-2023-0111',
      name: 'party_a_id8',
      desc: '',
      args: [],
    );
  }

  /// `GreenCity Developers Ltd.`
  String get party_b_name8 {
    return Intl.message(
      'GreenCity Developers Ltd.',
      name: 'party_b_name8',
      desc: '',
      args: [],
    );
  }

  /// `GCDL-2023-0167`
  String get party_b_id8 {
    return Intl.message(
      'GCDL-2023-0167',
      name: 'party_b_id8',
      desc: '',
      args: [],
    );
  }

  /// `Construction Contract Agreement`
  String get contract_subject8 {
    return Intl.message(
      'Construction Contract Agreement',
      name: 'contract_subject8',
      desc: '',
      args: [],
    );
  }

  /// `EcoBuild Contractors (the Contractor) agrees to construct a new office building for GreenCity Developers Ltd. (the Client). The project will commence on July 1, 2024, with an estimated completion date of December 31, 2025.`
  String get details8 {
    return Intl.message(
      'EcoBuild Contractors (the Contractor) agrees to construct a new office building for GreenCity Developers Ltd. (the Client). The project will commence on July 1, 2024, with an estimated completion date of December 31, 2025.',
      name: 'details8',
      desc: '',
      args: [],
    );
  }

  /// `IT Support Service Contract`
  String get name_example9 {
    return Intl.message(
      'IT Support Service Contract',
      name: 'name_example9',
      desc: '',
      args: [],
    );
  }

  /// `Digital Dynamics LLC`
  String get party_a_name9 {
    return Intl.message(
      'Digital Dynamics LLC',
      name: 'party_a_name9',
      desc: '',
      args: [],
    );
  }

  /// `DDL-2023-0122`
  String get party_a_id9 {
    return Intl.message(
      'DDL-2023-0122',
      name: 'party_a_id9',
      desc: '',
      args: [],
    );
  }

  /// `NextGen Tech Solutions Inc.`
  String get party_b_name9 {
    return Intl.message(
      'NextGen Tech Solutions Inc.',
      name: 'party_b_name9',
      desc: '',
      args: [],
    );
  }

  /// `NGTSI-2023-0178`
  String get party_b_id9 {
    return Intl.message(
      'NGTSI-2023-0178',
      name: 'party_b_id9',
      desc: '',
      args: [],
    );
  }

  /// `IT Support Services Agreement`
  String get contract_subject9 {
    return Intl.message(
      'IT Support Services Agreement',
      name: 'contract_subject9',
      desc: '',
      args: [],
    );
  }

  /// `Digital Dynamics LLC (the Provider) will provide IT support services to NextGen Tech Solutions Inc. (the Client). This includes network maintenance and cybersecurity monitoring starting August 1, 2024.`
  String get details9 {
    return Intl.message(
      'Digital Dynamics LLC (the Provider) will provide IT support services to NextGen Tech Solutions Inc. (the Client). This includes network maintenance and cybersecurity monitoring starting August 1, 2024.',
      name: 'details9',
      desc: '',
      args: [],
    );
  }

  /// `Fresh Produce Supply Agreement`
  String get name_example10 {
    return Intl.message(
      'Fresh Produce Supply Agreement',
      name: 'name_example10',
      desc: '',
      args: [],
    );
  }

  /// `FreshFoods Supply Co.`
  String get party_a_name10 {
    return Intl.message(
      'FreshFoods Supply Co.',
      name: 'party_a_name10',
      desc: '',
      args: [],
    );
  }

  /// `FFSC-2023-0133`
  String get party_a_id10 {
    return Intl.message(
      'FFSC-2023-0133',
      name: 'party_a_id10',
      desc: '',
      args: [],
    );
  }

  /// `HealthyEats Restaurant Group`
  String get party_b_name10 {
    return Intl.message(
      'HealthyEats Restaurant Group',
      name: 'party_b_name10',
      desc: '',
      args: [],
    );
  }

  /// `HERG-2023-0189`
  String get party_b_id10 {
    return Intl.message(
      'HERG-2023-0189',
      name: 'party_b_id10',
      desc: '',
      args: [],
    );
  }

  /// `Food Supply Contract Agreement`
  String get contract_subject10 {
    return Intl.message(
      'Food Supply Contract Agreement',
      name: 'contract_subject10',
      desc: '',
      args: [],
    );
  }

  /// `FreshFoods Supply Co. (the Supplier) will deliver fresh produce to HealthyEats Restaurant Group (the Buyer) on a weekly basis starting September 1, 2024. The contract value is estimated at $20,000 per month.`
  String get details10 {
    return Intl.message(
      'FreshFoods Supply Co. (the Supplier) will deliver fresh produce to HealthyEats Restaurant Group (the Buyer) on a weekly basis starting September 1, 2024. The contract value is estimated at \$20,000 per month.',
      name: 'details10',
      desc: '',
      args: [],
    );
  }

  /// `contractSubject`
  String get contract_subject {
    return Intl.message(
      'contractSubject',
      name: 'contract_subject',
      desc: '',
      args: [],
    );
  }

  /// `Defense Writer`
  String get defender_writer {
    return Intl.message(
      'Defense Writer',
      name: 'defender_writer',
      desc: '',
      args: [],
    );
  }

  /// `defender Name`
  String get defender_name {
    return Intl.message(
      'defender Name',
      name: 'defender_name',
      desc: '',
      args: [],
    );
  }

  /// `defender Id`
  String get defender_id {
    return Intl.message(
      'defender Id',
      name: 'defender_id',
      desc: '',
      args: [],
    );
  }

  /// `offense Details`
  String get offense_details {
    return Intl.message(
      'offense Details',
      name: 'offense_details',
      desc: '',
      args: [],
    );
  }

  /// `defense Details`
  String get defense_details {
    return Intl.message(
      'defense Details',
      name: 'defense_details',
      desc: '',
      args: [],
    );
  }

  /// `additional Notes`
  String get additional_notes {
    return Intl.message(
      'additional Notes',
      name: 'additional_notes',
      desc: '',
      args: [],
    );
  }

  /// `Traffic Violation Defense`
  String get traffic_violation_defense {
    return Intl.message(
      'Traffic Violation Defense',
      name: 'traffic_violation_defense',
      desc: '',
      args: [],
    );
  }

  /// `Noise Complaint Defense`
  String get noise_complaint_defense {
    return Intl.message(
      'Noise Complaint Defense',
      name: 'noise_complaint_defense',
      desc: '',
      args: [],
    );
  }

  /// `Write Your Defense`
  String get write_your_defense {
    return Intl.message(
      'Write Your Defense',
      name: 'write_your_defense',
      desc: '',
      args: [],
    );
  }

  /// `Generate Defense`
  String get generate_defense {
    return Intl.message(
      'Generate Defense',
      name: 'generate_defense',
      desc: '',
      args: [],
    );
  }

  /// `Enter the defender's full name`
  String get defender_hint {
    return Intl.message(
      'Enter the defender\'s full name',
      name: 'defender_hint',
      desc: '',
      args: [],
    );
  }

  /// `Enter a unique ID for the defender`
  String get defender_id_hint {
    return Intl.message(
      'Enter a unique ID for the defender',
      name: 'defender_id_hint',
      desc: '',
      args: [],
    );
  }

  /// `Describe the offense details clearly`
  String get offense_details_hint {
    return Intl.message(
      'Describe the offense details clearly',
      name: 'offense_details_hint',
      desc: '',
      args: [],
    );
  }

  /// `Explain the defense argument for the case`
  String get defense_details_hint {
    return Intl.message(
      'Explain the defense argument for the case',
      name: 'defense_details_hint',
      desc: '',
      args: [],
    );
  }

  /// `Optional notes for the defense statement`
  String get additional_notes_hint {
    return Intl.message(
      'Optional notes for the defense statement',
      name: 'additional_notes_hint',
      desc: '',
      args: [],
    );
  }

  /// `Write a detailed defense statement based on the following details:`
  String get write_defense {
    return Intl.message(
      'Write a detailed defense statement based on the following details:',
      name: 'write_defense',
      desc: '',
      args: [],
    );
  }

  /// `Ensure the defense is clear, logical, and persuasive, addressing all relevant points of the offense.`
  String get ensure_defense {
    return Intl.message(
      'Ensure the defense is clear, logical, and persuasive, addressing all relevant points of the offense.',
      name: 'ensure_defense',
      desc: '',
      args: [],
    );
  }

  /// `Traffic Violation Defense`
  String get name_example11 {
    return Intl.message(
      'Traffic Violation Defense',
      name: 'name_example11',
      desc: '',
      args: [],
    );
  }

  /// `John Doe`
  String get defender_name1 {
    return Intl.message(
      'John Doe',
      name: 'defender_name1',
      desc: '',
      args: [],
    );
  }

  /// `JD-2024-0012`
  String get defender_id1 {
    return Intl.message(
      'JD-2024-0012',
      name: 'defender_id1',
      desc: '',
      args: [],
    );
  }

  /// `Speeding in a 40 mph zone at 55 mph on Main Street.`
  String get offense_details1 {
    return Intl.message(
      'Speeding in a 40 mph zone at 55 mph on Main Street.',
      name: 'offense_details1',
      desc: '',
      args: [],
    );
  }

  /// `The speed limit signs were obscured by tree branches, and the radar device used was not calibrated recently.`
  String get defense_details1 {
    return Intl.message(
      'The speed limit signs were obscured by tree branches, and the radar device used was not calibrated recently.',
      name: 'defense_details1',
      desc: '',
      args: [],
    );
  }

  /// `John Doe has no prior violations and was cooperative during the stop.`
  String get additional_notes1 {
    return Intl.message(
      'John Doe has no prior violations and was cooperative during the stop.',
      name: 'additional_notes1',
      desc: '',
      args: [],
    );
  }

  /// `Noise Complaint Defense`
  String get name_example12 {
    return Intl.message(
      'Noise Complaint Defense',
      name: 'name_example12',
      desc: '',
      args: [],
    );
  }

  /// `Emily Green`
  String get defender_name2 {
    return Intl.message(
      'Emily Green',
      name: 'defender_name2',
      desc: '',
      args: [],
    );
  }

  /// `EG-2024-0054`
  String get defender_id2 {
    return Intl.message(
      'EG-2024-0054',
      name: 'defender_id2',
      desc: '',
      args: [],
    );
  }

  /// `Exceeding permissible noise levels during a house party on Nov 25, 2024.`
  String get offense_details2 {
    return Intl.message(
      'Exceeding permissible noise levels during a house party on Nov 25, 2024.',
      name: 'offense_details2',
      desc: '',
      args: [],
    );
  }

  /// `The noise level was within permissible limits, and the complaint was made by a neighbor who has a history of false complaints.`
  String get defense_details2 {
    return Intl.message(
      'The noise level was within permissible limits, and the complaint was made by a neighbor who has a history of false complaints.',
      name: 'defense_details2',
      desc: '',
      args: [],
    );
  }

  /// `The police did not measure the noise level with a decibel meter.`
  String get additional_notes2 {
    return Intl.message(
      'The police did not measure the noise level with a decibel meter.',
      name: 'additional_notes2',
      desc: '',
      args: [],
    );
  }

  /// `Generated Lawsuit`
  String get generated_lawsuit {
    return Intl.message(
      'Generated Lawsuit',
      name: 'generated_lawsuit',
      desc: '',
      args: [],
    );
  }

  /// `Plaintiff Name`
  String get plaintiff_name {
    return Intl.message(
      'Plaintiff Name',
      name: 'plaintiff_name',
      desc: '',
      args: [],
    );
  }

  /// `Plaintiff ID`
  String get plaintiff_id {
    return Intl.message(
      'Plaintiff ID',
      name: 'plaintiff_id',
      desc: '',
      args: [],
    );
  }

  /// `Defendant Name`
  String get defendant_name {
    return Intl.message(
      'Defendant Name',
      name: 'defendant_name',
      desc: '',
      args: [],
    );
  }

  /// `Defendant ID`
  String get defendant_id {
    return Intl.message(
      'Defendant ID',
      name: 'defendant_id',
      desc: '',
      args: [],
    );
  }

  /// `Subject of Lawsuit`
  String get subject_of_lawsuit {
    return Intl.message(
      'Subject of Lawsuit',
      name: 'subject_of_lawsuit',
      desc: '',
      args: [],
    );
  }

  /// `Details of the Case`
  String get details_of_the_case {
    return Intl.message(
      'Details of the Case',
      name: 'details_of_the_case',
      desc: '',
      args: [],
    );
  }

  /// `Generate professional lawsuit drafts in minutes`
  String get generate_professional {
    return Intl.message(
      'Generate professional lawsuit drafts in minutes',
      name: 'generate_professional',
      desc: '',
      args: [],
    );
  }

  /// `Create Your Lawsuit`
  String get create_your_lawsuit {
    return Intl.message(
      'Create Your Lawsuit',
      name: 'create_your_lawsuit',
      desc: '',
      args: [],
    );
  }

  /// `Lawsuit Generator`
  String get lawsuit_generator {
    return Intl.message(
      'Lawsuit Generator',
      name: 'lawsuit_generator',
      desc: '',
      args: [],
    );
  }

  /// `Generate a detailed lawsuit draft based on the following details:`
  String get generate_a_detailed_lawsuit {
    return Intl.message(
      'Generate a detailed lawsuit draft based on the following details:',
      name: 'generate_a_detailed_lawsuit',
      desc: '',
      args: [],
    );
  }

  /// `Ensure the lawsuit is professional, legally valid, and formatted properly.`
  String get ensure_lawsuit {
    return Intl.message(
      'Ensure the lawsuit is professional, legally valid, and formatted properly.',
      name: 'ensure_lawsuit',
      desc: '',
      args: [],
    );
  }

  /// `Plaintiff:`
  String get plaintiff {
    return Intl.message(
      'Plaintiff:',
      name: 'plaintiff',
      desc: '',
      args: [],
    );
  }

  /// `Defendant:`
  String get defendant {
    return Intl.message(
      'Defendant:',
      name: 'defendant',
      desc: '',
      args: [],
    );
  }

  /// `Subject of Lawsuit:`
  String get subject_lawsuit {
    return Intl.message(
      'Subject of Lawsuit:',
      name: 'subject_lawsuit',
      desc: '',
      args: [],
    );
  }

  /// `Breach of Contract Lawsuit`
  String get name_example13 {
    return Intl.message(
      'Breach of Contract Lawsuit',
      name: 'name_example13',
      desc: '',
      args: [],
    );
  }

  /// `Jane Doe`
  String get plaintiffName1 {
    return Intl.message(
      'Jane Doe',
      name: 'plaintiffName1',
      desc: '',
      args: [],
    );
  }

  /// `JD-2023-001`
  String get plaintiffId1 {
    return Intl.message(
      'JD-2023-001',
      name: 'plaintiffId1',
      desc: '',
      args: [],
    );
  }

  /// `XYZ Corp.`
  String get defendantName1 {
    return Intl.message(
      'XYZ Corp.',
      name: 'defendantName1',
      desc: '',
      args: [],
    );
  }

  /// `XYZ-2023-012`
  String get defendantId1 {
    return Intl.message(
      'XYZ-2023-012',
      name: 'defendantId1',
      desc: '',
      args: [],
    );
  }

  /// `Breach of Contract`
  String get lawsuitSubject1 {
    return Intl.message(
      'Breach of Contract',
      name: 'lawsuitSubject1',
      desc: '',
      args: [],
    );
  }

  /// `Jane Doe alleges that XYZ Corp. negligently and willfully breached the terms of their contract for providing a comprehensive suite of IT services to support her small business operations. The contract explicitly outlined a wide range of services, including but not limited to managed IT support, cloud infrastructure management, cybersecurity protocols, system updates, regular maintenance, and 24/7 monitoring of business-critical systems.\n\nJane asserts that XYZ Corp. failed to meet these obligations by repeatedly experiencing system downtimes, lapses in network security, and inadequate response times to support requests. As a result, Jane's business suffered substantial financial losses due to the inability to operate efficiently. Specifically, Jane's business incurred a loss of $50,000 in missed sales opportunities, costly recovery efforts, and expenses related to securing third-party IT consulting services to rectify XYZ Corp.'s failures. Additionally, the disruption impacted her company's ability to fulfill client commitments, causing further reputational harm and decreased customer retention.\n\nFurthermore, Jane highlights that XYZ Corp. breached specific contract clauses related to data protection, breach notification, and service level agreements (SLAs). These failures compromised sensitive customer data, leading to an increased risk of data breaches and potential legal ramifications under data privacy laws such as GDPR. Jane believes that XYZ Corp.'s negligence resulted not only in immediate financial losses but also long-term consequences that could impact her business's credibility and trustworthiness in a highly competitive market.\n\nIn her lawsuit, Jane seeks a total of $50,000 in compensatory damages to cover lost revenue, legal and recovery expenses, and to address the broader operational risks caused by XYZ Corp.'s breach. Additionally, she is requesting the enforcement of specific contract clauses to ensure XYZ Corp. upholds its responsibility to restore services to their agreed-upon levels, maintain secure systems, and mitigate future risks.\n\nJane's case emphasizes the importance of meticulous contract management in the IT sector, where service providers must ensure transparency, accountability, and adherence to service agreements to avoid substantial legal and financial repercussions.`
  String get lawsuit_details1 {
    return Intl.message(
      'Jane Doe alleges that XYZ Corp. negligently and willfully breached the terms of their contract for providing a comprehensive suite of IT services to support her small business operations. The contract explicitly outlined a wide range of services, including but not limited to managed IT support, cloud infrastructure management, cybersecurity protocols, system updates, regular maintenance, and 24/7 monitoring of business-critical systems.\n\nJane asserts that XYZ Corp. failed to meet these obligations by repeatedly experiencing system downtimes, lapses in network security, and inadequate response times to support requests. As a result, Jane\'s business suffered substantial financial losses due to the inability to operate efficiently. Specifically, Jane\'s business incurred a loss of \$50,000 in missed sales opportunities, costly recovery efforts, and expenses related to securing third-party IT consulting services to rectify XYZ Corp.\'s failures. Additionally, the disruption impacted her company\'s ability to fulfill client commitments, causing further reputational harm and decreased customer retention.\n\nFurthermore, Jane highlights that XYZ Corp. breached specific contract clauses related to data protection, breach notification, and service level agreements (SLAs). These failures compromised sensitive customer data, leading to an increased risk of data breaches and potential legal ramifications under data privacy laws such as GDPR. Jane believes that XYZ Corp.\'s negligence resulted not only in immediate financial losses but also long-term consequences that could impact her business\'s credibility and trustworthiness in a highly competitive market.\n\nIn her lawsuit, Jane seeks a total of \$50,000 in compensatory damages to cover lost revenue, legal and recovery expenses, and to address the broader operational risks caused by XYZ Corp.\'s breach. Additionally, she is requesting the enforcement of specific contract clauses to ensure XYZ Corp. upholds its responsibility to restore services to their agreed-upon levels, maintain secure systems, and mitigate future risks.\n\nJane\'s case emphasizes the importance of meticulous contract management in the IT sector, where service providers must ensure transparency, accountability, and adherence to service agreements to avoid substantial legal and financial repercussions.',
      name: 'lawsuit_details1',
      desc: '',
      args: [],
    );
  }

  /// `Personal Injury Lawsuit`
  String get name_example14 {
    return Intl.message(
      'Personal Injury Lawsuit',
      name: 'name_example14',
      desc: '',
      args: [],
    );
  }

  /// `John Smith`
  String get plaintiffName2 {
    return Intl.message(
      'John Smith',
      name: 'plaintiffName2',
      desc: '',
      args: [],
    );
  }

  /// `JS-2023-002`
  String get plaintiffId2 {
    return Intl.message(
      'JS-2023-002',
      name: 'plaintiffId2',
      desc: '',
      args: [],
    );
  }

  /// `ABC Logistics`
  String get defendantName2 {
    return Intl.message(
      'ABC Logistics',
      name: 'defendantName2',
      desc: '',
      args: [],
    );
  }

  /// `ABC-2023-034`
  String get defendantId2 {
    return Intl.message(
      'ABC-2023-034',
      name: 'defendantId2',
      desc: '',
      args: [],
    );
  }

  /// `Workplace Injury`
  String get lawsuitSubject2 {
    return Intl.message(
      'Workplace Injury',
      name: 'lawsuitSubject2',
      desc: '',
      args: [],
    );
  }

  /// `John Smith claims that a workplace accident due to unsafe conditions caused a severe back injury. The plaintiff is seeking $200,000 in damages for medical expenses, lost wages, and pain and suffering.`
  String get lawsuit_details2 {
    return Intl.message(
      'John Smith claims that a workplace accident due to unsafe conditions caused a severe back injury. The plaintiff is seeking \$200,000 in damages for medical expenses, lost wages, and pain and suffering.',
      name: 'lawsuit_details2',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'he'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
