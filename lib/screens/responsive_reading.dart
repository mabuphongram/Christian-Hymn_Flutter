import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hymn/screens/hymn_pdf.dart';
import 'package:hymn/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class Reading extends StatefulWidget {
  const Reading({super.key});

  @override
  State<Reading> createState() => _ReadingState();
}

class _ReadingState extends State<Reading> {
  final TextEditingController _searchController = TextEditingController();
  bool isHovered = false;
  bool isTapped = false;

  Color defaultColor = Colors.blueGrey;
  Color hoveredColor = Colors.blue;
  Color tappedColor = Colors.green;

  final Map<String, String> hymns = {
    "၁": "ပညတ်တော် (၁၀) ပါး",
    "၂": "သားသမီးများအားသွန်သင်ခြင်း",
    "၃": "နာခံခြင်း",
    "၄": "ခွင့်လွတ်ခြင်း",
    "၅": "နှုတ်ကပတ်တော်",
    "၆": "မေရှိုယရှင်ဘုရင်",
    "၇": "ခရစ်တော်လူ့ဇာတိခံယူခြင်း",
    "၈": "ပညာရှိများလာရောက်ဖူးမြော်ခြင်း",
    "၉": "ခရစ်တော်နှစ်ခြင်းခံခြင်း",
    "၁၀": "ခရစ်တော်အားဂုဏ်ပြုကြိုဆိုခြင်း",
    "၁၁": "ခရစ်တော်ဆင်းရဲဒုက္ခရောက်ခြင်း",
    "၁၂": "ခရစ်တော်အသေခံခြင်း",
    "၁၃": "ခရစ်တော်အထက်သို့ဆောင်ယူခြင်း",
    "၁၄": "ခရစ်တော်အားဂုဏ်ပြုချီးမြှင့်ခြင်း",
    "၁၅": "ခရစ်တော်ပြန်လာမည်",
    "၁၆": "သန့်ရှင်းသောဝိညာဉ်တော်",
    "၁၇": "သာသနာလုပ်ငန်း",
    "၁၈": "အသင်းတော်",
    "၁၉": "သခင်ဘုရား၏ ညစာ",
    "၂၀": "ဝမ်းမြောက်ရွှင်မြူးခြင်း",
    "၂၁": "စပျစ်နွယ်ပင်နှင့်အခက်များ",
    "၂၂": "စံပြ ဆုတောင်းချက်",
    "၂၃": "နှစ်သိမ့်ခြင်း",
    "၂၄": "ဘုရားသခင်၏ မေတ္တာ",
    "၂၅": "အသစ်တဖန်မွေးဖွားခြင်း",
    "၂၆": "ဆုတောင်းခြင်း",
    "၂၇": "ပေးကမ်းစွန့်ကြဲခြင်း",
    "၂၈": "သစ္စာရှိခြင်း",
    "၂၉": "ထာဝရအသက်",
    "၃၀": "ကျေးဇူးတော်အားဖြင့် ကယ်တင်ခြင်း",
    "၃၁": "ရွေးနှုတ်တော်မူခြင်း",
    "၃၂": "ခရစ်ယာန်ချစ်ခြင်းမေတ္တာ",
    "၃၃": "ယုံကြည်ခြင်း",
    "၃၄": "မိသားစုလုပ်ငန်း",
    "၃၅": "စည်းလုံးညီညွတ်ခြင်း",
    "၃၆": "အစိုးရမင်းအား ရိုသေခြင်း",
    "၃၇": "အလုပ်လုပ်ခြင်း",
    "၃၈": "ခရစ်ယာန်တို၏ ရှင်ပြန်ထမြောက်ခြင်း",
    "၃၉": "ယုံကြည်ခြင်းအားဖြင့် ဖြောင့်မတ်ရာသို့ရောက်ခြင်း",
    "၄၀": "ရင့်ကျက်ရာသို့ရောက်ခြင်း",
    "၄၁": "ခရစ်တော်၏ ယဇ်ပုရောဟိတ်အလုပ်",
    "၄၂": "ခရစ်တော်အား စုံစမ်းသွေးဆောင်ခြင်း",
    "၄၃": "သန့်ရှင်းစင်ကြယ်ခြင်း",
    "၄၄": "အမှုတော်အတွက် ဆက်ကပ်ခြင်း",
    "၄၅": "စွဲစွဲမြဲမြဲရှိခြင်း",
    "၄၆": "ဖြောင့်မတ်ခြင်း",
    "၄၇": "ချီးကျူးထောမနာပြုခြင်း",
    "၄၈": "ဉာဏ်ပညာ",
    "၄၉": "ဝမ်းမြောက်ခြင်း",
    "၅၀": "ပြန်လည်သင့်မြတ်ခြင်း",
    "၅၁": "အပြစ်အရှိအပေါ်အောင်မြင်ခြင်း",
    "၅၂": "ဘုရားသခင်၏ကောင်းမြတ်တော်မူခြင်း",
    "၅၃": "ခရစ်တော်သည် အသက်မုန့်ဖြစ်တော်မူခြင်း",
    "၅၄": "ဝိညာဉ်ဆုကျေးဇူးများ",
    "၅၅": "ခရစ်ယာန်တို့ ကျင့်ဆောင်ရမည့်အရာများ",
    "၅၆": "ကောင်းသော ရှမာရိ",
    "၅၇": "သခင်ဘုရား၏ နောက်ဆုံးသော ညစာ",
    "၅၈": "ခရစ်ယာန်တို့၏ နှစ်ခြင်းမင်္ဂလာ",
    "၅၉": "မိဿဟာယဖွဲခြင်း",
    "၆၀": "ယုံကြည်စိတ်ချမှု",
  };

