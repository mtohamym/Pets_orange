import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petology_test/bloc/category_select/category_cubit.dart';
import 'package:petology_test/bloc/category_select/category_states.dart';
import 'package:petology_test/data/models/category.dart';
import 'package:petology_test/wedgits/custom_radio.dart';

class CategorySelect extends StatelessWidget {
  const CategorySelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        lazy: false,
        create: (BuildContext context) => CategorySelectCubit()..setProfiles(),
        child: BlocConsumer<CategorySelectCubit, CategorySelectStatus>(
            listener: (BuildContext context, state) {},
            builder: (BuildContext context, Object? state) {
              CategorySelectCubit myCubit = CategorySelectCubit.get(context);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  Stack(
                    children: [
                      Positioned(
                        right: 50,
                        child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Image.asset("doghand.png")),
                      ),
                      Text(
                        "Lets get this right ....",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  Text(
                    "What kind of friend you looking for?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  SizedBox(height: 50),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                          child: SizedBox(
                            height: 10,
                          ),
                        ),
                        selectionCard(0, myCubit),
                        const SizedBox(
                          width: 33,
                        ),
                        selectionCard(1, myCubit),
                      ],
                    ),
                  ),
                ],
              );
            }));
  }

  Widget selectionCard(int index, CategorySelectCubit myCubit) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {},
      onHover: (value) {
        myCubit.setHoverFor(index, value);
      },
      child: SizedBox(
          width: 180,
          height: 200,
          child: CustomRadio(
              myCubit.profiles[index],
              myCubit.profiles[index].isSelected
                  ? Color.fromRGBO(255, 227, 197, 1)
                  : Colors.white)),
    );
  }
}

/*


;

 */