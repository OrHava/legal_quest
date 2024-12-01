import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:printing/printing.dart';import 'package:pdf/widgets.dart' as pw;

import '../../generated/l10n.dart';
import '../../providers/realsecrets.dart';
import '../widgets/ad_widget.dart';

class LawsuitPage extends StatefulWidget {
  const LawsuitPage({super.key});

  @override
  LawsuitPageState createState() => LawsuitPageState();
}

class LawsuitPageState extends State<LawsuitPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _plaintiffNameController = TextEditingController();
  final TextEditingController _plaintiffIdController = TextEditingController();
  final TextEditingController _defendantNameController = TextEditingController();
  final TextEditingController _defendantIdController = TextEditingController();
  final TextEditingController _lawsuitSubjectController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();
  String _generatedLawsuit = "";
  bool _isLoading = false;

  String? _selectedExample;

List<Map<String, String>> getExamples(BuildContext context) {
    return [
  
    {
      S.of(context).name: S.of(context).name_example13,
    S.of(context).plaintiff_name: S.of(context).plaintiffName1,
     S.of(context).plaintiff_id:  S.of(context).plaintiffId1,
     S.of(context).defendant_name:  S.of(context).defendantName1,
       S.of(context).defendant_id:  S.of(context).defendantId1,
      S.of(context).subject_lawsuit: S.of(context).lawsuitSubject1,
       S.of(context).details: S.of(context).lawsuit_details1
    },
    {
      S.of(context).name: S.of(context).name_example14,
     S.of(context).plaintiff_name:  S.of(context).plaintiffName2,
      S.of(context).plaintiff_id:  S.of(context).plaintiffId2,
    S.of(context).defendant_name:  S.of(context).defendantName2,
     S.of(context).defendant_id: S.of(context).defendantId2,
       S.of(context).subject_lawsuit: S.of(context).lawsuitSubject2,
       S.of(context).details:  S.of(context).lawsuit_details2
    },
  ];
}

  void _showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  String? _requiredValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required.";
    }
    return null;
  }

  Future<void> _generateLawsuit(BuildContext context) async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Authorization': 'Bearer $mySecretKey', // Replace with your API key
              'Content-Type': 'application/json; charset=utf-8',
        },
 body: utf8.encode(jsonEncode({
          'model': 'gpt-3.5-turbo',
          'messages': [
            {
              'role': 'system',
              'content': 'You are a helpful assistant that generates lawsuit drafts.'
            },
            {
              'role': 'user',
              'content': _buildPrompt()
            },
          ],
          'max_tokens': 1000,
        }),
 )
      );

      if (response.statusCode == 200) {
            final data = jsonDecode(utf8.decode(response.bodyBytes));
        setState(() {
          _generatedLawsuit = data['choices'][0]['message']['content'];
        });
      } else {
        throw Exception('Failed to generate lawsuit: ${response.body}');
      }
    } catch (e) {
      if (context.mounted) {
        _showErrorSnackBar(context, 'Error: $e');
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  String _buildPrompt() {
    return '''
  ${S.of(context).generate_a_detailed_lawsuit}

  ${S.of(context).plaintiff}
-${S.of(context).name}: ${_plaintiffNameController.text}
- ${S.of(context).id} ${_plaintiffIdController.text}

${S.of(context).defendant}
- ${S.of(context).name}: ${_defendantNameController.text}
- ${S.of(context).name} ${_defendantIdController.text}

${S.of(context).subject_lawsuit}
${_lawsuitSubjectController.text}

${S.of(context).details}
${_detailsController.text}

${S.of(context).ensure_lawsuit}
''';
  }

  void _downloadLawsuitAsPDF() async {
    if (_generatedLawsuit.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('No lawsuit to download. Generate it first!'),
        backgroundColor: Colors.orange,
      ));
      return;
    }

    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Padding(
          padding: const pw.EdgeInsets.all(16.0),
          child: pw.Text(_generatedLawsuit),
        ),
      ),
    );

    await Printing.sharePdf(
      bytes: await pdf.save(),
      filename: 'lawsuit.pdf',
    );
  }



  void _fillExampleData(BuildContext context,String? selectedName) {
  final examples = getExamples(context);
  final example = examples.firstWhere((example) => example[ S.of(context).name] == selectedName, orElse: () => {});

    setState(() {
      _plaintiffNameController.text = example[S.of(context).plaintiff_name]!;
      _plaintiffIdController.text = example[ S.of(context).plaintiff_id]!;
      _defendantNameController.text = example[S.of(context).defendant_name]!;
      _defendantIdController.text = example[S.of(context).defendant_id]!;
      _lawsuitSubjectController.text = example[S.of(context).subject_lawsuit]!;
      _detailsController.text = example[ S.of(context).details]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(),
      body: _buildLawsuitPage(context),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
       S.of(context).lawsuit_generator,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          fontSize: 24,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.close, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  Widget _buildLawsuitPage(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF2C3E50),
            Color(0xFF3498DB),
          ],
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
                  _buildHeader(),
                       const SizedBox(height: 20),
                //       const AdWidget(
             
                // ),
                
                //   const SizedBox(height: 40),
                  _buildExampleSection(),
                  const SizedBox(height: 40),
                  _buildInputFields(),
                  const SizedBox(height: 40),
                  Center(child: _buildGenerateButton(context)),
                  const SizedBox(height: 40),
                  _buildGeneratedLawsuitPreview(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            S.of(context).create_lawsuit,
          style: GoogleFonts.poppins(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        Text(
           S.of(context).generate_a_detailed_lawsuit,
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }

  Widget _buildExampleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).quick_start,
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20),
        _buildExampleDropdown(),
        const SizedBox(height: 20),
        _buildExampleButton(),
      ],
    );
  }