  late Map<String, String> filteredHymns;

  @override
  void initState() {
    super.initState();
    filteredHymns = hymns;
    _searchController.addListener(_filterHymns);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterHymns() {
    final query = _searchController.text.trim().toLowerCase();
    if (query.isEmpty) {
      setState(() {
        filteredHymns = hymns;
      });
    } else {
      final filtered = Map.fromEntries(hymns.entries.where((entry) {
        final keyMatch = entry.key.contains(query);
        final valueMatch = entry.value.toLowerCase().contains(query);
        final indexMatch = (hymns.keys.toList().indexOf(entry.key) + 1)
            .toString()
            .contains(query);
        return keyMatch || valueMatch || indexMatch;
      }));

      setState(() {
        filteredHymns = filtered;
      });
    }
  }

  void _showGridDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width * 0.8,
            padding: EdgeInsets.all(5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'အပြန်အလှန် နံပါတ်များ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 6,
                      crossAxisSpacing: 6,
                      mainAxisSpacing: 6,
                    ),
                    itemCount: filteredHymns.length,
                    itemBuilder: (BuildContext context, int index) {
                      final hymnKey = filteredHymns.keys.elementAt(index);

                      return GestureDetector(
                        onTap: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyPdfViewer(
                                pdfPath:
                                    'asset/images/RP${(index + 1).toString().padLeft(2, '0')}-1.jpg',
                                number: hymnKey,
                                hymn: hymns.values.elementAt(
                                    hymns.keys.toList().indexOf(hymnKey)),
                                type: "အပြန်အလှန်",
                                index: index + 1,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Center(
                            child: Text(
                              hymnKey,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Provider.of<ThemeProvider>(context).themeData.colorScheme.secondary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: CupertinoSearchTextField(
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemGrey5,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  controller: _searchController,
                  placeholder: 'အပြန်အလှန် ရိုက်ရှာရန်',
                  style: TextStyle(fontSize: 16),
                  placeholderStyle: TextStyle(
                    color: Color.fromARGB(255, 112, 111, 111),
                    fontSize: 15,
                  ),
                  prefixInsets: EdgeInsets.only(left: 16),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              IconButton(
                icon: Image.asset(
                  'asset/icons/grid2.png',
                  color: Provider.of<ThemeProvider>(context)
                      .themeData
                      .colorScheme
                      .inversePrimary,
                  height: 18,
                ),
                onPressed: () {
                  _showGridDialog(context);
                },
              ),
              SizedBox(
                width: 20,
              )
            ],
          ),
          Expanded(
            child: filteredHymns.isEmpty
                ? Center(
                    child: Text(
                      'သင်၏ရှာဖွေမှု မတွေ့ရှိပါ😢',
                      style: TextStyle(
                        fontSize: 15,
                        color: Provider.of<ThemeProvider>(context)
                            .themeData
                            .colorScheme
                            .inversePrimary,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredHymns.length,
                    itemBuilder: (context, index) {
                      final hymnKey = filteredHymns.keys.elementAt(index);
                      final hymnValue = filteredHymns[hymnKey]!;
                      final originalIndex =
                          hymns.keys.toList().indexOf(hymnKey) + 1;
                      return _buildPDFViewer(hymnKey, hymnValue, originalIndex);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildPDFViewer(String key, String hymn, int index) {
    return InkWell(
      onTap: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyPdfViewer(
              pdfPath:
                  'asset/images/RP${index.toString().padLeft(2, '0')}-1.jpg',
              number: key,
              hymn: hymn,
              type: "အပြန်အလှန်",
              index: index,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: ListTile(
          leading: Text(
            '$key   -',
            style: TextStyle(
              fontSize: 15,
              color: Provider.of<ThemeProvider>(context)
                  .themeData
                  .colorScheme
                  .inversePrimary,
            ),
          ),
          title: Text(
            hymn,
            style: TextStyle(
              color: Provider.of<ThemeProvider>(context)
                  .themeData
                  .colorScheme
                  .inversePrimary,
            ),
          ),
        ),
      ),
    );
  }
}
