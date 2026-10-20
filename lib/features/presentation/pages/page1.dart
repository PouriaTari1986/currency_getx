


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_learning/core/currency_text_them.dart';
import 'package:new_learning/features/presentation/controller/currency_controller.dart';
import 'package:new_learning/gen/assets.gen.dart';


class MainPage extends GetView<CurrencyController>{
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(

    appBar: AppBar(
      backgroundColor: Colors.white,
      actions: [

        Text("قیمت به‌روز ارز",style: CurrencyTextThem.light.titleLarge,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Assets.images.icon.image(),
        ),

      ],
      leading: Assets.images.menu.image(),
    
    ),
     body: SafeArea(


       child:

          Padding(
            padding:  EdgeInsets.all(12),
            child: Column(
              mainAxisSize: .max,
               children: [

                 Row(
                   mainAxisAlignment: .end,
                   children: [
                     Text("نرخ ارز آزاد چیست؟ ", style: CurrencyTextThem.light.titleLarge,),
                     SizedBox(width: Get.width/40,),
                     Assets.images.q.image(),
                   ],
                 ),
                 SizedBox(height: 14,),
                 Text(""" نرخ ارزها در معاملات نقدی و رایج روزانه است معاملات نقدی معاملاتی هستند که خریدار و فروشنده به محض انجام معامله، ارز و ریال را با هم تبادل می نمایند.""",
                   style: CurrencyTextThem.light.titleSmall,textDirection: .rtl,),

                 Container(
                   margin: EdgeInsets.only(top: 16),
                   height: 30,
                   decoration: BoxDecoration(
                     borderRadius: .circular(100),
                     color: Color.fromARGB(255, 130, 130, 130)
                   ),
                   child:
                      Row(
                       mainAxisAlignment: .spaceAround,
                       children: [
                         Text("تغییر",style: CurrencyTextThem.light.displayMedium,),

                         Text("قیمت ",style: CurrencyTextThem.light.displayMedium,),

                         Text("نام آزاد ارز",style: CurrencyTextThem.light.displayMedium,),
                       ],
                     ),

                 ),
                 Expanded(
                   child:


                     Obx(
                         () {

                           if(controller.isLoading.value){
                             return Center(child: CircularProgressIndicator(),);
                           }else if(controller.errMsg.value.isNotEmpty){
                             return Center(child: Text(controller.errMsg.value),);
                           }
                           else if(controller.prices.isEmpty){
                             return Text("اظلاعاتی برای نمایش وجود ندارد");
                           }


                           return
                          ListView.builder(
                         scrollDirection: .vertical,
                         physics: BouncingScrollPhysics(),
                         itemCount: controller.prices.length,
                         itemBuilder: (context, index) {
                           final currency = controller.prices[index];
                         return Container(
                           margin: EdgeInsets.fromLTRB(0, Get.width/35, 0, Get.width/50),
                           height: Get.width/7,
                           decoration: BoxDecoration(
                             color: Colors.white,
                           boxShadow: <BoxShadow>[
                             BoxShadow(blurRadius: 1.0,color: Colors.black12)
                           ],
                           borderRadius: .circular(100)

                         ),
                          child:
                          Row(
                             mainAxisAlignment: .spaceAround,
                            children: [

                              Text(currency.changes+currency.status,style: CurrencyTextThem.light.titleSmall,),

                              Text(currency.price,style: CurrencyTextThem.light.titleSmall,),

                              Text(currency.title,style: CurrencyTextThem.light.titleSmall,),
                            ],
                          ),
                         );
                                 },);
                 },
                     ),
                   ),
                 Container(
                   height: 70,
                   margin: EdgeInsets.only(top: 8,bottom: 8),
                   width: .infinity,
                   decoration: BoxDecoration(
                       color: Color.fromARGB(255, 232, 232, 232),
                     borderRadius: .circular(100)
                   ),
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Row(
                      mainAxisAlignment: .spaceBetween,
                       children: [
                         Obx(()=>
                            RichText(text:
                             TextSpan(
                               children: [
                                 TextSpan(text:
                                     "آخرین بروز رسانی",
                                     style: CurrencyTextThem.light.titleLarge
                                 ),
                                 TextSpan(
                                   text: " "
                                 ),
                                 TextSpan(
                                   text: controller.lastUpdateTime.value,
                                   style: CurrencyTextThem.light.titleLarge
                                 ),
                               ]
                             ),

                           ),
                         ),

                         TextButton.icon(

                             onPressed: () async{
                               await controller.fetchCurrencies();
                               if(controller.errMsg.value.isEmpty&& context.mounted){

                                   ScaffoldMessenger.of(context).showSnackBar(
                                       SnackBar(
                                           duration: Duration(milliseconds: 500),
                                           backgroundColor: Colors.green,
                                           content: Text("بروز رسانی با موفقیت انجام شد",style: CurrencyTextThem.light.titleLarge,textAlign: .center,))
                                   );

                               }



                             },
                             style: ButtonStyle(
                              shape: WidgetStatePropertyAll<OutlinedBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100)
                              )),
                              backgroundColor: WidgetStatePropertyAll<Color>(Color.fromARGB(255, 202, 193, 255))
                             ),
                             label: Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Row(

                                 children: [

                                    Text("بروز رسانی",style: CurrencyTextThem.light.titleLarge,),

                                   SizedBox(width: 8,),
                                   Icon(CupertinoIcons.refresh_bold,color: Colors.black,)
                                 ],
                               ),
                             )),

                       ],

                     ),
                   ),
                 ),

            ],
             ),
          )



     ),
   );
  }



}



