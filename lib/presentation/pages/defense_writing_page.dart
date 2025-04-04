import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pdf/widgets.dart' as pw;

import '../../generated/l10n.dart';
import '../../providers/realsecrets.dart';

class DefensePage extends StatefulWidget {
  const DefensePage({super.key});

  @override
  DefensePageState createState() => DefensePageState();
}

class DefensePageState extends State<DefensePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _defenderNameController = TextEditingController();
  final TextEditingController _defenderIdController = TextEditingController();
  final TextEditingController _offenseDetailsController = TextEditingController();
  final TextEditingController _defenseDetailsController = TextEditingController();
  final TextEditingController _additionalNotesController = TextEditingController();
  String _generatedDefense = "";
  bool _isLoading = false;

  String? _selectedExample;

List<Map<String, String>> getExamples(BuildContext context) {
    return [
    {
     S.of(context).name:   S.of(context).name_example11,
        S.of(context).defender_name: S.of(context).defender_name1,
      S.of(context).defender_id: S.of(context).defender_id1,
     S.of(context).offense_details: S.of(context).offense_details1,
   S.of(context).defense_details: S.of(context).defense_details1,
       S.of(context).additional_notes: S.of(context).additional_notes1
    },
    {
      S.of(context).name:  S.of(context).name_example12,
      S.of(context).defender_name: S.of(context).defender_name2,
     S.of(context).defender_id: S.of(context).defender_id2,
     S.of(context).offense_details: S.of(context).offense_details2,
     S.of(context).defense_details:  S.of(context).defense_details2,
      S.of(context).additional_notes: S.of(context).additional_notes2
    },
  ];
}

  void _fillExampleData(BuildContext context,String? selectedName) {
    final examples = getExamples(context);
  final example = examples.firstWhere((example) => example[ S.of(context).name] == selectedName, orElse: () => {});

    setState(() {
      _defenderNameController.text = example[ S.of(context).defender_name]!;
      _defenderIdController.text = example[ S.of(context).defender_id]!;
      _offenseDetailsController.text = example[S.of(context).offense_details]!;
      _defenseDetailsController.text = example[S.of(context).defense_details]!;
      _additionalNotesController.text = example[   S.of(context).additional_notes]!;
    });
  }

Future<void> _generateDefense(BuildContext context) async {
  if (!_formKey.currentState!.validate()) return;

  setState(() {
    _isLoading = true;
  });

  Locale currentLocale = Localizations.localeOf(context); // Get the current locale

  try {
    // Prepare the complete defense content in one request
    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/chat/completions'),
      headers: {
        'Authorization': 'Bearer $mySecretKey', // Ensure Bearer is included
        'Content-Type': 'application/json; charset=utf-8',
      },
      body: utf8.encode(jsonEncode({
        'model': 'gpt-3.5-turbo',
        'messages': [
          {
            'role': 'system',
            'content': 'You are an expert assistant in writing persuasive and professional defense statements in ${currentLocale.languageCode}. Focus on presenting logical arguments, mitigating accusations, and emphasizing the defendant’s strengths. Ensure it is detailed and convincing.'
          },
          {
            'role': 'user',
            'content': _buildCompleteDefense(locale: currentLocale.languageCode),
          },
        ],
        'max_tokens': 4096, // Increased max tokens for longer responses
      })),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      setState(() {
        _generatedDefense = data['choices'][0]['message']['content'];
      });
    } else {
      throw Exception('Failed to generate defense: ${response.body}');
    }
  } catch (e) {
    if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
  } finally {
    setState(() {
      _isLoading = false;
    });
  }
}

String _buildCompleteDefense({required String locale}) {
  return '''
This defense statement is presented in the language of $locale.

**Defender Details:**
- **Name:** ${_defenderNameController.text}
- **ID:** ${_defenderIdController.text}

**Offense Details:**
${_offenseDetailsController.text}

**Defense Details:**
${_defenseDetailsController.text}

**Additional Notes:**
${_additionalNotesController.text}

Ensure that the defense is persuasive, focuses on logical arguments, and mitigates the impact of the accusations. Highlight the defender's positive traits, achievements, and actions to strengthen their position.
''';
}

