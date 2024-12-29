import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:legal_quest/presentation/pages/defense_writing_page.dart';
import '../../generated/l10n.dart';
import '../widgets/animated_title_widget.dart';
import 'contract_page.dart';
import 'lawsuit_page.dart';


class EnhancedHeroSection extends StatefulWidget {
  final List<GlobalKey> sectionKeys;
  final Function(int) scrollToSection;

  const EnhancedHeroSection({
    super.key,
    required this.sectionKeys,
    required this.scrollToSection,
  });

  @override
  EnhancedHeroSectionState createState() => EnhancedHeroSectionState();
}

class EnhancedHeroSectionState extends State<EnhancedHeroSection> with SingleTickerProviderStateMixin {
  late AnimationController _mainController;

  @override
  void initState() {
    super.initState();
    _mainController = AnimationController(vsync: this, duration: const Duration(seconds: 10));
    _mainController.forward();
  }

  @override
  void dispose() {
    _mainController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 800;
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(isDesktop ? 50 : 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildAnimatedTitle(isDesktop),
                        SizedBox(height: isDesktop ? 30 : 20),
                        _buildAnimatedSubtitle(isDesktop),
                        SizedBox(height: isDesktop ? 40 : 20),
                        _buildActionButtons(),
                      ],
                    ),
                  ).animate(controller: _mainController)
                    .fadeIn(duration: 1.seconds, curve: Curves.easeInOut)
                    .scale(
                      begin: const Offset(0.8, 0.8),
                      end: const Offset(1, 1),
                      duration: 1.seconds,
                      curve: Curves.easeOutBack,
                    ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _onActionButtonPressed(String action) {
    switch (action) {
      case 'contract':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ContractPage()),
        );
        break;
      case 'lawsuit':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LawsuitPage()),
        );
        break;
      case 'defense':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DefensePage()),
        );
        break;
      default:
        if (kDebugMode) {
          print('Unknown action');
        }
    }
  }

  Widget _buildActionButtons() {
    return Container(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildLawButton(
            onPressed: () => _onActionButtonPressed('contract'),
            text: S.of(context).create_contract,
            icon: Icons.file_copy_outlined,
            colors: [Colors.white, Colors.blue.shade900],
          ),
          Container(height: 40,),
          _buildLawButton(
            onPressed: () => _onActionButtonPressed('lawsuit'),
            text:  S.of(context).create_lawsuit,
            icon: Icons.gavel,
            colors: [Colors.white, Colors.deepOrange.shade900],
          ),
                 Container(height: 40,),
          _buildLawButton(
            onPressed: () => _onActionButtonPressed('defense'),
            text:  S.of(context).create_defense,
            icon: Icons.shield_outlined,
            colors: [Colors.grey.shade800, Colors.black],
          ),
        ],
      ),
    );
  }

  Widget _buildLawButton({
    required VoidCallback onPressed,
    required String text,
    required IconData icon,
    required List<Color> colors,
  }) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(50),
      splashColor: Colors.white..withAlpha(20),
      highlightColor: Colors.white.withAlpha(10),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(20),
              blurRadius: 15,
              spreadRadius: 2,
            ),
            BoxShadow(
              color: Colors.white.withAlpha(30),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
          border: Border.all(
            color: Colors.white.withAlpha(30),
            width: 1.5,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 36),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white, size: 28),
            const SizedBox(width: 12),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedTitle(bool isDesktop) {
    return AnimatedTitleWidget(isDesktop: isDesktop);
  }

  Widget _buildAnimatedSubtitle(bool isDesktop) {
    final languageKey = ValueKey(Localizations.localeOf(context).languageCode);

    return DefaultTextStyle(
      style: TextStyle(fontSize: isDesktop ? 28 : 22, color: Colors.white70),
      textAlign: TextAlign.center,
      child: AnimatedTextKit(
        key: languageKey,
        animatedTexts: [
          TyperAnimatedText(
           S.of(context).animated_text_1,
            textAlign: TextAlign.center,
          ),
          TyperAnimatedText(
             S.of(context).animated_text_2,
            textAlign: TextAlign.center,
          ),
          TyperAnimatedText(
           S.of(context).animated_text_3,
            textAlign: TextAlign.center,
          ),
        ],
        isRepeatingAnimation: false,
      ),
    ).animate(controller: _mainController)
      .fadeIn(duration: 1.seconds, delay: 1.5.seconds)
      .slideY(begin: 0.2, end: 0, duration: 1.seconds, curve: Curves.easeOutQuad);
  }
}
