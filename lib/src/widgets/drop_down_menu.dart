import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdownButton extends StatelessWidget {
  final double width;
  final double height;
  final String? hintText;
  final int? value;
  final Function()? onTap;
  final void Function(int?) onChanged;
  final List<DropdownMenuItem<int>>? items;
  const CustomDropdownButton({
    Key? key,
   required this.width,
   required this.height,
    this.hintText,
    this.value,
    this.onTap,
    required this.onChanged,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:width.w,
      //MediaQuery.of(context).size.width -20,
      //260.w,
      height: height.h,
      //50.h,
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        border: Border.all(),
          color:  Color(hexStringToHexInt(('#FBFBFB'),)),
          // const Color(0xF6F6F6),
          borderRadius: BorderRadius.circular(4.r)),
      child: Material(
  color:  Color(hexStringToHexInt(('#FBFBFB'),)),
    borderRadius: BorderRadius.circular(4.r),
        //elevation: 10,
       // color: const Color(0xffF6F6F6),
        child: DropdownButton(
          borderRadius: BorderRadius.circular(15.r),
          dropdownColor: const Color(0xffF6F6F6),
          icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xff656060)),
          elevation: 20,
          value: value,
          onTap: onTap,
          isExpanded: true,
          padding:  EdgeInsets.only(left:12.h,right: 12.h),
          iconSize: 40.dm,
          hint: Text(hintText ?? '',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp)),
          underline: const SizedBox(),
          items: items,
          onChanged: onChanged,
        ),
      ),
    );
  }
  hexStringToHexInt(String hex) {
    hex = hex.replaceFirst('#', '');
    hex = hex.length == 6 ? 'ff' + hex : hex;
    int val = int.parse(hex, radix: 16);
    return val;
  }
}