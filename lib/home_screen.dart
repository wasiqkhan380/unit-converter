import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rolling_switch/rolling_switch.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool commonBool = true;
  bool commonBool1 = true;

  final List myProducts = List.generate(
      5,
      (index) => {
            "id": index,
            "name": "wasiq $index",
            "icon": Icons.four_g_plus_mobiledata,
          }).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Unit Converter"),
        actions: const [
          Icon(
            Icons.add_comment,
            size: 30,
          ),
          SizedBox(
            width: 30,
          ),
          Icon(
            Icons.search,
            size: 30,
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.more_vert,
            size: 30,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.orange,
                    ),
                    height: 85,
                    width: 85,
                    child: Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: CircleAvatar(
                        radius: 40.0,
                        child: Image.asset(
                          "assets/temprature.png",
                          scale: 4,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: const [
                        Text(
                          "units",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "72 categories",
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "currently Temprature cooking weight",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.all_inbox_outlined,
                          size: 30,
                          color: Colors.orange,
                        ),
                        Text(
                          "What is New",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.black12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Units View",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    RollingSwitch.icon(
                      onChanged: (bool state) {
                        // print('turned ${(state) ? 'on' : 'off'}');
                      },
                      rollingInfoRight: const RollingIconInfo(
                        icon: Icons.grid_on,
                        text: Text('listview'),
                      ),
                      rollingInfoLeft: const RollingIconInfo(
                        icon: Icons.eighteen_mp_outlined,
                        backgroundColor: Colors.grey,
                        text: Text('gridview'),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              buildColumn(
                context,
                commonBool,
                () {
                  setState(() {
                    commonBool = !commonBool;
                  });
                },
              ),
              buildColumn(
                context,
                commonBool1,
                () {
                  setState(() {
                    commonBool1 = !commonBool1;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column buildColumn(BuildContext context, bool commonBool1, Function() func) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: Image.asset(
                    "assets/measure.png",
                    scale: 8,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text("Common",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            InkWell(
                onTap: func,
                child: commonBool1 == true
                    ? const Icon(
                        Icons.arrow_drop_down_sharp,
                        size: 30,
                      )
                    : const Icon(
                        Icons.arrow_drop_up_sharp,
                        size: 30,
                      ))
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Visibility(
          visible: commonBool1 == true ? true : false,
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: myProducts.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(myProducts[index]["icon"]),
                          Text(myProducts[index]["name"]),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(15)),
                    );
                  }),
            ),
          ),
        ),
      ],
    );
  }
}