void _downloadDefenseAsPDF() async {
  if (_generatedDefense.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('No contract to download'),
        backgroundColor: Colors.orange,
      ),
    );
    return;
  }

  bool isHebrew(String text) {
    return RegExp(r'[\u0590-\u05FF]').hasMatch(text);
  }

  final pdf = pw.Document();
  pw.Font? regularFont;
  pw.Font? boldFont;
  pw.TextDirection textDirection = pw.TextDirection.ltr;

  if (isHebrew(_generatedDefense)) {
    regularFont = pw.Font.ttf(await rootBundle.load('assets/NotoSansHebrew-Regular.ttf'));
    boldFont = pw.Font.ttf(await rootBundle.load('assets/NotoSansHebrew-Bold.ttf'));
    textDirection = pw.TextDirection.rtl;
  } else {
    regularFont = pw.Font.helvetica();
    boldFont = pw.Font.helveticaBold();
  }

  final List<String> paragraphs = _generatedDefense.split('\n\n');
  final List<pw.Widget> content = [];

  for (String paragraph in paragraphs) {
    if (paragraph.startsWith('## ')) {
      content.add(pw.Header(
        level: 1,
        child: pw.Text(paragraph.substring(3),
            style: pw.TextStyle(font: boldFont, fontSize: 18)),
      ));
    } else if (paragraph.startsWith('### ')) {
      content.add(pw.Header(
        level: 2,
        child: pw.Text(paragraph.substring(4),
            style: pw.TextStyle(font: boldFont, fontSize: 16)),
      ));
    } else if (paragraph.startsWith('#### ')) {
      content.add(pw.Header(
        level: 3,
        child: pw.Text(paragraph.substring(5),
            style: pw.TextStyle(font: boldFont, fontSize: 14)),
      ));
    } else {
     content.add(pw.RichText(
  text: pw.TextSpan(
    children: _parseTextWithBoldSectionsForPDF(paragraph, regularFont, boldFont),
    style: pw.TextStyle(font: regularFont, fontSize: 12),
  ),
));

    }
  }

  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) => [
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: content,
        ),
      ],
      textDirection: textDirection,
    ),
  );

  await Printing.sharePdf(
    bytes: await pdf.save(),
    filename: 'defense.pdf',
  );
}
  
List<pw.TextSpan> _parseTextWithBoldSectionsForPDF(String text, pw.Font regularFont, pw.Font boldFont) {
  final RegExp boldPattern = RegExp(r'\*\*(.*?)\*\*');
  List<pw.TextSpan> spans = [];
  int lastIndex = 0;

  for (Match match in boldPattern.allMatches(text)) {
    if (match.start > lastIndex) {
      spans.add(pw.TextSpan(text: text.substring(lastIndex, match.start), style: pw.TextStyle(font: regularFont)));
    }
    spans.add(pw.TextSpan(
      text: match.group(1),
      style: pw.TextStyle(font: boldFont),
    ));
    lastIndex = match.end;
  }

  if (lastIndex < text.length) {
    spans.add(pw.TextSpan(text: text.substring(lastIndex), style: pw.TextStyle(font: regularFont)));
  }

  return spans;
}

  String? _requiredValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required.";
    }
    return null;
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    int maxLines = 1,
    String? Function(String?)? validator,
    String? hintText,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        validator: validator,
        style: GoogleFonts.poppins(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          prefixIcon: Icon(icon, color: Colors.white70),
          labelStyle: GoogleFonts.poppins(color: Colors.white70, fontSize: 16),
          filled: true,
          fillColor: Colors.white.withAlpha(10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
            S.of(context).defender_writer,
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 24, color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: _buildDefensePage(context),
    );
  }

  Widget _buildDefensePage(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF2C3E50), Color(0xFF3498DB)],
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                     S.of(context).write_your_defense,
                    style: GoogleFonts.poppins(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 40),
                    Text(
            S.of(context).quick_start,
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
              const SizedBox(height: 20),
    // const AdWidget(
               
    //             ),
                    //  const SizedBox(height: 40),
                  _buildExampleDropdown(),
                  const SizedBox(height: 20),
                        _buildExampleButton(),
                  const SizedBox(height: 40),
                  ..._buildTextFields(),
       
                  const SizedBox(height: 40),
                            Center(child: _buildGenerateButton(context)),
                _buildGeneratedDefensePreview(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  
  
Widget _buildGenerateButton(BuildContext context) {
  return AnimatedSwitcher(
    duration: const Duration(milliseconds: 300),
    child: _isLoading
        ? const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white))
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 0,
            ),
            onPressed: () => _generateDefense(context),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.description, size: 20, color: Color(0xFF2C3E50)),
                const SizedBox(width: 8),
                Text(
                S.of(context).generate_defense,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF2C3E50),
                  ),
                ),
              ],
            ),
          ),
  );
}



