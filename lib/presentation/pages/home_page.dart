
import 'dart:async';
import 'package:flutter/foundation.dart' show kIsWeb, defaultTargetPlatform;

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../policy_pages/cookie_policy_page.dart';
import '../policy_pages/privacy_policy_page.dart';
import '../policy_pages/terms_of_service_page.dart';
import '../widgets/animated_background.dart';
import '../widgets/animated_space_nav_bar.dart';
import '../widgets/testimonials_carousel.dart';
import '../../domain/entities/project.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'enhanced_hero_section.dart';
import 'dart:io' show Platform;
import '/generated/l10n.dart'; // Import the generated localization class
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../providers/theme_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class HomePage extends StatefulWidget {
  final Function(Locale) onLocaleChange;

  const HomePage({super.key, required this.onLocaleChange});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late final ScrollController _scrollController = ScrollController();
  final List<GlobalKey> _sectionKeys = List.generate(5, (_) => GlobalKey());
  late AnimationController _animationController;
  late Animation<double> _animation;
  late Locale _locale;
late int _currentIndex;
bool _isScrolling = false;
Timer? _debounce;


@override
void initState() {
  super.initState();

   _scrollController.addListener(() {
  if (_debounce?.isActive ?? false) _debounce!.cancel();
  _debounce = Timer(const Duration(milliseconds: 200), () {
    if (!_isScrolling) {
      // Check which section is currently in view
      for (int i = 0; i < _sectionKeys.length; i++) {
        final context = _sectionKeys[i].currentContext;
        if (context != null) {
          final renderBox = context.findRenderObject() as RenderBox;
          final offset = renderBox.localToGlobal(Offset.zero);
          if (offset.dy >= 0 && offset.dy <= MediaQuery.of(context).size.height) {
            setState(() {
              _currentIndex = i;
            });
            break;
          }
        }
      }
    }
  });
});
  _animationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  );
  _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
  _animationController.forward();
  _currentIndex = 0;
  final String currentLocale = Intl.getCurrentLocale();
  _locale = currentLocale.contains('he') ? const Locale('he') : const Locale('en');
}

@override
void dispose() {
  _animationController.dispose();
  _scrollController.removeListener(() {}); // Remove listener
  _scrollController.dispose();
  super.dispose();
}


  void onLocaleChange(Locale newLocale) {
    setState(() {
      _locale = newLocale;
    });
    widget.onLocaleChange(newLocale); // Notify parent widget about locale change
  }

  

  bool isDesktop(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      return false;
    }
    if (kIsWeb) {
      return true;
    }
    return Platform.isWindows || Platform.isMacOS || Platform.isLinux;
  }

  @override
  Widget build(BuildContext context) {
    Widget content = SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          EnhancedHeroSection(
            key: _sectionKeys[0],
            sectionKeys: _sectionKeys,
            scrollToSection: _scrollToSection,
          ),
      
          _buildHowItWorksSection(context),
          _buildTestimonialsSection(context),
          _bottomFooter()
         
        ],
      ),
    );

