import 'package:flutter/material.dart';


class ScreenFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Analytics',
          style: TextStyle(
              fontWeight: FontWeight.bold
          ),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: DropdownButton<String>(
              value: 'Lifetime',
              icon: Icon(Icons.arrow_drop_down, color: Colors.black),
              underline: SizedBox(),
              onChanged: (String? newValue) {},
              items: <String>['Lifetime', 'Last 30 days', 'Last 7 days']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Earnings',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Open Detailed View',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Overview',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildOverviewTile('Net Sales', '₹0', 'Ordered', '₹0', 'Returned', '₹0'),
                        _buildOverviewTile('Net Commissions', '₹0', 'Ordered', '₹0', 'Returned', '₹0'),
                      ],
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Generate Invoice'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, backgroundColor: Colors.black, minimumSize: Size(double.infinity, 50),
                          textStyle: TextStyle(fontSize: 18), // text color
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildEarningsInfo('Your Earnings will reflect in your Lehlah account within 5-7 days of the transaction being completed.'),
                  _buildEarningsInfo('Your eligible withdrawal amount will be transferred within 5-7 working days to your bank account mentioned in your Lehlah registration.'),
                  _buildEarningsInfo('Invoice amount is capped at 3 lacs, balance will be adjusted in the next cycle based on net sales.'),
                  _buildEarningsInfo('Read the Terms & Conditions for further details.', isLink: true),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Insights',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Open Detailed View',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Overview',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildOverviewTile('Orders Placed', '0', 'Clicks', '0', '', ''),
                        _buildOverviewTile('Average Order Value', '₹0', 'Number of Posts', '0', '', ''),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOverviewTile(String title, String amount, String subtitle1, String value1, String subtitle2, String value2) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              amount,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  subtitle1,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Text(
                  value1,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
            if (subtitle2.isNotEmpty)
              SizedBox(height: 5),
            if (subtitle2.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    subtitle2,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Text(
                    value2,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildEarningsInfo(String text, {bool isLink = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline, size: 16, color: Colors.yellow.shade700),
          SizedBox(width: 8),
          Expanded(
            child: isLink
                ? Text(
              text,
              style: TextStyle(fontSize: 14, color: Colors.blue),
            )
                : Text(
              text,
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}