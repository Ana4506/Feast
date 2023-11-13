import 'package:flutter/material.dart';

class Faqs extends StatelessWidget {
  const Faqs({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD1512D),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'FAQs',
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Space Grotesk",
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent.withOpacity(0.0),
        elevation: 0,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FaqItem(
              question: 'How do I create an account?',
              answer:
                  'To create an account, click on the "Sign Up" button and follow the instructions to provide your details.',
            ),
            FaqItem(
              question: 'What is SNUID?',
              answer:
                  'SNUID is your college email id for logging into the app.',
            ),
            FaqItem(
              question: 'Can I change my password?',
              answer:
                  'No, you cannot change your password in the app settings.',
            ),
            FaqItem(
              question: 'I am unable to find the restaurant I am looking for.',
              answer:
                  'The restaurant might be closed. You can try searching for other restaurants or try again after sometime.',
            ),
            FaqItem(
              question: 'Can I order without an account?',
              answer:
                  'No, you need to have an account to place orders. This helps us provide a personalized experience and track your order history.',
            ),
            FaqItem(
              question: 'What payment methods are accepted?',
              answer:
                  'We accept various payment methods, including pay on spot, and popular digital wallets. You can check the available options during the checkout process.',
            ),
          ],
        ),
      ),
    );
  }
}

class FaqItem extends StatefulWidget {
  final String question;
  final String answer;

  const FaqItem({
    required this.question,
    required this.answer,
    Key? key,
  }) : super(key: key);

  @override
  _FaqItemState createState() => _FaqItemState();
}

class _FaqItemState extends State<FaqItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      margin: EdgeInsets.only(bottom: 16.0),
      child: ExpansionTile(
        title: GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Text(
            widget.question,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: _isExpanded ? Color(0xffD1512D) : Colors.black,
            ),
          ),
        ),
        onExpansionChanged: (isExpanded) {
          setState(() {
            _isExpanded = isExpanded;
          });
        },
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.answer,
              style: TextStyle(
                color: _isExpanded ? Colors.black : Color(0xffD1512D),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