// Wrap the content in a Scrollbar widget for desktop
if (isDesktop(context)) {

  content = Scrollbar(
    controller: _scrollController,

    thickness: 10.0,
    radius: const Radius.circular(10),
    interactive: true,
  thumbVisibility: false,  // hide when unnecessary
  trackVisibility: false,  // reduce load
    
    child: content,
  );
}


    return MaterialApp(

      locale: _locale,
      localizationsDelegates: const [
        S.delegate, // Add this delegate for the generated localization class
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      
      home: Scaffold(
        
       appBar: AppBar(
         toolbarHeight: 100, 
  flexibleSpace: const StarryBackground(),
  title: LayoutBuilder(
    builder: (context, constraints) {
      if (constraints.maxWidth < 950) {
        // Mobile layout for smaller screens
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left: SignatureBrandName
            const SignatureBrandName(),
            // Right: PopupMenuButton (language) and Mobile Menu (hamburger menu)
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PopupMenuButton<Locale>(
                    icon: const Icon(Icons.language, color: Colors.white),
                    onSelected: (Locale newLocale) {
                      onLocaleChange(newLocale); // Call to change the locale
                    },
                    itemBuilder: (BuildContext context) => <PopupMenuEntry<Locale>>[
                      const PopupMenuItem<Locale>(
                        value: Locale('en'),
                        child: Text('English'),
                      ),
                      const PopupMenuItem<Locale>(
                        value: Locale('he'),
                        child: Text('עברית'), // Hebrew
                      ),
                      
                    ],
                  ),
                  
                  ..._buildMobileMenu(), // Use mobile menu for small screens
                ],
              ),
            ),
          ],
        );
      } else {
        // Desktop layout for larger screens
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Spread across the width
          children: [
            // Left: SignatureBrandName aligned to the left
            const SignatureBrandName(),
            // Center: Navigation buttons centered
            const Spacer(),  // Push the center content
            Row(
              mainAxisSize: MainAxisSize.min,
              children: _buildDesktopNavigationButtons(),
            ),
            const Spacer(),  // Push right-end content
            // Right: PopupMenuButton aligned to the right
            PopupMenuButton<Locale>(
              icon: const Icon(Icons.language, color: Colors.white),
              onSelected: (Locale newLocale) {
                onLocaleChange(newLocale);  // Call to change the locale
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<Locale>>[
                const PopupMenuItem<Locale>(
                  value: Locale('en'),
                  child: Text('English'),
                ),
                const PopupMenuItem<Locale>(
                  value: Locale('he'),
                  child: Text('עברית'), // Hebrew
                ),
              ],
            ),
          ],
        );
      }
    },
  ),
  backgroundColor: Colors.black,
),

      
        body:Stack(
  children: [
     if (defaultTargetPlatform == TargetPlatform.iOS || 
        defaultTargetPlatform == TargetPlatform.android)
      CustomPaint(
        painter: SpaceBackgroundPainter2(), // Use the lightweight painter for mobile
        size: Size.infinite,
      )
    else
      SpaceParallaxBackground(scrollController: _scrollController),
    AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, (1 - _animation.value) * MediaQuery.of(context).size.height),
          child: child,
        );
      },
      child: content,
    ),
  ],
),
     
  ),
);

  }



  List<Widget> _buildDesktopNavigationButtons() {
    return [
      _buildNavigationButton(S.of(context).homeTitle, 0),  // Localized navigation buttons
            _buildNavigationButton( S.of(context).how_it_work, 1),
      _buildNavigationButton(S.of(context).testimonialsTitle, 2),
    ];
  }

 List<Widget> _buildMobileMenu() {
  return [
    PopupMenuButton<int>(
      icon: const Icon(Icons.menu, color: Colors.white),
      onSelected: _scrollToSection,
      color: Colors.black.withAlpha(90),
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      itemBuilder: (context) => [
        _buildMenuItem(context, 0, S.of(context).homeTitle),
             _buildMenuItem(context, 1, S.of(context).how_it_work),
        _buildMenuItem(context, 2, S.of(context).testimonialsTitle),
      ],
    ),
  ];
}

