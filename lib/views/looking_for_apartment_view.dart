import 'package:bunkie/services/navigation_service.dart';
import 'package:bunkie/utils/constants.dart';
import 'package:bunkie/utils/locator.dart';
import 'package:bunkie/views/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:bunkie/utils/utils.dart';

class LookingForApartmentView extends StatelessWidget {
  const LookingForApartmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      onWillPop: () => Navigator.pop(context),
      builder: (context, size) {
        return Scaffold(
            body: Container(
          child: Column(children: [
            CustomSpacer(
              flex: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 35.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey)),
                        child: Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.grey,
                          size: 30,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        locator<NavigationService>()
                            .pushNamed('Not Implemented');
                      },
                      child: Text('Next',
                          style: TextStyle(
                              color: Color(0xff027A63), fontSize: 24.sp)),
                    ),
                  ]),
            ),
            CustomSpacer(
              flex: 4,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: 'Hello ',
                  style: TextStyle(color: Colors.grey, fontSize: 28.sp),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'James😃',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                  ]),
            ),
            Divider(
              color: Color(0xff027A63),
              thickness: 0.4,
            ),
            Expanded(
              child: Container(
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: AddPhotosColumn(
                            description:
                                'Add at least two pictures of the Apartment (Maximum of 5)',
                            imageUrl:
                                "https://www.we-heart.com/upload-images/sunshadowapartmentbarcelona1@2x.jpg",
                            imageUrl2:
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR91F3r2nNftlxZKzf4w4ypBPVPvmRPd7oA98Yw1ZOm9sibtONVwy7fwC2P1oYXLzjHoVI&usqp=CAU",
                          ),
                        ),
                        Divider(
                          color: Color(0xff027A63),
                          thickness: 0.4,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: AddPhotosColumn(
                            description:
                                'Add at least two pictures of you (Maximum of 5)',
                            imageUrl:
                                "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=333&q=80",
                            imageUrl2:
                                "https://images.unsplash.com/photo-1604426633861-11b2faead63c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8aHVtYW58ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                          ),
                        ),
                        Divider(
                          color: Color(0xff027A63),
                          thickness: 0.4,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomSpacer(
                                  flex: 1,
                                ),
                                RichText(
                                  textAlign: TextAlign.start,
                                  text: TextSpan(
                                      text: 'Address ',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 16.sp),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text:
                                                '(Address will be visible to verified users only if you wish)',
                                            style: TextStyle(
                                                color: Colors.redAccent,
                                                fontSize: 10.sp)),
                                      ]),
                                ),
                                CustomTextField(maxLines: 4),
                                CustomSpacer(
                                  flex: 3,
                                ),
                                Text(
                                  'Apartment Style',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 16.sp),
                                ),
                                CustomTextField(
                                  suffixIcon: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.arrow_drop_down),
                                      color: Colors.black),
                                ),
                                CustomSpacer(
                                  flex: 3,
                                ),
                                Text(
                                  'Price',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 16.sp),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Expanded(child: CustomTextField()),
                                      CustomSpacer(
                                        horizontal: true,
                                        flex: 4,
                                      ),
                                      Expanded(
                                          child: CustomTextField(
                                        suffixIcon: IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.arrow_drop_down),
                                            color: Colors.black),
                                      )),
                                    ],
                                  ),
                                ),
                                CustomSpacer(
                                  flex: 3,
                                ),
                                Text(
                                  'Available for move in from:',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 16.sp),
                                ),
                                SizedBox(
                                  width: 220.w,
                                  child: CustomTextField(
                                    suffixIcon: IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.arrow_drop_down),
                                        color: Colors.black),
                                  ),
                                ),
                                CustomSpacer(
                                  flex: 8,
                                )
                              ]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ]),
        ));
      },
    );
  }
}
