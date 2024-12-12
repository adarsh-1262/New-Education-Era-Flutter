import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.grey.shade50,
              Colors.blue.shade100,
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20.0),
              Center(
                child: Text(
                  'Frequently Asked Questions',
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade900,
                   // textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Here are some common questions regarding financial support for education, along with their answers.',
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              buildSection('General Questions', [
                buildFAQItem(
                  '1. What types of financial support are available for students?',
                  'Students can access scholarships, grants, education loans, and stipends to help finance their education.',
                ),
                buildFAQItem(
                  '2. How do I apply for scholarships?',
                  "Most scholarships require a separate application process. Visit the scholarship provider's website for details on eligibility and application procedures.",
                ),
                buildFAQItem(
                  '3. What is the difference between a grant and a scholarship?',
                  'Grants are typically need-based financial aid, while scholarships are usually merit-based awards that do not require repayment.',
                ),
                buildFAQItem(
                  '4. Can I apply for multiple scholarships at once?',
                  'Yes, you can apply for multiple scholarships. However, be sure to read the application guidelines for each scholarship.',
                ),
                buildFAQItem(
                  '5. Are there scholarships specifically for women?',
                  'Yes, many organizations offer scholarships specifically for women pursuing education in various fields.',
                ),
              ]),
              buildSection('Loan and Repayment Questions', [
                buildFAQItem(
                  '6. How do I apply for an education loan?',
                  'To apply for an education loan, research different lenders, gather required documents, and complete the loan application form.',
                ),
                buildFAQItem(
                  '7. What documents are required for a loan application?',
                  'Common documents include identity proof, admission letter, income proof, and bank statements.',
                ),
                buildFAQItem(
                  '8. What is the interest rate on education loans?',
                  'Interest rates on education loans vary by lender and can range from 8% to 14% per annum.',
                ),
                buildFAQItem(
                  '9. Is there a repayment grace period for education loans?',
                  'Most education loans offer a grace period of 6 months to 1 year after course completion before repayments start.',
                ),
                buildFAQItem(
                  '10. Can I repay my education loan early?',
                  'Yes, many lenders allow prepayment of education loans without penalties. Check your loan agreement for specifics.',
                ),
              ]),
              buildSection('Miscellaneous Questions', [
                buildFAQItem(
                  '11. How can I find scholarships that suit my profile?',
                  'Websites like Scholarships.com, College Board, and local educational institutions can help you find scholarships matching your profile.',
                ),
                buildFAQItem(
                  '12. Are there any scholarships for students with disabilities?',
                  'Yes, many organizations offer scholarships specifically for students with disabilities.',
                ),
                buildFAQItem(
                  '13. Can I appeal a scholarship decision?',
                  'Some scholarship programs allow appeals. Check the scholarship provider\'s guidelines for their specific process.',
                ),
                buildFAQItem(
                  '14. How can I avoid scholarship scams?',
                  'Research the scholarship provider and never pay an application fee for scholarships. Legitimate scholarships do not require fees.',
                ),
                buildFAQItem(
                  '15. What happens if I do not repay my education loan?',
                  'Failure to repay an education loan can lead to penalties, a lower credit score, and legal action by the lender.',
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10.0),
        Column(children: items),
        SizedBox(height: 20.0),
      ],
    );
  }

  Widget buildFAQItem(String question, String answer) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 4.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text(answer, style: TextStyle(fontSize: 14.0)),
        ],
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FAQPage(),
    ));