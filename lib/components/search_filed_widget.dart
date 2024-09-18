import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:virtual_reality/constants.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({Key? key, required this.padding}) : super(key: key);
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Constants.kGreyColor.withOpacity(0.12),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              const SizedBox(
                width: 8,
              ),
              SvgPicture.asset(
                Constants.kIconSearch,
              ),
              Expanded(
                child: TextField(
                  style: TextStyle(
                    color: Constants.kWhiteColor.withOpacity(0.6),
                    fontSize: 17,
                    letterSpacing: -0.41,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    hintText: 'Search',
                    border: InputBorder.none,
                    isDense: true,
                    hintStyle: TextStyle(
                      color: Constants.kWhiteColor.withOpacity(0.6),
                      fontSize: 17,
                      letterSpacing: -0.41,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              SvgPicture.asset(Constants.kIconMic),
              const SizedBox(
                width: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
