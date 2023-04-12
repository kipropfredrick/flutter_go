// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, duplicate_ignore, sized_box_for_whitespace, sort_child_properties_last

import 'package:finance/data/top.dart';
import 'package:finance/widgets/chart_page.dart';
import 'package:flutter/material.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  List days = ['Day', 'Week', 'Month', 'Year'];
  int index_color = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(children: [
              SizedBox(
                height: 20,
              ),
              // ignore: prefer_const_constructors
              Text(
                "Statistics",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(4, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            index_color = index;
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: index_color == index
                                ? Color.fromARGB(255, 47, 125, 121)
                                : Colors.white,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            days[index],
                            style: TextStyle(
                              color: index_color == index
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 120,
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Expense",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.arrow_downward_sharp,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Chart(),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Spending",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.swap_vert, size: 25, color: Colors.grey),
                  ],
                ),
              )
            ]),
          ),
          SliverList(delegate: SliverChildBuilderDelegate(
            (context, index) {
            return ListTile(
              leading: Image.asset("images/${geter_top()[index].image}",height: 40,),
              title: Text(geter_top()[index].name!,
              style: TextStyle(
                          fontWeight: FontWeight.w600)
              ),
              subtitle: Text(geter_top()[index].time!,
              style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600)
              ),
              trailing: Text("\$ ${geter_top()[index].fee!}",
              style: TextStyle(
                          color: Colors.red,
                          fontSize: 19,
                          fontWeight: FontWeight.w600
                        )
              ),
            );
            
          },
          childCount: geter_top().length,
          ))
        ],
      )),
    );
  }
}
