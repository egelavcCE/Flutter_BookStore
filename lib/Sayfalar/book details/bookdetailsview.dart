import 'package:bookstore_flutter/Components/button.dart';
import 'package:bookstore_flutter/Components/padding.dart';
import 'package:bookstore_flutter/contents_model.dart';
import 'package:bookstore_flutter/project_dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bookdetails_viewmodel.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({
    super.key,
    required this.content,
    required this.token,
  });
  final ContentModel content;
  final String token;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends BookDetailsViewModel with ProjectDioMixin {
  late final ContentModel content;

  @override
  void initState() {
    content = widget.content;
    // _liked = _isLiked();
    super.initState();
  }

  bool _isPressed = false;

  void iconButton({required int productId}) {
    setState(() {
      _isPressed = !_isPressed;

      if (_isPressed) {
        like(productId: productId);
      } else {
        unlike(productId: productId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios)),
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: Center(
                child: Text('Book Details',
                    maxLines: 8,
                    style: Theme.of(context).textTheme.headlineLarge)),
          )
        ],
      ),
      body: Padding(
        padding: BookDetailsPadding().bookDetailsPadding,
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Center(
                        child: Image.network(
                          content.cover ?? "",
                          width: 150.w,
                          height: 225.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: CircleAvatar(
                          backgroundColor: Color(0xffF4F4FF),
                          child: IconButton(
                            icon: _isPressed
                                ? Icon(Icons.favorite)
                                : Icon(Icons.favorite_border),
                            color: _isPressed ? Colors.red : Color(0xff6251DD),
                            onPressed: () {
                              iconButton(productId: content.id!);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(content.name ?? "",
                    style: Theme.of(context).textTheme.headlineLarge),
                Text(content.author ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: Color(0xff090937).withOpacity(0.6))),
              ],
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 35.h),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Summary',
                        style: Theme.of(context).textTheme.headlineLarge),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Text(content.description ?? "",
                        maxLines: 8,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleMedium),
                  )
                ],
              ),
            ),
            const Spacer(),
            GButton(
                onPressed: () {},
                buttonText: content.price.toString() ?? "",
                secondText: 'Buy Now'),
          ],
        ),
      ),
    );
  }
}
