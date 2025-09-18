import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../config/router/router_keys.dart';
import '../../controller/home_bloc.dart';

class PackagesItem extends StatelessWidget {
  const PackagesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 34),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final item = HomeBloc.get(context).packagesTypeList[index];
            return InkWell(
              onTap: () {
                context.pushNamed(RouterKeys.packageDetailsScreen);
              },
              borderRadius: BorderRadius.circular(12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.10),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white.withValues(alpha: 0.4), width: 1),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 7, top: 10),
                            child: Image.asset(
                              item.image ?? "",
                              cacheHeight: 50,
                            ),
                          ),
                          Text(
                            item.name ?? "",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.white, // أو أي لون يناسب الخلفية
                            ),
                          ),
                          Text(
                            "(${item.hint ?? ""})",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.white70,
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: HomeBloc.get(context).packagesTypeList.length,
        ),
      ),
    );
  }
}