Widget _buildExampleDropdown() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Colors.white.withAlpha(10),
    ),
    child: DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: S.of(context).select_example,
        labelStyle: GoogleFonts.poppins(color: Colors.white70, fontSize: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      ),
      dropdownColor: const Color(0xFF2C3E50),
      value: _selectedExample,
       items: getExamples(context).map((example) {
  return DropdownMenuItem<String>(
    value: example[ S.of(context).name],
    child: Text(example[ S.of(context).name]!, style: GoogleFonts.poppins(color: Colors.white)),
  );
}).toList(),
      onChanged: (value) {
        setState(() {
          _selectedExample = value;
        });
      },
    ),
  );
}
Widget _buildExampleButton() {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 0,
    ),
    onPressed: () {
      if (_selectedExample != null) {
        _fillExampleData(context,_selectedExample);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(  S.of(context).please_select_example, style: GoogleFonts.poppins()),
            backgroundColor: Colors.red.shade400,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        );
      }
    },
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.copy, size: 22, color: Color(0xFF2C3E50)),
        const SizedBox(width: 8),
        Text(
         S.of(context).fill_example_data,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: const Color(0xFF2C3E50),
          ),
        ),
      ],
    ),
  );
}

  List<Widget> _buildTextFields() {
    return [
      _buildTextField(
        controller: _defenderNameController,
        label:  S.of(context).defender_name,
        icon: Icons.person,
        validator: _requiredValidator,
        hintText: S.of(context).defender_hint,
      ),
      _buildTextField(
        controller: _defenderIdController,
        label:S.of(context).defender_id,
        icon: Icons.perm_identity,
        validator: _requiredValidator,
        hintText: S.of(context).defender_id_hint,
      ),
      _buildTextField(
        controller: _offenseDetailsController,
        label: S.of(context).offense_details,
        icon: Icons.report_problem,
        maxLines: 3,
        validator: _requiredValidator,
        hintText: S.of(context).offense_details_hint,
      ),
      _buildTextField(
        controller: _defenseDetailsController,
        label:  S.of(context).defense_details,
        icon: Icons.shield,
        maxLines: 3,
        validator: _requiredValidator,
        hintText: S.of(context).defense_details_hint,
      ),
      _buildTextField(
        controller: _additionalNotesController,
        label:  S.of(context).additional_notes,
        icon: Icons.notes,
        maxLines: 2,
        hintText:S.of(context).additional_notes_hint,
      ),
    ];
  }


  Widget _buildGeneratedDefensePreview() {
  if (_generatedDefense.isEmpty) return const SizedBox.shrink();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
         S.of(context).generate_defense,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      const SizedBox(height: 20),
      Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.white.withAlpha(10),
        ),
        child: TextFormField(
          initialValue: _generatedDefense,
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.white,
            height: 1.5,
          ),
          maxLines: null,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText:    S.of(context).edit_contract_hint,
            hintStyle: GoogleFonts.poppins(
              color: Colors.white.withAlpha(50),
            ),
          ),
          onChanged: (value) {
            setState(() {
              _generatedDefense = value;
            });
          },
        ),
      ),
      const SizedBox(height: 30),
      Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 0,
              ),
              onPressed: _downloadDefenseAsPDF,
              icon: const Icon(Icons.download_rounded, size: 22, color: Color(0xFF2C3E50)),
              label: Text(
                 S.of(context).download_pdf,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: const Color(0xFF2C3E50),
                ),
              ),
            ),
            const SizedBox(width: 16),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(color: Colors.white, width: 2),
                ),
                elevation: 0,
              ),
              onPressed: () {
                // Implement save functionality here
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(  S.of(context).changes_saved, style: GoogleFonts.poppins()),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              icon: const Icon(Icons.save, size: 22, color: Colors.white),
              label: Text(
                S.of(context).save_changes,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

}
