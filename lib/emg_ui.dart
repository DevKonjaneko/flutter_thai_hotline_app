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

class EmgUI extends StatelessWidget {
  const EmgUI({super.key});

  Future<void> _callNumber(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber.replaceAll('-', '').trim(),
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    }
  }

  final List<HotlineItem> emgList = const [
    HotlineItem(
      title: 'เหตุด่วนเหตุร้าย (สำนักงานตำรวจแห่งชาติ)',
      phone: '191',
      imagePath: 'assets/images/emergency/emg_1.png',
    ),
    HotlineItem(
      title: 'กรมป้องกันและบรรเทาสาธารณภัย',
      phone: '1784',
      imagePath: 'assets/images/emergency/emg_2.png',
    ),
    HotlineItem(
      title: 'ตำรวจน้ำ',
      phone: '1196',
      imagePath: 'assets/images/emergency/emg_4.png',
    ),
    HotlineItem(
      title: 'ศูนย์ช่วยเหลือสังคม (พม.)',
      phone: '1300',
      imagePath: 'assets/images/emergency/emg_5.png',
    ),
    HotlineItem(
      title: 'ศูนย์ปลอดภัยคมนาคม',
      phone: '1356',
      imagePath: 'assets/images/emergency/emg_6.png',
    ),
    HotlineItem(
      title: 'หน่วยแพทย์กู้ชีพ (วชิรพยาบาล)',
      phone: '1554',
      imagePath: 'assets/images/emergency/emg_7.png',
    ),
    HotlineItem(
      title: 'ศูนย์เอราวัณ',
      phone: '1646',
      imagePath: 'assets/images/emergency/emg_8.png',
    ),
    HotlineItem(
      title: 'เจ็บป่วยฉุกเฉิน (สพฉ.)',
      phone: '1669',
      imagePath: 'assets/images/emergency/emg_9.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        children: [
          const Text(
            'สายด่วน\nอุบัติเหตุ-เหตุฉุกเฉิน',
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
              'assets/images/emergency/emg_0.png',
              width: 170,
              height: 120,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 170,
                height: 120,
                color: Colors.grey.shade200,
                child: const Icon(Icons.emergency, size: 55, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: emgList.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final item = emgList[index];
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