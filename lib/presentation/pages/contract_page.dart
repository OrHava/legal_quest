import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../../generated/l10n.dart';
import '../../providers/realsecrets.dart';
import 'package:google_fonts/google_fonts.dart';




class ContractPage extends StatefulWidget {
  const ContractPage({super.key});

  @override
  ContractPageState createState() => ContractPageState();
}

class ContractPageState extends State<ContractPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _partyANameController = TextEditingController();
  final TextEditingController _partyAIdController = TextEditingController();
  final TextEditingController _partyBNameController = TextEditingController();
  final TextEditingController _partyBIdController = TextEditingController();
  final TextEditingController _contractSubjectController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();
  String _generatedContract = "";
  bool _isLoading = false;

String? _selectedExample;

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


  Future<void> _generateContract(BuildContext context) async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
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
      'content': 'You are a helpful assistant that generates contracts.'
    },
    {
      'role': 'user',
      'content': _buildPrompt()
    },
  ],
  'max_tokens': 1000,
})),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        setState(() {
          _generatedContract = data['choices'][0]['message']['content'];
        });
      } else {
        throw Exception('Failed to generate contract: ${response.body}');
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
  ${S.of(context).generate_contract_prompt}

${S.of(context).party_a}
- ${S.of(context).name} ${_partyANameController.text}
- ${S.of(context).id} ${_partyAIdController.text}

${S.of(context).party_b}
- ${S.of(context).name} ${_partyBNameController.text}
- ${S.of(context).id} ${_partyBIdController.text}

${S.of(context).subject_of_contract}
${_contractSubjectController.text}

${S.of(context).details}
${_detailsController.text}

${S.of(context).ensure_contract}
''';
  }
void _downloadContractAsPDF() async {
  if (_generatedContract.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('No contract to download'), // Replace with localization if needed
        backgroundColor: Colors.orange,
      ),
    );
    return;
  }

  // Function to check if the text contains Hebrew characters
  bool isHebrew(String text) {
    return RegExp(r'[\u0590-\u05FF]').hasMatch(text);
  }

  // Load Hebrew font only if necessary
  final pdf = pw.Document();
  pw.Font? font;
  pw.TextDirection textDirection = pw.TextDirection.ltr;

  if (isHebrew(_generatedContract)) {
      font = pw.Font.ttf(await rootBundle.load('assets/NotoSansHebrew-Regular.ttf'));
    textDirection = pw.TextDirection.rtl; // Set text direction to RTL for Hebrew
  }

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) => pw.Padding(
        padding: const pw.EdgeInsets.all(16.0),
        child: pw.Text(
          _generatedContract,
          textDirection: textDirection,
          style: font != null ? pw.TextStyle(font: font) : const pw.TextStyle(),
        ),
      ),
    ),
  );

  await Printing.sharePdf(
    bytes: await pdf.save(),
    filename: 'contract.pdf',
  );
}


List<Map<String, String>> getExamples(BuildContext context) {
    return [
  {
    S.of(context).name:  S.of(context).name_example1,
   S.of(context).party_a_name: S.of(context).party_a_name1,
   S.of(context).party_a_id: S.of(context).party_a_id1,
     S.of(context).party_b_name: S.of(context).party_b_name1,
     S.of(context).party_b_id:  S.of(context).party_b_id1,
     S.of(context).contract_subject: S.of(context).contract_subject1,
     S.of(context).details: S.of(context).details1
  },
  {
    S.of(context).name: S.of(context).name_example2,
   S.of(context).party_a_name: S.of(context).party_a_name2,
   S.of(context).party_a_id: S.of(context).party_a_id2,
    S.of(context).party_b_name: S.of(context).party_b_name2,
  S.of(context).party_b_id:  S.of(context).party_b_id2,
     S.of(context).contract_subject: S.of(context).contract_subject2,
      S.of(context).details: S.of(context).details2
  },
  {
    S.of(context).name: S.of(context).name_example3,
   S.of(context).party_a_name: S.of(context).party_a_name3,
   S.of(context).party_a_id: S.of(context).party_a_id3,
    S.of(context).party_b_name:S.of(context).party_b_name3,
   S.of(context).party_b_id:  S.of(context).party_b_id3,
    S.of(context).contract_subject: S.of(context).contract_subject3,
      S.of(context).details: S.of(context).details3
  },
  {
     S.of(context).name: S.of(context).name_example4,
   S.of(context).party_a_name: S.of(context).party_a_name4,
   S.of(context).party_a_id: S.of(context).party_a_id4,
     S.of(context).party_b_name: S.of(context).party_b_name4,
  S.of(context).party_b_id: S.of(context).party_b_id4,
     S.of(context).contract_subject: S.of(context).contract_subject4,
     S.of(context).details: S.of(context).details4
  },
  {
     S.of(context).name: S.of(context).name_example5,
   S.of(context).party_a_name: S.of(context).party_a_name5,
 S.of(context).party_a_id: S.of(context).party_a_id5,
   S.of(context).party_b_name: S.of(context).party_b_name5,
    S.of(context).party_b_id: S.of(context).party_b_id5,
    S.of(context).contract_subject: S.of(context).contract_subject5,
     S.of(context).details: S.of(context).details5
  },
  {
     S.of(context).name: S.of(context).name_example6,
   S.of(context).party_a_name: S.of(context).party_a_name6,
    S.of(context).party_a_id: S.of(context).party_a_id6,
    S.of(context).party_b_name: S.of(context).party_b_name6,
   S.of(context).party_b_id: S.of(context).party_b_id6,
     S.of(context).contract_subject: S.of(context).contract_subject6,
    S.of(context).details: S.of(context).details6
  },
  {
     S.of(context).name: S.of(context).name_example7,
    S.of(context).party_a_name: S.of(context).party_a_name7,
 S.of(context).party_a_id: S.of(context).party_a_id7,
    S.of(context).party_b_name:S.of(context).party_b_name7,
    S.of(context).party_b_id: S.of(context).party_b_id7,
    S.of(context).contract_subject: S.of(context).contract_subject7,
     S.of(context).details: S.of(context).details7
  },
  {
     S.of(context).name: S.of(context).name_example8,
    S.of(context).party_a_name: S.of(context).party_a_name8,
    S.of(context).party_a_id: S.of(context).party_a_id8,
    S.of(context).party_b_name: S.of(context).party_b_name8,
    S.of(context).party_b_id: S.of(context).party_b_id8,
     S.of(context).contract_subject: S.of(context).contract_subject8,
     S.of(context).details: S.of(context).details8
  },
  {
     S.of(context).name: S.of(context).name_example9,
   S.of(context).party_a_name: S.of(context).party_a_name9,
  S.of(context).party_a_id: S.of(context).party_a_id9,
   S.of(context).party_b_name: S.of(context).party_b_name9,
    S.of(context).party_b_id: S.of(context).party_b_id9,
    S.of(context).contract_subject: S.of(context).contract_subject9,
      S.of(context).details: S.of(context).details9
  },
  {
    S.of(context).name: S.of(context).name_example10,
    S.of(context).party_a_name: S.of(context).party_a_name10,
    S.of(context).party_a_id: S.of(context).party_a_id10,
   S.of(context).party_b_name:S.of(context).party_b_name10,
    S.of(context).party_b_id: S.of(context).party_b_id10,
    S.of(context).contract_subject: S.of(context).contract_subject10,
      S.of(context).details: S.of(context).details10
  }
];

}
void _fillExampleData(BuildContext context, String? selectedName) {
  final examples = getExamples(context);
  final example = examples.firstWhere((example) => example[ S.of(context).name] == selectedName, orElse: () => {});

  if (example.isNotEmpty) {
    setState(() {
      _partyANameController.text = example[S.of(context).party_a_name] ?? '';
      _partyAIdController.text = example[S.of(context).party_a_id] ?? '';
      _partyBNameController.text = example[S.of(context).party_b_name] ?? '';
      _partyBIdController.text = example[S.of(context).party_b_id] ?? '';
      _contractSubjectController.text = example[  S.of(context).contract_subject] ?? '';
      _detailsController.text = example[  S.of(context).details] ?? '';
    });
  }
}



@override
Widget build(BuildContext context) {
  return Scaffold(
    extendBodyBehindAppBar: true,
    appBar: _buildAppBar(),
    body: _buildContractPage(context),
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
        labelText:   S.of(context).select_example,
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
            content: Text(S.of(context).please_select_example, style: GoogleFonts.poppins()),
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
      Text(
       S.of(context).contract_details,
        style: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      const SizedBox(height: 20),
      ..._buildTextFields(),
    ],
  );
}


AppBar _buildAppBar() {
  return AppBar(
    title: Text(
     S.of(context).contract_generator,
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


Widget _buildContractPage(BuildContext context) {
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
    // const AdWidget(
         
    //             ),
                    //  const SizedBox(height: 40),
                _buildExampleSection(),
                const SizedBox(height: 40),
                _buildInputFields(),
                const SizedBox(height: 40),
                Center(child: _buildGenerateButton(context)),
                const SizedBox(height: 40),
                _buildGeneratedContractPreview(),
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
        S.of(context).create_your_contract,
        style: GoogleFonts.poppins(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      const SizedBox(height: 10),
      Text(
        S.of(context).generate_professional_contracts,
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

  List<Widget> _buildTextFields() {
    return [
      _buildTextField(
        controller: _partyANameController,
        label:   S.of(context).party_a_name,
        icon: Icons.person,
        validator: _requiredValidator,
      ),
      _buildTextField(
        controller: _partyAIdController,
        label: S.of(context).party_a_id,
        icon: Icons.badge,
        validator: _requiredValidator,
      ),
      _buildTextField(
        controller: _partyBNameController,
        label: S.of(context).party_b_name,
        icon: Icons.person_outline,
        validator: _requiredValidator,
      ),
      _buildTextField(
        controller: _partyBIdController,
        label:S.of(context).party_b_id,
        icon: Icons.badge_outlined,
        validator: _requiredValidator,
      ),
      _buildTextField(
        controller: _contractSubjectController,
        label: S.of(context).subject_of_contract_field,
        icon: Icons.subject,
        validator: _requiredValidator,
      ),
   _buildTextField(
  controller: _detailsController,
  label: S.of(context).contract_details,
  icon: Icons.description,
  maxLines: 5,
  validator: _requiredValidator,
  hintText: S.of(context).contract_details_hint, // Hint text
),

    ];
  }



Widget _buildTextField({
  required TextEditingController controller,
  required String label,
  required IconData icon,
  int maxLines = 1,
  required String? Function(String?) validator,
  String? hintText,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20.0),
    child: TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(color: Colors.white54, fontSize: 14),
        labelStyle: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white70),
        prefixIcon: Icon(icon, color: Colors.white70),
        filled: true,
        fillColor: Colors.white.withAlpha(10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.white.withAlpha(30), width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      ),
      style: GoogleFonts.poppins(color: Colors.white),
      validator: validator,
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
            onPressed: () => _generateContract(context),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.description, size: 20, color: Color(0xFF2C3E50)),
                const SizedBox(width: 8),
                Text(
                  S.of(context).generate_contract_button,
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

  Widget _buildGeneratedContractPreview() {
    if (_generatedContract.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            S.of(context).generated_contract,
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
            initialValue: _generatedContract,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.white,
              height: 1.5,
            ),
            maxLines: null,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText:  S.of(context).edit_contract_hint,
              hintStyle: GoogleFonts.poppins(
                color: Colors.white..withAlpha(50),
              ),
            ),
            onChanged: (value) {
              setState(() {
                _generatedContract = value;
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
                onPressed: _downloadContractAsPDF,
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




