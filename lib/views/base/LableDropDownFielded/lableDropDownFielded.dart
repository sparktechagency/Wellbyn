import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';
import '../Apptext/app_text.dart';
class LabeledDropdownFielded extends StatelessWidget {
  final String label;
  final String titile;
  final RxString selectedValue;
  final List<String> items;
  final ValueChanged<String> onChanged;

  const LabeledDropdownFielded({
    super.key,
    required this.titile,
    required this.label,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(label, fontSize: 16, color: TextColors.neutral900,fontWeight: FontWeight.w600,),
        SizedBox(height: 6.h),
        CustomDropdownDialogss(
          items: items,
          selectedValue: selectedValue,
          onChanged: onChanged,
          title:titile,
        ),
      ],
    );
  }
}


//================================> CustomDropDwonDialogDed <=======================================
class CustomDropdownDialogss extends StatelessWidget {
  final List<String> items;
  final RxString selectedValue;
  final String title;
  final ValueChanged<String> onChanged;

  const CustomDropdownDialogss({
    Key? key,
    required this.items,
    required this.selectedValue,
    required this.title,
    required this.onChanged,
  }) : super(key: key);

  void _openDialog(BuildContext context) async {
    final selected = await showDialog<String>(
      context: context,
      builder: (context) => _DropdownDialogContent(
        title: title,
        items: items,
        selectedValue: selectedValue.value,
      ),
    );

    if (selected != null && selected != selectedValue.value) {
      selectedValue.value = selected; // ✅ update value
      onChanged(selected);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _openDialog(context),
      borderRadius: BorderRadius.circular(8),
      child: Obx(() => _DropdownInputDecorator(
        selectedValue: selectedValue.value,
      )),
    );
  }
}




//===============================> _DropdownDialogContent <==========================




class _DropdownDialogContent extends StatelessWidget {
  final String title;
  final List<String> items;
  final String? selectedValue;

  const _DropdownDialogContent({
    required this.title,
    required this.items,
    required this.selectedValue,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Appcolors.page,
      title: Text(
        title,
        style: const TextStyle(
          letterSpacing: 0.2,
          fontWeight: FontWeight.w500,
          fontSize: 17,
        ),
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: _DropdownList(items: items, selectedValue: selectedValue),
      ),
    );
  }
}



//====================================> DropDownlist <=============================
class _DropdownList extends StatelessWidget {
  final List<String> items;
  final String? selectedValue;

  const _DropdownList({required this.items, required this.selectedValue});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) => _DropdownListItem(
        item: items[index],
        isSelected: items[index] == selectedValue,
      ),
    );
  }
}



//==============================> dropdownlistItem <=======================

class _DropdownListItem extends StatelessWidget {
  final String item;
  final bool isSelected;

  const _DropdownListItem({required this.item, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected
          ? Appcolors.action.withOpacity(0.1)
          : Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        title: Text(
          item,
          style: TextStyle(
            letterSpacing: 0.2,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            fontSize: 15,
            color: isSelected ? Appcolors.action : Colors.black,
          ),
        ),
        trailing: isSelected
            ? const Icon(Icons.check, color: Appcolors.action, size: 20)
            : null,
        onTap: () => Navigator.pop(context, item),
      ),
    );
  }
}

//==============================> DropDownIndicator <=============================
class _DropdownInputDecorator extends StatelessWidget {
  final String? selectedValue;

  const _DropdownInputDecorator({required this.selectedValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: ShadowColor.shadowColors1.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              selectedValue ?? 'Select state',
              style: TextStyle(
                color: selectedValue == null
                    ? TextColors.neutral500
                    : TextColors.neutral900,
                fontWeight:
                selectedValue == null ? FontWeight.w600 : FontWeight.w500,
                fontSize: 14
              ),
            ),
          ),
          SvgPicture.asset(
            AppIcons.arrowdwonIcon,
            color: TextColors.neutral900,
          ),
        ],
      ),
    );
  }
}
