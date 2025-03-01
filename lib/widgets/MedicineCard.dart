import 'package:flutter/material.dart';

class MedicineCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String name;
  final String detail;
  final String status;
  final Color statusColor;
  final IconData statusIcon;

  const MedicineCard({
    required this.color,
    required this.icon,
    required this.name,
    required this.detail,
    required this.status,
    required this.statusColor,
    required this.statusIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Colors.indigo.shade50),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: color,

                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: Colors.white),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(detail, style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            Column(
              children: [
                Icon(statusIcon, color: statusColor),
                Text(
                  status,
                  style: TextStyle(
                      color: statusColor, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}