PopupMenuItem<int> _buildMenuItem(BuildContext context, int value, String title) {
  return PopupMenuItem<int>(
    value: value,
    child: Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
Widget _bottomFooter() {
  return Container(
    color: Colors.black,
    padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
    child: LayoutBuilder(
      builder: (context, constraints) {
        // Set the font size based on the screen width
        double fontSize = constraints.maxWidth < 600 ? 12 : 20; // Smaller font for mobile screens

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Logo and company name
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: Text(
                        'C',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      S.of(context).appTitle,
                      style: TextStyle(color: Colors.white, fontSize: fontSize, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                // Icons for social links
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(FontAwesomeIcons.github, color: Colors.white),
                      onPressed: () async {
                        await LaunchURLHelper.launchURL('https://github.com/OrHava');
                      },
                    ),
                    IconButton(
                      icon: const Icon(FontAwesomeIcons.linkedin, color: Colors.white),
                      onPressed: () async {
                        await LaunchURLHelper.launchURL('https://www.linkedin.com/in/or-hava');
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Footer links
            Wrap(
              spacing: 30,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: [
                FooterLink(text: S.of(context).homeTitle, onTap: () { _scrollToSection(0); }),
                     FooterLink(text:  S.of(context).how_it_work, onTap: () { _scrollToSection(1); }),
                FooterLink(text: S.of(context).testimonialsTitle, onTap: () { _scrollToSection(2); }),
              ],
            ),
            const SizedBox(height: 30),

            // Legal links
            Wrap(
              spacing: 30,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: [
                FooterLink(
                  text: S.of(context).privacy_policy,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PrivacyPolicyPage()),
                    );
                  },
                ),
                FooterLink(
                  text: S.of(context).terms_of_service,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const TermsOfServicePage()),
                    );
                  },
                ),
                FooterLink(
                  text: S.of(context).cookie_policy,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CookiePolicyPage()),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Divider and footer text
            Divider(color: Colors.grey[600]), // Adding a divider for visual separation
            const SizedBox(height: 10),
            Text(
              S.of(context).portfolio_footer_text,
              style: TextStyle(color: Colors.grey[400], fontSize: 12),
            ),
          ],
        );
      },
    ),
  );
}


void _scrollToSection(int index) {
  if (_isScrolling) return; // Prevent further scrolls while already scrolling
  _isScrolling = true; // Set scrolling state

  // Immediately update the current index
  setState(() {
    _currentIndex = index; // Update the current index
  });

  final context = _sectionKeys[index].currentContext;
  if (context != null) {
    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 500), // Adjust the duration as needed
      curve: Curves.easeInOut,
    ).then((_) {
      _isScrolling = false; // Reset scrolling state
    });
  }
}Widget _buildNavigationButton(String label, int index) {
  bool isSelected = _currentIndex == index;
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 6.0),
    child: GestureDetector(
      onTapDown: (_) {
        // Update the index immediately on press
        setState(() {
          _currentIndex = index;
        });
      },
      child: TextButton(
        onPressed: () {
          if (!_isScrolling) { // Prevent press if currently scrolling
            _scrollToSection(index);
          }
        },
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              label,
              style: GoogleFonts.playfairDisplay(
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ).animate(onPlay: (controller) => controller.repeat(reverse: true))
              .shimmer(duration: 2.seconds, color: Colors.white.withAlpha(70)),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200), // Duration for the underline animation
              margin: const EdgeInsets.only(top: 4),
              height: isSelected ? 3 : 0, // Show underline if selected
              width: 50,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.grey, Colors.white],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
Widget _buildHowItWorksSection(BuildContext context) {
  return LayoutBuilder(
    builder: (context, constraints) {
      final isDesktop = constraints.maxWidth > 600;
      return Container(
        key: _sectionKeys[1],
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(isDesktop ? 64.0 : 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildStaggeredList(isDesktop: isDesktop, context: context),
            ),
          ),
        ),
      );
    },
  );
}

List<Widget> _buildStaggeredList({required bool isDesktop, required BuildContext context}) {
  return AnimationConfiguration.toStaggeredList(
    duration: const Duration(milliseconds: 1200),
    childAnimationBuilder: (widget) => SlideAnimation(
      verticalOffset: 50.0,
      child: FadeInAnimation(child: widget),
    ),
    children: [
      _buildSectionTitle_2( S.of(context).how_it_work, isDesktop),
      const SizedBox(height: 40),
      _buildRowSection(S.of(context).understanding_our_process, _buildHowItWorksContent(), isDesktop),
      const SizedBox(height: 40),
      _buildRowSection(S.of(context).services_we_offer, _buildServicesContent(), isDesktop),
      const SizedBox(height: 40),
      _buildRowSection(S.of(context).why_choose_us, _buildWhyUsContent(), isDesktop),
    ],
  );
}

// Reusable Row Section Widget
Widget _buildRowSection(String title, Widget content, bool isDesktop) {
  return Card(
    elevation: 20,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    color: Colors.black.withAlpha(75),
    child: Padding(
      padding: const EdgeInsets.all(25),
      child: isDesktop
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 1, child: _buildSectionTitle_2(title, isDesktop)),
                const SizedBox(width: 30),
                Expanded(flex: 2, child: content),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle_2(title, isDesktop),
                const SizedBox(height: 20),
                content,
              ],
            ),
    ),
  );
}


