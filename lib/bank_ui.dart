import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HotlineItem {
  final String title;
  final String phone;
  final String imagePath;

  const HotlineItem({
    required this.title,
    required this.phone,
    required this.imagePath,
  });
}

class BankUI extends StatelessWidget {
  const BankUI({super.key});

  Future<void> _callNumber(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber.replaceAll('-', '').trim(),
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    }
  }

  final List<HotlineItem> bankList = const [
    HotlineItem(
      title: 'ธนาคารกรุงเทพ',
      phone: '1333',
      imagePath: 'assets/images/bank/bank_1.png',
    ),
    HotlineItem(
      title: 'ธนาคารออมสิน',
      phone: '1115',
      imagePath: 'assets/images/bank/bank_2.png',
    ),
    HotlineItem(
      title: 'ธนาคารกสิกรไทย',
      phone: '0-2888-8888',
      imagePath: 'assets/images/bank/bank_3.png',
    ),
    HotlineItem(
      title: 'ธนาคารกรุงไทย',
      phone: '0-2111-1111',
      imagePath: 'assets/images/bank/bank_4.png',
    ),
    HotlineItem(
      title: 'ธนาคารกรุงศรีอยุธยา',
      phone: '1572',
      imagePath: 'assets/images/bank/bank_5.png',
    ),
    HotlineItem(
      title: 'ธนาคารทหารไทยธนชาต (ttb)',
      phone: '1428',
      imagePath: 'assets/images/bank/bank_6.png',
    ),
    HotlineItem(
      title: 'ซิตี้แบงก์',
      phone: '1588',
      imagePath: 'assets/images/bank/bank_7.png',
    ),
    HotlineItem(
      title: 'ธนาคารแลนด์ แอนด์ เฮ้าส์ (LH Bank)',
      phone: '1327',
      imagePath: 'assets/images/bank/bank_8.png',
    ),
    HotlineItem(
      title: 'ธนาคารอาคารสงเคราะห์ (ธอส.)',
      phone: '0-2645-9000',
      imagePath: 'assets/images/bank/bank_9.png',
    ),
    HotlineItem(
      title: 'ธนาคารไทยพาณิชย์',
      phone: '0-2777-7777',
      imagePath: 'assets/images/bank/bank_10.png',
    ),
    HotlineItem(
      title: 'ธนาคารเกียรตินาคินภัทร',
      phone: '0-2165-5555',
      imagePath: 'assets/images/bank/bank_11.png',
    ),
    HotlineItem(
      title: 'ธนาคารไทยเครดิต',
      phone: '0-2697-5454',
      imagePath: 'assets/images/bank/bank_12.png',
    ),
    HotlineItem(
      title: 'ธนาคารยูโอบี (UOB)',
      phone: '0-2285-1555',
      imagePath: 'assets/images/bank/bank_13.png',
    ),
    HotlineItem(
      title: 'ธนาคารทิสโก้ (TISCO)',
      phone: '0-2633-6000',
      imagePath: 'assets/images/bank/bank_14.png',
    ),
    HotlineItem(
      title: 'ธนาคารอิสลามแห่งประเทศไทย',
      phone: '1302',
      imagePath: 'assets/images/bank/bank_15.png',
    ),
    HotlineItem(
      title: 'ธนาคาร ซีไอเอ็มบี ไทย (CIMB THAI)',
      phone: '0-2626-7777',
      imagePath: 'assets/images/bank/bank_16.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        children: [
          const Text(
            'สายด่วน\nธนาคาร',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              height: 1.25,
            ),
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/bank/bank_0.png',
              width: 170,
              height: 120,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 170,
                height: 120,
                color: Colors.grey.shade200,
                child: const Icon(Icons.account_balance, size: 55, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: bankList.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final item = bankList[index];
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.grey.shade300, width: 1.2),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(9),
                      child: Image.asset(
                        item.imagePath,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => const Icon(
                          Icons.phone_in_talk,
                          color: Colors.grey,
                          size: 26,
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  subtitle: Text(
                    item.phone,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.call_rounded, color: Colors.black87, size: 24),
                    onPressed: () => _callNumber(item.phone),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}