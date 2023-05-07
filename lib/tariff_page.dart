import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:svg_icon/svg_icon.dart';

class TariffPage extends StatelessWidget {
  const TariffPage({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: const Color(0xff12ADC1),
        elevation: 0,
        title: const Center(
          child: Text(
            "Подписка",
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 220,
            width: w,
            color: Color(0xff12ADC1),
            child: SafeArea(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 33,
                        ),
                        const Text(
                          "Qwatt подписка",
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const SizedBox(
                          width: 300,
                          child: Text(
                            "Выгодные предложенияпо выгодным ценам!",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              height: 1.5,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                            alignment: Alignment.center,
                            height: 44,
                            width: 180,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text(
                                  "Как это работает",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff12ADC1),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Color(0xff12ADC1),
                                  size: 20,
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset(
                      "assets/images/qwatt_image.png",
                      scale: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Выберите подписку",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                ClipRRect(
                  child: Container(
                    height: 400,
                    decoration: BoxDecoration(
                      color: Color(0xffEFEFEF),
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0xffFED138).withOpacity(.8),
                          Color(0xffEFEFEF),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Стандарт",
                                  style: TextStyle(
                                    color: Color(0xff282727),
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 89,
                                  height: 26,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff00040A)
                                        .withOpacity(.05),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Text(
                                    "На неделю",
                                    style: TextStyle(
                                      color: const Color(0xff00040A)
                                          .withOpacity(.4),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ListTile(
                            leading: Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Color(0xffFED138),
                                shape: BoxShape.circle,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  SvgIcon(
                                    "assets/icons/flash3_icon.svg",
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                            title: Text(
                              "Подписка на неделю",
                              style: TextStyle(
                                color: Color(0xff282727),
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: Text(
                              "вместо 5 дней",
                              style: TextStyle(
                                color: Color(0xff686B70).withOpacity(.5),
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          ListTile(
                            leading: Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Color(0xffFED138),
                                shape: BoxShape.circle,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  SvgIcon(
                                    "assets/icons/flash3_icon.svg",
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                            title: Text(
                              "Больше 10 аренд",
                              style: TextStyle(
                                color: Color(0xff282727),
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: Text(
                              "за неделю",
                              style: TextStyle(
                                color: Color(0xff686B70).withOpacity(.5),
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          ListTile(
                            leading: Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Color(0xffFED138),
                                shape: BoxShape.circle,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  SvgIcon(
                                    "assets/icons/flash3_icon.svg",
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                            title: const Text(
                              "Еще несолько бонусов",
                              style: TextStyle(
                                color: Color(0xff282727),
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          ListTile(
                            title: const Text(
                              "12 000 сум",
                              style: TextStyle(
                                color: Color(0xff282727),
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            subtitle: Text(
                              "32 000 сум",
                              style: TextStyle(
                                color: Color(0xff686B70).withOpacity(.5),
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 48,
                            width: w,
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                                color: Color(0xff12ADC1),
                                borderRadius: BorderRadius.circular(12)),
                            child: const Text(
                              "Купить",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
