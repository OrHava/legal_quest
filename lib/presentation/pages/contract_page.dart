import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:pdf/pdf.dart';
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

  Locale currentLocale = Localizations.localeOf(context); // Get the current locale

  try {
    // Prepare the complete contract content in one request
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
            'content': 'You are a detailed and precise assistant that generates comprehensive contracts with legal and operational clarity in ${currentLocale.languageCode}. Generate a complete contract that includes all essential elements for enforceability, such as offer, acceptance, consideration, capacity, legality, and additional clauses. Ensure it is at least 5 pages long and elaborate on each topic thoroughly with examples and detailed explanations.'
          },
          {
            'role': 'user',
            'content': _buildCompleteContract(locale: currentLocale.languageCode)
          },
        ],
        'max_tokens': 4096, // Increased max tokens for longer responses
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
String _buildCompleteContract({required String locale}) {


  return '''  Make sure this contract will be in the language of $locale
This contract serves as a comprehensive agreement between the parties involved. It outlines all essential elements for enforceability such as offer, acceptance, consideration, capacity, legality, and additional clauses. The document is structured to cover each topic in detail.

**Contract Details:**

1. **Parties Involved:**
   - **Party A**:
     - Name: ${_partyANameController.text}
     - ID: ${_partyAIdController.text}
   - **Party B**:
     - Name: ${_partyBNameController.text}
     - ID: ${_partyBIdController.text}

2. **Subject of Contract**:
   This section explains the purpose of the contract in detail.
   - Subject: ${_contractSubjectController.text}
   - Please elaborate on the significance of this subject matter and how it relates to both parties.

3. **Details**:
   A comprehensive explanation of the specifics of the agreement.
   - Details: ${_detailsController.text}
   - Provide an in-depth description of the agreement's specifics, including any relevant background information.

4. **Terms and Conditions**:
   Elaborate on the rights and obligations of each party.
   - Payment Terms: Describe how payments will be made, including amounts, due dates, and methods of payment.
     - Please provide detailed examples and scenarios regarding payment processes.
   - Delivery Details: Specify how goods or services will be delivered, including timelines and responsibilities.
     - Elaborate on delivery expectations and responsibilities for both parties.
   - Additional Conditions: Include any other relevant conditions that govern the agreement.
     - Discuss any contingencies or special circumstances that may apply.

5. **Definitions**:
   Provide clear definitions for key terms used throughout the contract to ensure clarity.
   - Example Definitions: Include specific examples of terms that might be ambiguous or require clarification.
     - Please elaborate on each term's importance and its implications in this contract context.

6. **Confidentiality Clause**:
   Outline how confidential information will be handled by both parties.
   - Define what constitutes confidential information and the obligations of both parties regarding its protection.
     - Elaborate on potential risks associated with confidentiality breaches.

7. **Dispute Resolution**:
   Specify how disputes will be resolved (e.g., mediation, arbitration), including examples of scenarios where this may apply.
   - Describe the process for initiating a dispute resolution procedure and any timelines involved.
     - Provide examples of common disputes that may arise and how they should be handled.

8. **Governing Law**:
   State which jurisdiction's laws will govern this contract.
   - Explain why this jurisdiction is chosen and its relevance to both parties.
     - Discuss potential legal implications based on this jurisdiction.

9. **Amendments**:
   Describe how amendments to the contract can be made.
   - Include procedures for proposing changes and obtaining consent from both parties.
     - Elaborate on the importance of formalizing amendments and potential consequences of informal changes.

10. **Termination Clause**:
    Detail the conditions under which either party can terminate the contract.
    - Specify notice periods and any obligations upon termination.
      - Discuss scenarios that may lead to termination and their implications.

11. **Liability Limitations**:
    Specify any limitations on liability for both parties.
    - Discuss scenarios where liability may be limited or excluded entirely.
      - Provide examples of situations where liability limitations would apply.

12. **Force Majeure**:
    Include provisions for unforeseen circumstances that may prevent fulfillment of the contract.
    - Define what constitutes a force majeure event and its implications for both parties.
      - Elaborate on historical examples where force majeure has been invoked.

13. **Indemnification Clause**:
    Outline how one party will compensate the other for certain losses or damages incurred due to specific events related to this agreement.
    - Discuss scenarios where indemnification would apply and its importance in protecting against liabilities.

14. **Intellectual Property (IP) Rights**:
    Specify ownership rights regarding any intellectual property created during the course of this agreement.
    - Explain how IP rights will be managed between parties, including usage rights after termination.

15. **Non-Compete Clause**:
    Restrict one party from engaging in competing activities for a specified period after termination of this contract.
    - Discuss the rationale behind non-compete agreements and their enforceability.

16. **Data Protection and Privacy Clause**:
    Ensure compliance with data protection laws regarding personal data shared between parties during the contract period.
    - Elaborate on obligations related to data handling, storage, and processing.

17. **Change Control Clause**:
    Outline procedures for making modifications to this contract, ensuring all changes are mutually agreed upon and documented.
    - Discuss potential impacts of changes on project timelines or deliverables.

18. **Miscellaneous Provisions**:
    Any other relevant clauses that may apply to this agreement, such as assignment rights or entire agreement clauses.
    - Include provisions regarding assignment of rights, entire agreement clauses, or waiver of rights.

19. **Signatures**:

- **Party A Signature:** ____________________________  
- **Date:** ________________

- **Party B Signature:** ____________________________  
- **Date:** ________________

This contract is executed as of [Execution Date].
''';
}



