import 'package:flutter/material.dart';
import 'package:recipe_browser/utils/utils.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RecipeTileSkeleton extends StatelessWidget {
  const RecipeTileSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    // return Skeleton.replace(
    //     child: SizedBox(
    //       width: 382,
    //       height: 286,
    //     )
    // );

    return Skeletonizer(
      child: SizedBox(
        width: 382,
        height: 286,
        child: Material(
          clipBehavior: Clip.antiAlias,
          color: context.theme.colorScheme.surface,
          elevation: 8,
          borderRadius: BorderRadius.circular(
              context.offset.veryLarge
          ),
          child: Stack(
            children: [
              SizedBox(
                width: double.maxFinite,
                height: 220,
                child: Image.network(
                    fit: BoxFit.fill,
                    'https://placehold.co/500x500/png'
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.maxFinite,
                  height: 100,
                  padding: EdgeInsets.all(context.offset.normal),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      color: context.theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(context.offset.veryLarge)
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        BoneMock.chars(30),
                        style: context.theme.textTheme.titleMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          Text(BoneMock.chars(8)),
                          SizedBox(width: context.offset.small),
                          Text(BoneMock.chars(8)),
                          SizedBox(width: context.offset.small),
                          Text(BoneMock.chars(8)),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
