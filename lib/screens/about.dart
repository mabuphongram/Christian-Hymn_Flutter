import 'package:flutter/material.dart';
import 'package:hymn/themes/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Provider.of<ThemeProvider>(context).themeData.colorScheme.secondary,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 25, 15, 25),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    //  Center(
                    //    child: Text(
                    //                       'This hymn app is designed to provide easy access to hymns for worship and personal devotion.',
                    //                       style: TextStyle(fontSize: 14),
                    //                     ),
                    //  ),
                    ClipOval(
                      
                      child: Image.asset(
                        
                        
                        'asset/icons/church_of_chirst.jpg',
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 15,),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13),
                      child: Text(
                        'မန္တလေးနယ်အတွင်းရှိ ခရစ်တော်၏အသင်းတော်များ၏ ပြည်တွင်းပြည်ပရှိအသင်းသူအသင်းသားများ အားလုံးအတွက်ရည်ရွယ်၍ ဤapplicationကို မန္တလေးနယ်ဧဝံဂေလိကော်မတီမှ စီစဉ်ပြုလုပ်ရခြင်းဖြစ်သည်။ အသင်းသူအသင်းသားများ မည်သည့်နေရာတွင်ရောက်ရှိနေပါစေ အလွယ်တကူဘုရား၏ဂုဏ်တော်ကို ချီးမွမ်းသီဆိုနိုင်ရန်ရည်ရွယ်ပါသည်။',
                          
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          height: 1.7,
                          letterSpacing: 0.3,
                          fontSize: 16,
                          color: Provider.of<ThemeProvider>(context)
                            .themeData
                            .colorScheme
                            .inversePrimary,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'This app is released by ',
                      style: TextStyle(
                        color: Provider.of<ThemeProvider>(context)
                            .themeData
                            .colorScheme
                            .inversePrimary,
                      ),
                    ),
                    Text('Mandalay Regional Evangelizing Committee',style: TextStyle(
                        color: Provider.of<ThemeProvider>(context)
                            .themeData
                            .colorScheme
                            .inversePrimary,
                      ),),
                    Text('in July 2024',style: TextStyle(
                        color: Provider.of<ThemeProvider>(context)
                            .themeData
                            .colorScheme
                            .inversePrimary,
                      ),),
                      SizedBox(height:6),
                    InkWell(
                      onTap: (){
                         final Uri emailLaunchUri = Uri(
                            scheme: 'mailto',
                            path: 'churchofchirst.mrec@gmail.com',
                          );
                          launchUrl(emailLaunchUri);
                      },
                      child: Text(
                        'churchofchrist.mrec@gmail.com',

                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.blue,
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          color: Colors.blue
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
 
                        SizedBox(
                          height: 8,
                        ),
                        Column(
                          children: [
                            Text(
                              'Permission Granted by',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Provider.of<ThemeProvider>(context)
                                    .themeData
                                    .colorScheme
                                    .inversePrimary,
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              'Copyright© BCC, INC.',
                              style: TextStyle(
                                color: Provider.of<ThemeProvider>(context)
                                    .themeData
                                    .colorScheme
                                    .inversePrimary,
                              ),
                            ),
                            // Text('Permission Granted by',style: TextStyle(fontStyle: FontStyle.italic,fontSize: 11),),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              '(James Redamwang)',
                              style: TextStyle(
                                color: Provider.of<ThemeProvider>(context)
                                    .themeData
                                    .colorScheme
                                    .inversePrimary,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 25, 15, 50),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'asset/icons/me1.jpg',
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'App Created by',
                      style: TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                        color: Provider.of<ThemeProvider>(context)
                            .themeData
                            .colorScheme
                            .inversePrimary,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      'MB Phong Ram',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.purple,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),

                    Container(
                      width: 280,
                      child: ElevatedButton(
                        onPressed: () {
                          final profile = Uri.parse(
                              'https://www.facebook.com/mbpong.ram.9');
                          launchUrl(profile,
                              mode: LaunchMode.externalApplication);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 240, 236, 236),
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.0), // Add horizontal padding
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.facebook,
                                color: Color.fromARGB(255, 42, 62, 217)),
                            SizedBox(width: 8.0),
                            Text(
                              ' MB Phong Ram',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 14.0), // Add space between buttons
                    Container(
                      width: 280,
                      child: ElevatedButton(
                        onPressed: () {
                          final profile = Uri.parse(
                              'https://t.me/mbpongram');
                          launchUrl(profile,mode: LaunchMode.externalApplication
                              );
                          // final Uri phoneLaunchUri = Uri(
                          //   scheme: 'tel',
                          //   path: '+95 9954395321',
                          // );
                          // launchUrl(phoneLaunchUri);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 240, 236, 236),
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.0), // Add horizontal padding
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.telegram,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 8.0),
                            Text(
                              ' Discover More Apps',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 14.0), // Add space between buttons
                    Container(
                      width: 280,
                      child: ElevatedButton(
                        onPressed: () {
                          final Uri emailLaunchUri = Uri(
                            scheme: 'mailto',
                            path: 'mabuphongram171@.com',
                          );
                          launchUrl(emailLaunchUri);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 240, 236, 236),
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.0), // Add horizontal padding
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.email_rounded,
                              color: Colors.green,
                            ),
                            SizedBox(width: 8.0),
                            Text(
                              ' mabuphongram171@gmail.com',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