void _downloadContractAsPDF() async {
  if (_generatedContract.isEmpty) {
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

  // Load fonts based on language direction
  if (isHebrew(_generatedContract)) {
    regularFont = pw.Font.ttf(await rootBundle.load('assets/NotoSansHebrew-Regular.ttf'));
    boldFont = pw.Font.ttf(await rootBundle.load('assets/NotoSansHebrew-Bold.ttf'));
    textDirection = pw.TextDirection.rtl;
  } else {
    regularFont = pw.Font.helvetica();
    boldFont = pw.Font.helveticaBold();
  }

  // Split the contract into paragraphs
  final List<String> paragraphs = _generatedContract.split('\n\n');
  final List<pw.Widget> content = [];

  // Process each paragraph for formatting
  for (String paragraph in paragraphs) {
    if (paragraph.startsWith('## ')) {
      content.add(pw.Header(
        level: 1,
        child: pw.Text(paragraph.substring(3),
            style: pw.TextStyle(font: boldFont, fontSize: 18)),
      ));
      content.add(pw.SizedBox(height: 12)); // Add space after header
    } else if (paragraph.startsWith('### ')) {
      content.add(pw.Header(
        level: 2,
        child: pw.Text(paragraph.substring(4),
            style: pw.TextStyle(font: boldFont, fontSize: 16)),
      ));
      content.add(pw.SizedBox(height: 10)); // Add space after header
    } else if (paragraph.startsWith('#### ')) {
      content.add(pw.Header(
        level: 3,
        child: pw.Text(paragraph.substring(5),
            style: pw.TextStyle(font: boldFont, fontSize: 14)),
      ));
      content.add(pw.SizedBox(height: 8)); // Add space after header
    } else {
      content.add(pw.RichText(
        text: pw.TextSpan(
          children: _parseTextWithBoldSectionsForPDF(paragraph, regularFont, boldFont),
          style: pw.TextStyle(font: regularFont, fontSize: 12),
        ),
      ));
      content.add(pw.SizedBox(height: 12)); // Add space after paragraph
    }
  }

  // Create the PDF page with proper margins
  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4.copyWith(marginTop: 20), // Set margins for the page
      build: (pw.Context context) => [
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: content,
        ),
      ],
      textDirection: textDirection,
    ),
  );

  // Share the generated PDF
  await Printing.sharePdf(
    bytes: await pdf.save(),
    filename: 'contract.pdf',
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




