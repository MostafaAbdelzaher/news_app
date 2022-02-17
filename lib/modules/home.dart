import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/news_app/cubit/cubit.dart';
import '../../layout/news_app/cubit/states.dart';
import '../shard/components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          List home = NewsCubit.get(context).home;
          List science = NewsCubit.get(context).science;
          List sports = NewsCubit.get(context).sports;
          List business = NewsCubit.get(context).business;
          return ConditionalBuilder(
            condition: home.isNotEmpty,
            builder: (context) => SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 15),
                      child: Text("اخر الأخبار",
                          style: Theme.of(context).textTheme.headline5),
                    ),
                  ),
                  ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) =>
                          buildHomeItem(home[index], context),
                      separatorBuilder: (context, index) => myDivider(),
                      itemCount: home.length),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0, bottom: 10),
                        child: Text(
                          "Science",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Container(
                        height: 200,
                        child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                                itemHomeRow(science[index], context),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  width: 5,
                                ),
                            itemCount: science.length),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: myDivider(),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0, bottom: 10),
                        child: Text(
                          "Sports",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Container(
                        height: 200,
                        child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                                itemHomeRow(sports[index], context),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  width: 5,
                                ),
                            itemCount: sports.length),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: myDivider(),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0, bottom: 10),
                        child: Text(
                          "Business",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Container(
                        height: 200,
                        child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                                itemHomeRow(business[index], context),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  width: 5,
                                ),
                            itemCount: business.length),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: myDivider(),
                  ),
                ],
              ),
            ),
            fallback: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
        });
  }
}
