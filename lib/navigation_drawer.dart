import 'package:flutter/material.dart';
import 'package:qwat/tariff_page.dart';
import 'package:svg_icon/svg_icon.dart';

class NavigationDrawers extends StatelessWidget {
  NavigationDrawers({super.key});

  List list_icon = [
    "assets/icons/user_icon.svg",
    "assets/icons/flash_icon.svg",
    "assets/icons/history_icon.svg",
    "assets/icons/credit_card_icon.svg",
    "assets/icons/tariff_icon.svg",
    "assets/icons/call_icon.svg",
    "assets/icons/Documentation_icon.svg",
    "assets/icons/support_icon.svg",
    "assets/icons/language_icon.svg",
    "assets/icons/about_icon.svg",
  ];
  List list_title = [
    "Профиль",
    "Подписка",
    "История заказов",
    "Мои карты",
    "Тарифы",
    "Франчайзинг",
    "Документация",
    "Поддержка",
    "Язык",
    "О приложении",
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                const SvgIcon(
                  "assets/icons/flash2_icon.svg",
                  color: Color(0xffFCCF30),
                  height: 48,
                  width: 30,
                ),
                const SizedBox(
                  width: 16,
                ),
                const SvgIcon(
                  "assets/images/qwatt.svg",
                  color: Color(0xff12ADC1),
                  height: 25,
                  width: 100,
                ),
                const SizedBox(
                  width: 23,
                ),
                Container(
                  alignment: Alignment.center,
                  width: 92,
                  height: 32,
                  decoration: BoxDecoration(
                    color: const Color(0xff12ADC1),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: const Text(
                    "Баллы: 18",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 550,
              child: ListView.builder(
                itemCount: list_icon.length,
                itemBuilder: (ctx, i) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 16, bottom: 22),
                    child: GestureDetector(
                      onTap: () {
                        i == 1
                            ? Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (ctx) => TariffPage()),
                              )
                            : null;
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 28,
                            width: 28,
                            decoration: BoxDecoration(
                                color: const Color(0xff12ADC1).withOpacity(.1),
                                borderRadius: BorderRadius.circular(4)),
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: SvgIcon(
                                list_icon[i],
                                color: Color(0xff12ADC1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            list_title[i],
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                const Text(
                  "Присоединяйтесь к нам",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SvgIcon(
                      "assets/icons/telegram_icon.svg",
                      color: Color(0xff12ADC1),
                      height: 28,
                      width: 28,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    SvgIcon(
                      "assets/icons/instagram_icon.svg",
                      color: Color(0xff12ADC1),
                      height: 28,
                      width: 28,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    SvgIcon(
                      "assets/icons/facebook_icon.svg",
                      color: Color(0xff12ADC1),
                      height: 28,
                      width: 28,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
