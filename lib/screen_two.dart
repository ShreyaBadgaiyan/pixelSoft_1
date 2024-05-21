// import 'package:flutter/material.dart';
//
//
// class ScreenTwo extends StatefulWidget {
//   @override
//   State<ScreenTwo> createState() => _ScreenTwoState();
// }
//
// class _ScreenTwoState extends State<ScreenTwo> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Link Genie',
//           style: TextStyle(
//               fontWeight: FontWeight.bold
//           ),),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'How to use Link Genie',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             Container(
//               padding: const EdgeInsets.all(16.0),
//               decoration: BoxDecoration(
//                 color: Colors.black,
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'STEP 01',
//                     style: TextStyle(color: Colors.yellow, fontSize: 14, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     "Copy a product URL from our brand partner's website.",
//                     style: TextStyle(color: Colors.white, fontSize: 14),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     'STEP 02',
//                     style: TextStyle(color: Colors.yellow, fontSize: 14, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     'Paste this URL in the field below. Give it a unique name so you can reuse it in the future!',
//                     style: TextStyle(color: Colors.white, fontSize: 14),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     'STEP 03',
//                     style: TextStyle(color: Colors.yellow, fontSize: 14, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     'Click "Generate Link" and share on social media! Sales from these links will get added to your insights automatically.',
//                     style: TextStyle(color: Colors.white, fontSize: 14),
//                   ),
//                   SizedBox(height: 20),
//                   TextField(
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'Name your link so you can find it later!',
//                       filled: true,
//                       fillColor: Colors.white,
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   TextField(
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'Paste URL here',
//                       filled: true,
//                       fillColor: Colors.white,
//                       suffixIcon: Icon(Icons.paste),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         foregroundColor: Colors.black, backgroundColor: Colors.yellow, // foreground
//                       ),
//                       child: Text('Generate Link'),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class LinkLoPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text('Link-Lo Page'),
//       ),
//     );
//   }
// }
//
// class AnalyticsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text('Analytics Page'),
//       ),
//     );
//   }
// }
//
// class ProfilePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text('Profile Page'),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';


class ScreenTwo extends StatefulWidget {
  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  final List<Map<String, String>> _generatedLinks = [];
  final TextEditingController _linkNameController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();
  String _errorMessage = '';

  bool _isValidUrl(String url) {
    final uri = Uri.tryParse(url);
    return uri != null && (uri.isScheme('http') || uri.isScheme('https'));
  }

  void _generateLink() {
    setState(() {
      if (_linkNameController.text.isNotEmpty && _isValidUrl(_urlController.text)) {
        final newLink = {
          'linkName': _linkNameController.text,
          'partnerName': 'Partner Name', // Replace with actual partner name if available
          'date': DateTime.now().toString(),
          'generatedLink': _urlController.text, // Simulating generated link with the input URL
        };

        _generatedLinks.add(newLink);
        _linkNameController.clear();
        _urlController.clear();
        _errorMessage = '';
      } else {
        _errorMessage = 'Please enter a valid URL and link name.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Link Genie',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'How to use Link Genie',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'STEP 01',
                      style: TextStyle(color: Colors.yellow, fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Copy a product URL from our brand partner's website.",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'STEP 02',
                      style: TextStyle(color: Colors.yellow, fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Paste this URL in the field below. Give it a unique name so you can reuse it in the future!',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'STEP 03',
                      style: TextStyle(color: Colors.yellow, fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Click "Generate Link" and share on social media! Sales from these links will get added to your insights automatically.',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _linkNameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name your link so you can find it later!',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _urlController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Paste URL here',
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: Icon(Icons.paste),
                      ),
                    ),
                    const SizedBox(height: 10),
          
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _generateLink,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.yellow, // foreground
                        ),
                        child: const Text('Generate Link'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              if (_errorMessage.isNotEmpty)
                Text(
                  _errorMessage,
                  style: const TextStyle(color: Colors.red, fontSize: 14),
                ),
          
             if (_generatedLinks.isNotEmpty)
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   const Text(
                     'Past Links',
                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                   ),
                   const SizedBox(height: 10),
                   Expanded(
                     child: ListView.builder(
                       shrinkWrap: true,
                       itemCount: _generatedLinks.length,
                       itemBuilder: (context, index) {
                         final link = _generatedLinks[index];
                         return Card(
                           child: Padding(
                             padding: const EdgeInsets.all(16.0),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text(
                                   link['linkName'] ?? '',
                                   style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                 ),
                                 const SizedBox(height: 5),
                                 Text(
                                   link['partnerName'] ?? '',
                                   style: const TextStyle(fontSize: 14),
                                 ),
                                 const SizedBox(height: 5),
                                 Text(
                                   'Date: ${link['date']}',
                                   style: const TextStyle(fontSize: 12, color: Colors.grey),
                                 ),
                                 const SizedBox(height: 5),
                                 Text(
                                   'Generated Link: ${link['generatedLink']}',
                                   style: const TextStyle(fontSize: 14, color: Colors.blue),
                                 ),
                               ],
                             ),
                           ),
                         );
                       },
                     ),
                   ),
                 ],
               ),

            ],

          ),
        ),
      ),
    );
  }
}

