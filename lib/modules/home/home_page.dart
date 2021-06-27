import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payflow/modules/home/home_controller.dart';
import 'package:payflow/modules/meus_boletos/meus_boletos_page.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_style.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = HomeController();
  final pages = [
    MeusBoletosPage(),
    Container(
      color: Colors.blueGrey,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(152),
          child: Container(
            height: 152,
            color: AppColors.primary,
            child: Center(
              child: ListTile(
                title: Text.rich(
                  TextSpan(
                    text: "Olá, ",
                    style: TextStyles.titleRegular,
                    children: [
                      TextSpan(
                        text: "Jovino",
                        style: TextStyles.titleBoldBackground,
                      ),
                    ]),
                ),
                subtitle: Text(
                  "Mantenha suas contas em dia",
                  style: TextStyles.captionShape,
                ),
                trailing: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: pages[homeController.currentPage],
        bottomNavigationBar: Container(
          height: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: (){
                  homeController.setPage(0);
                  setState(() {
                    
                  });
                },
                icon: Icon(
                  Icons.home,
                  color: AppColors.primary,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(context, "/barcode_scanner");
                  Navigator.pushNamed(context, "/insert_boleto");
                },
                child: Container(
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Icon(
                    Icons.add_rounded,
                    color: AppColors.background,
                  ),
                ),
              ),
              IconButton(
                onPressed: (){
                  homeController.setPage(1);
                  setState(() {
                    
                  });
                },
                icon: Icon(
                  Icons.description_outlined,
                  color: AppColors.body,
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