// How It Works Content
Widget _buildHowItWorksContent() {
  return _buildTextContent(
   S.of(context).how_it_works_content
  );
}

// Services Section
Widget _buildServicesContent() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _buildServiceItem(   S.of(context).legal_document_generation_title, S.of(context).legal_document_generation, Icons.file_copy),
      _buildServiceItem(   S.of(context).data_privacy_title,  S.of(context).data_privacy, Icons.lock),
      _buildServiceItem( S.of(context).fast_processing_title, S.of(context).fast_processing, Icons.timer),
      _buildServiceItem( S.of(context).customizable_templates_title,S.of(context).customizable_templates, Icons.description),
    ],
  );
}

// Why Us Section
Widget _buildWhyUsContent() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _buildWhyUsReason( S.of(context).ai_powered_title,  S.of(context).ai_powered),
      _buildWhyUsReason( S.of(context).user_centric_title, S.of(context).user_centric),
      _buildWhyUsReason( S.of(context).secure_private_title,S.of(context).secure_and_private),
      _buildWhyUsReason( S.of(context).affordable_title,  S.of(context).affordable),
    ],
  );
}

// Reusable Service Item Widget
Widget _buildServiceItem(String title, String description, IconData icon) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: Row(
      children: [
        Icon(icon, color: Colors.white, size: 35),
        const SizedBox(width: 25),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white),
              ),
              Text(
                description,
                style: GoogleFonts.roboto(fontSize: 16, color: Colors.white70, height: 1.5),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

// Reusable Why Us Reason Widget
Widget _buildWhyUsReason(String title, String description) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(fontSize: 26, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        const SizedBox(height: 12),
        Text(
          description,
          style: GoogleFonts.roboto(fontSize: 18, color: Colors.white70, height: 1.6),
        ),
      ],
    ),
  );
}

// Generic Text Content Widget
Widget _buildTextContent(String content) {
  return Text(
    content,
    style: GoogleFonts.montserrat(fontSize: 18, color: Colors.white70, height: 1.6),
  );
}

// Section Title Widget
Widget _buildSectionTitle_2(String title, bool isDesktop) {
  return Text(
    title,
    style: GoogleFonts.montserrat(
      fontSize: isDesktop ? 38 : 30,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      letterSpacing: 1.3,
    ),
  );
}



 
Widget _buildTestimonialsSection(BuildContext context) {
  return LayoutBuilder(
    builder: (context, constraints) {
      final isDesktop = constraints.maxWidth > 600;
      return Container(
        key: _sectionKeys[2],
        constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
       
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(isDesktop ? 64.0 : 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ 
                _buildSectionTitle( S.of(context).testimonialsTitle, isDesktop),
                SizedBox(height: isDesktop ? 60 : 40),
                TestimonialsCarousel(
                  testimonials: _getFakeTestimonials(),
                  isDesktop: isDesktop,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget _buildSectionTitle(String title, bool isDesktop) {
  return Text(
    title,
    style: GoogleFonts.montserrat(
      fontSize: isDesktop ? 48 : 36,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      shadows: [
        Shadow(
          blurRadius: 10.0,
          color: Colors.black.withAlpha(30),
          offset: const Offset(2.0, 2.0),
        ),
      ],
    ),
  );
}



List<Testimonial> _getFakeTestimonials() {
  return [
    Testimonial(
      name:  S.of(context).name1,
      company:  S.of(context).company1,
      testimonial: S.of(context).testimonial1,
    ),
    Testimonial(
       name:  S.of(context).name2,
      company:  S.of(context).company2,
      testimonial: S.of(context).testimonial2,
    ),
    Testimonial(
      name:  S.of(context).name3,
      company:  S.of(context).company3,
      testimonial: S.of(context).testimonial3,
    ),
    Testimonial(
       name:  S.of(context).name4,
      company:  S.of(context).company4,
      testimonial: S.of(context).testimonial4,
    ),
  
  ];
}



}







