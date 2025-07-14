import 'package:flutter/material.dart';
import 'package:wellbyn/utils/app_colors.dart';
import 'package:get/get.dart';
import 'package:wellbyn/utils/nab_ids.dart';

class AccountBottomSheet extends StatefulWidget {
  const AccountBottomSheet({super.key});

  @override
  State<AccountBottomSheet> createState() => _AccountBottomSheetState();
}

class _AccountBottomSheetState extends State<AccountBottomSheet> {

  final List<Map<String, dynamic>> caregivers = [
    {
      "name": "Sakib",
      "label": "Caregiver",
      "avatar": "Sa",
      "avatarColor": Colors.brown,
      "labelColor": BorderColors.warning50,
    },
    {
      "name": "Kamal",
      "label": "Caregiver",
      "avatar": "Ka",
      "avatarColor":  Colors.brown,
      "labelColor":BorderColors.warning50,
    },
    {
      "name": "Kamal",
      "label": "Caregiver",
      "avatar": "Ka",
      "avatarColor":  Colors.brown,
      "labelColor": BorderColors.warning50,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 50,
            height: 5,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Text(
            "Switch account",
            style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,fontFamily: "Satoshi",color: TextColors.neutral900),
          ),
          const SizedBox(height: 12),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Personal account',
              style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,fontFamily: "Satoshi",color: TextColors.neutral900),
            ),
          ),
          const _AccountTile(
            name: 'Mahmud',
            label: 'Personal',
            avatar: 'Ma',
            avatarColor: Appcolors.action,
            labelColor: Appcolors.action,
          ),
          const SizedBox(height: 8),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'As a caregiver',
              style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,fontFamily: "Satoshi",color: TextColors.neutral900),
            ),
          ),
          SizedBox(
            height: 140, // Set height so it fits in bottom sheet
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: caregivers.length,
              itemBuilder: (context, index) {
                final caregiver = caregivers[index];
                return _AccountTile(
                  name: caregiver['name'],
                  label: caregiver['label'],
                  avatar: caregiver['avatar'],
                  avatarColor: caregiver['avatarColor'],
                  labelColor: caregiver['labelColor'],
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: (){
              Get.toNamed("/caregiver_mode",id: NavIds.profilenav);

            },
            child: Container(
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Appcolors.primary,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Appcolors.action, width: 1),
              ),
              child: const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, color: Appcolors.action,),
                    SizedBox(width: 8),
                    Text(
                      "Add Caregiver",
                      style: TextStyle(color: Appcolors.action,fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class _AccountTile extends StatelessWidget {
  final String name;
  final String label;
  final String avatar;
  final Color avatarColor;
  final Color labelColor;

  const _AccountTile({
    required this.name,
    required this.label,
    required this.avatar,
    required this.avatarColor,
    required this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: label == 'Caregiver' ? Colors.orange.shade50 : Appcolors.actionHoverLight,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: avatarColor,
                child: Text(
                  avatar,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(width: 8),
              Text(name),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: avatarColor),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              label,
              style: TextStyle(
                color: avatarColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
