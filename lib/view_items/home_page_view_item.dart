import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:library_app/utils/extension.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../constant/dimens.dart';
import '../constant/strings.dart';
import '../data/vos/home_screen_api_vos/books_vo/books_vo.dart';
import '../data/vos/home_screen_api_vos/lists_vo/lists_vo.dart';
import '../pages/details_page.dart';
import '../widgets/easy_Text_widget.dart';

class BooksSessionItemView extends StatelessWidget {
  const BooksSessionItemView({super.key, required this.listsList});

  final List<ListsVO> listsList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: kBookShelfHeight570x,
        child: ListView.separated(
          itemCount: listsList.length,
          separatorBuilder: (BuildContext context, int index) => Container(
            height: kSP10x,
          ),
          itemBuilder: (BuildContext context, int index) => SizedBox(
            height: kOneShelfHeight360x,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: kSP10x),
                  height: kTitleHeight50x,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      EasyTextWidget(
                        text: listsList[index].listName ?? '',
                        fontWeight: kFontWeightBold,
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: kIconSize15x,
                      )
                    ],
                  ),
                ),
                BookImageView(
                  booksList: listsList[index].books ?? [],
                  listTitle: listsList[index].listName ?? '',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BookImageView extends StatefulWidget {
  const BookImageView(
      {super.key, required this.booksList, required this.listTitle});

  final List<BooksVO> booksList;
  final String listTitle;

  @override
  State<BookImageView> createState() => _BookImageViewState();
}

class _BookImageViewState extends State<BookImageView> {
  @override
  Widget build(BuildContext context) {
    return (widget.booksList.isEmpty)
        ? const Center(child: CircularProgressIndicator())
        : SizedBox(
            height: kBookImageItemViewHeight300x,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                      padding: const EdgeInsets.only(left: kSP10x),
                      width: kBookImageItemViewWidth150x,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: kImageHeight240x,
                            child: Stack(children: [
                              GestureDetector(
                                onTap: () {
                                  context.navigateToNextScreen(
                                      context,
                                      DetailsPage(
                                        booksVO: widget.booksList[index],
                                      ));
                                  // var temp=booksList[index];
                                  // _bannerBooks.insert(0, temp);
                                },
                                onLongPress: () {
                                  showMaterialModalBottomSheet(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(20))),
                                      context: context,
                                      builder: (context) =>
                                          SingleChildScrollView(
                                              controller:
                                                  ModalScrollController.of(
                                                      context),
                                              child: Column(
                                                children: [
                                                  ListTile(
                                                    onTap: () {},
                                                    leading: CachedNetworkImage(
                                                      width: 30,
                                                      height: 50,
                                                      imageUrl: widget
                                                              .booksList[index]
                                                              .bookImage ??
                                                          kDefaultImageLink,
                                                      imageBuilder: (context,
                                                              imageProvider) =>
                                                          Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          image:
                                                              DecorationImage(
                                                            image:
                                                                imageProvider,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      placeholder: (context,
                                                              url) =>
                                                          const Center(
                                                              child:
                                                                  CircularProgressIndicator()),
                                                    ),
                                                    title: Text(widget
                                                            .booksList[index]
                                                            .title ??
                                                        "Book Title"),
                                                    subtitle:
                                                        const EasyTextWidget(
                                                      text: 'E-book',
                                                    ),
                                                  ),
                                                  const Divider(
                                                    color: Colors
                                                        .grey, //color of divider
                                                    height:
                                                        5, //height spacing of divider
                                                    thickness:
                                                        1, //thickness of divier line
                                                    indent:
                                                        10, //spacing at the start of divider
                                                    endIndent:
                                                        10, //spacing at the end of divider
                                                  ),
                                                  ListTile(
                                                    onTap: () {},
                                                    leading: const Icon(
                                                        Icons.remove),
                                                    title: const Text(
                                                        "Remove download"),
                                                  ),
                                                  ListTile(
                                                    onTap: () {},
                                                    leading: const Icon(
                                                        Icons.delete),
                                                    title: const Text(
                                                        "Delete from library"),
                                                  ),
                                                  ListTile(
                                                    onTap: () {},
                                                    leading:
                                                        const Icon(Icons.add),
                                                    title: const Text(
                                                        "Add to shelf"),
                                                  ),
                                                ],
                                              )));
                                },
                                child: CachedNetworkImage(
                                  imageUrl: widget.booksList[index].bookImage ??
                                      kDefaultImageLink,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator()),
                                ),
                              ),
                              Align(
                                  alignment: Alignment.topRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      var temp = widget.booksList[index];

                                      temp.isSelected = !temp.isSelected!;

                                      setState(() {});
                                    },
                                    child: Icon(
                                      Icons.favorite,
                                      size: 40,
                                      shadows: const [
                                        Shadow(color: Colors.black45)
                                      ],
                                      color:
                                          (widget.booksList[index].isSelected ??
                                                  false)
                                              ? Colors.red
                                              : Colors.grey,
                                    ),
                                  ))
                            ]),
                          ),
                          kSBoxH10,
                          SizedBox(
                            height: kTitleHeight50x,
                            child: Text(widget.booksList[index].title ?? ''),
                          )
                        ],
                      ),
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      width: kSP5x,
                    ),
                itemCount: widget.booksList.length),
          );
  }
}
