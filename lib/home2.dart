// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:speech_to_text/speech_to_text.dart' as stt;
// import 'package:cdgi/viewmodels/issue_viewmodel.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   final IssueViewModel _issueViewModel = IssueViewModel();
//   final stt.SpeechToText _speech = stt.SpeechToText();
//   bool _isListening = false;
//   String _transcript = '';
//
//   /* ---------- VOICE CONTROL ---------- */
//   Future<void> _startListening() async {
//     final available = await _speech.initialize(
//       onStatus: (s) => debugPrint('STATUS → $s'),
//       onError: (e) => _showSnack('Speech error: ${e.errorMsg}'),
//     );
//
//     if (!available) {
//       _showSnack('Speech engine unavailable');
//       return;
//     }
//
//     HapticFeedback.mediumImpact();
//     setState(() => _isListening = true);
//
//     await _speech.listen(
//       onResult: (val) => setState(() => _transcript = val.recognizedWords),
//       localeId: await _speech.systemLocale().then(
//         (v) => v?.localeId ?? 'en_US',
//       ),
//     );
//   }
//
//   Future<void> _stopListening() async {
//     await _speech.stop();
//     HapticFeedback.mediumImpact();
//     setState(() => _isListening = false);
//
//     if (!mounted) return;
//     showModalBottomSheet(
//       context: context,
//       builder: (_) => _ConfirmationSheet(text: _transcript),
//     );
//   }
//
//   Future<void> _submitIssue() async {
//     if (_transcript.isEmpty) return;
//
//     try {
//       final either = await _issueViewModel.createIssue(
//         "user@example.com", // You can replace with actual user email
//         "Voice Report",
//         _transcript,
//       );
//
//       either.fold(
//         (failure) {
//           _showSnack('Error: ${failure.message}');
//         },
//         (success) {
//           _showSnack('Issue submitted successfully!');
//           setState(
//             () => _transcript = '',
//           ); // Clear transcript after successful submission
//         },
//       );
//     } catch (e) {
//       _showSnack('Failed to submit issue: $e');
//     }
//   }
//
//   /* ---------- UI ---------- */
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             children: [
//               const SizedBox(height: 16),
//               const Text(
//                 'Municipal\nServices Assistant',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 32),
//
//               /* ---------- LIVE TRANSCRIPT ---------- */
//               Expanded(
//                 child: Container(
//                   width: double.infinity,
//                   padding: const EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: Colors.yellow.shade100,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: SingleChildScrollView(
//                     reverse: true,
//                     child: Text(
//                       _transcript.isEmpty
//                           ? 'Tap the mic and describe your issue'
//                           : _transcript,
//                       style: const TextStyle(fontSize: 18),
//                     ),
//                   ),
//                 ),
//               ),
//
//               if (_transcript.isNotEmpty)
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   child: Align(
//                     alignment: Alignment.centerRight,
//                     child: Container(
//                       decoration: BoxDecoration(
//                         gradient: const LinearGradient(
//                           colors: [
//                             Color(0xFF3377FF),
//                             Color(0xFFBE73FF),
//                             Color(0xFF9F85FF),
//                           ],
//                           begin: Alignment.centerLeft,
//                           end: Alignment.centerRight,
//                         ),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: ElevatedButton(
//                         onPressed: _submitIssue,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.transparent,
//                           shadowColor: Colors.transparent,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 24,
//                             vertical: 12,
//                           ),
//                         ),
//                         child: Text(
//                           'Submit: ${_transcript.length > 20 ? '${_transcript.substring(0, 20)}...' : _transcript}',
//                           style: const TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//
//               const SizedBox(height: 24),
//
//               /* ---------- MIC BUTTON ---------- */
//               AnimatedContainer(
//                 duration: const Duration(milliseconds: 300),
//                 width: 80,
//                 height: 80,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   border: Border.all(
//                     color: const Color(0xFF468AFF).withOpacity(0.3),
//                     width: 2,
//                   ),
//                   color: Colors.white,
//                   boxShadow: [
//                     BoxShadow(
//                       color: const Color(0xFF468AFF).withOpacity(0.1),
//                       spreadRadius: 0,
//                       blurRadius: 10,
//                       offset: const Offset(0, 2),
//                     ),
//                   ],
//                 ),
//                 child: Material(
//                   color: Colors.transparent,
//                   child: InkWell(
//                     borderRadius: BorderRadius.circular(40),
//                     onTap: () async {
//                       if (_isListening) {
//                         await _stopListening();
//                       } else {
//                         await _startListening();
//                       }
//                     },
//                     child: Container(
//                       decoration: const BoxDecoration(shape: BoxShape.circle),
//                       child: Icon(
//                         _isListening ? Icons.mic : Icons.mic_none,
//                         size: 32,
//                         color: _isListening
//                             ? const Color(0xFF468AFF)
//                             : const Color(0xFF468AFF),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 12),
//               Text(
//                 _isListening ? 'Listening…' : 'Tap the mic to start',
//                 style: TextStyle(
//                   color: _isListening
//                       ? theme.colorScheme.primary
//                       : Colors.black54,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   /* ---------- HELPERS ---------- */
//   void _showSnack(String msg) =>
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
// }
//
// /* ---------- CONFIRMATION SHEET ---------- */
// class _ConfirmationSheet extends StatelessWidget {
//   final String text;
//   const _ConfirmationSheet({required this.text});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(
//         bottom: MediaQuery.of(context).viewInsets.bottom,
//       ),
//       child: Wrap(
//         children: [
//           ListTile(
//             title: const Text('We heard:'),
//             subtitle: Text(text, style: const TextStyle(fontSize: 16)),
//           ),
//           ButtonBar(
//             alignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               OutlinedButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: const Text('Try again'),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text('Complaint sent!')),
//                   );
//                 },
//                 child: const Text('Send'),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
