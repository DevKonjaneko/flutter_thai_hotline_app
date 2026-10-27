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

class PubUI extends StatelessWidget {
  const PubUI({super.key});

  Future<void> _callNumber(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber.replaceAll('-', '').trim(),
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    }
  }

  final List<HotlineItem> pubList = const [
    HotlineItem(
      title: 'การไฟฟ้านครหลวง',
      phone: '1130',
      imagePath: 'assets/images/pubutil/pub_1.png',
    ),
    HotlineItem(
      title: 'การไฟฟ้าส่วนภูมิภาค',
      phone: '1129',
      imagePath: 'assets/images/pubutil/pub_2.png',
    ),
    HotlineItem(
      title: 'การไฟฟ้าฝ่ายผลิตแห่งประเทศไทย',
      phone: '1416',
      imagePath: 'assets/images/pubutil/pub_3.png',
    ),
    HotlineItem(
      title: 'การประปานครหลวง',
      phone: '1125',
      imagePath: 'assets/images/pubutil/pub_4.png',
    ),
    HotlineItem(
      title: 'การประปาส่วนภูมิภาค',
      phone: '1662',
      imagePath: 'assets/images/pubutil/pub_5.png',
    ),
    HotlineItem(
      title: 'True Call Center',
      phone: '1242',
      imagePath: 'assets/images/pubutil/pub_6.png',
    ),
    HotlineItem(
      title: 'dtac Call Center',
      phone: '1678',
      imagePath: 'assets/images/pubutil/pub_7.png',
    ),
    HotlineItem(
      title: 'AIS Call Center',
      phone: '1175',
      imagePath: 'assets/images/pubutil/pub_8.png',
    ),
    HotlineItem(
      title: 'TOT (NT)',
      phone: '1100',
      imagePath: 'assets/images/pubutil/pub_9.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        children: [
          const Text(
            'สายด่วน\nสาธารณูปโภค',
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
              'assets/images/pubutil/pub_0.png',
              width: 170,
              height: 120,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 170,
                height: 120,
                color: Colors.grey.shade200,
                child: const Icon(Icons.water_drop, size: 55, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: pubList.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final item = pubList[index];
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