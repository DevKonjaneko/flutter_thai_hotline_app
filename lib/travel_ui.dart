import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Model สำหรับเก็บข้อมูลสายด่วน
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

class TravelUI extends StatelessWidget {
  const TravelUI({super.key});

  // ฟังก์ชันโทรออก
  Future<void> _callNumber(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber.replaceAll('-', '').trim(),
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    }
  }

  final List<HotlineItem> travelList = const [
    HotlineItem(
      title: 'ข้อมูลจราจร',
      phone: '1197',
      imagePath: 'assets/images/travel/travel_0.png',
    ),
    HotlineItem(
      title: 'ตำรวจทางหลวง',
      phone: '1193',
      imagePath: 'assets/images/travel/travel_1.png',
    ),
    HotlineItem(
      title: 'ตำรวจท่องเที่ยว',
      phone: '1155',
      imagePath: 'assets/images/travel/travel_2.png',
    ),
    HotlineItem(
      title: 'เส้นทางบนทางด่วน',
      phone: '1543',
      imagePath: 'assets/images/travel/travel_3.png',
    ),
    HotlineItem(
      title: 'ตํารวจจราจร.',
      phone: '1197',
      imagePath: 'assets/images/travel/travel_4.png',
    ),
    HotlineItem(
      title: 'บขส.',
      phone: '1490',
      imagePath: 'assets/images/travel/travel_5.png',
    ),
    HotlineItem(
      title: 'การรถไฟแห่งประเทศไทย',
      phone: '1690',
      imagePath: 'assets/images/travel/travel_6.png',
    ),
    HotlineItem(
      title: 'กรมทางหลวงชนบท',
      phone: '1146',
      imagePath: 'assets/images/travel/travel_7.png',
    ),
    HotlineItem(
      title: 'กรมทางหลวง',
      phone: '1586',
      imagePath: 'assets/images/travel/travel_8.png',
    ),
    HotlineItem(
      title: 'องค์การขนส่งมวลชนกรุงเทพ',
      phone: '1348',
      imagePath: 'assets/images/travel/travel_9.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        children: [
          // หัวเรื่องหมวดหมู่
          const Text(
            'สายด่วน\nการเดินทาง',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              height: 1.25,
            ),
          ),
          const SizedBox(height: 16),

          // ภาพประกอบหัวหมวดหมู่อยู่กึ่งกลาง
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/travel/travel_0.png',
              width: 170,
              height: 120,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 170,
                height: 120,
                color: Colors.grey.shade200,
                child: const Icon(Icons.directions_car, size: 55, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // รายการการ์ดสายด่วนแต่ละรายการ
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: travelList.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final item = travelList[index];
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