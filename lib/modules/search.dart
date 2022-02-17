import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
import '../layout/news_app/cubit/cubit.dart';
import '../shard/components.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var searchController = TextEditingController();
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: defaultTextField(
                  type: TextInputType.text,
                  control: searchController,
                  label: "search",
                  prefix: Icons.search,
                  onchange: (value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'search must not empty';
                    }
                    return null;
                  },
                ),
              ),
              Expanded(child: conditional(list, context)),
            ],
          ),
        );
      },
    );
  }
}