Widget _buildExampleDropdown() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Colors.white.withOpacity(0.1),
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
            content: Text( S.of(context).please_select_example, style: GoogleFonts.poppins()),
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
Widget _buildInputFields() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _buildTextField(_plaintiffNameController, S.of(context).plaintiff_name, icon: Icons.person),
      const SizedBox(height: 20),
      _buildTextField(_plaintiffIdController, S.of(context).plaintiff_id, icon: Icons.card_membership),
      const SizedBox(height: 20),
      _buildTextField(_defendantNameController, S.of(context).defendant_name, icon: Icons.person),
      const SizedBox(height: 20),
      _buildTextField(_defendantIdController, S.of(context).defendant_id, icon: Icons.card_membership),
      const SizedBox(height: 20),
      _buildTextField(_lawsuitSubjectController, S.of(context).subject_of_lawsuit, icon: Icons.subject),
      const SizedBox(height: 20),
      _buildTextField(
        _detailsController,
        S.of(context).details_of_the_case,
        maxLines: 5,
        icon: Icons.description,
      ),
    ],
  );
}

Widget _buildTextField(TextEditingController controller, String label,
    {int maxLines = 1, IconData? icon}) {
  return TextFormField(
    controller: controller,
    maxLines: maxLines,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: GoogleFonts.poppins(color: Colors.white70),
      filled: true,
      fillColor: Colors.white.withOpacity(0.1),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      prefixIcon: icon != null ? Icon(icon, color: Colors.white70) : null,  // Add icon if provided
    ),
    style: GoogleFonts.poppins(color: Colors.white),
    validator: _requiredValidator,
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
            onPressed: () => _generateLawsuit(context),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.description, size: 20, color: Color(0xFF2C3E50)),
                const SizedBox(width: 8),
                Text(
                S.of(context).generated_lawsuit,
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

Widget _buildGeneratedLawsuitPreview() {
  if (_generatedLawsuit.isEmpty) return const SizedBox.shrink();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
         S.of(context).generated_lawsuit,
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
          color: Colors.white.withOpacity(0.1),
        ),
        child: TextFormField(
          initialValue: _generatedLawsuit,
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
              color: Colors.white.withOpacity(0.5),
            ),
          ),
          onChanged: (value) {
            setState(() {
              _generatedLawsuit = value;
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
              onPressed: _downloadLawsuitAsPDF,
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
                    content: Text(   S.of(context).changes_saved, style: GoogleFonts.poppins()),
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
