import 'package:flutter/material.dart';
import 'package:renting_app/constants/color_palette.dart';
import 'package:renting_app/model/category_model.dart';
import 'package:renting_app/utils/textStyle.dart';

class RentCategories extends StatelessWidget {
  const RentCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 30, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Find the best to rent",
            style: FontStyle.titleLarge,
          ),
          Container(
            padding: const EdgeInsets.only(top: 12),
            height: 140,
            child: ListView.builder(
                itemCount: categoryList.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return CategoriesItem(
                    name: categoryList[index].categoryName,
                    img: categoryList[index].img,
                    color: categoryList[index].color,
                  );
                }),
          )
        ],
      ),
    );
  }
}

class CategoriesItem extends StatelessWidget {
  CategoriesItem({
    super.key,
    this.name,
    this.img,
    this.color = ColorPalette.green,
    VoidCallback? onTap,
  }) : onTap = onTap ?? (() {});
  final String? name;
  final String? img;
  final Color? color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(35),
          child: Ink(
            height: 80,
            width: 120,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(35),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      img ?? "",
                      height: 100,
                      width: 100,
                    ),
                    const SizedBox(height: 5),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text: name,
                          style: FontStyle.labelLarge,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
