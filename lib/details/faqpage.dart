import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  final List<FAQItem> faqItems = [
    FAQItem(
      question: 'What is this App for',
      answer:
      'This App is created to help Farmers grow and maintain their crops more effeciently',
    ),
    FAQItem(
      question: 'Is this App free',
      answer:
      'This is in Development Stage , and is free to use by any Farmer ',
    ),
    FAQItem(
      question: 'For whom this app is intend to ?',
      answer:
      'This app is mostly Intended for Farmers but as in development stage it is only limited to the one in Jalgaon , Maharashtra region',
    ),
    FAQItem(
      question: 'What is the accuracy of Information Provided?',
      answer:
      'Accuracy of Information depends on the Service provider , For Weather we are using weatherapi.org , for weathermap we are using MeteoBlue , news is being fetched from News API .\n We are also using external websites or hyperlink method to redirect you to the home websites of Information , their accuracy depends on the host websites data. ',
    ),
    // Add more FAQ items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ'),
      ),
      body: ListView.builder(
        itemCount: faqItems.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(
              faqItems[index].question,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Text(faqItems[index].answer , style: TextStyle(fontSize: 16),),
              ),
            ],
          );
        },
      ),
    );
  }
}

class FAQItem {
  final String question;
  final String answer;

  FAQItem({
    required this.question,
    required this.answer,
  });
}
