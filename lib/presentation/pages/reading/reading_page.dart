import 'package:flutter/material.dart';

import 'package:app_ui/app_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:lisa_app/common/domain/providers/providers.dart';
import 'package:lisa_app/common/domain/models/book/single_book.dart';
import 'package:lisa_app/common/domain/state/book/single_book_list_state.dart';

import 'package:lisa_app/common/routes/router_utils.dart';
import 'package:lisa_app/presentation/widgets/book/book_card.dart';
import 'package:lisa_app/presentation/widgets/book/book_sliver_app_bar.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';

class ReadingPage extends StatelessWidget {
  const ReadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: 188.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              titlePadding: const EdgeInsets.only(top: 10),
              title: Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(
                      top: size.height * .12,
                      left: size.width * .1,
                      right: size.width * .02),
                  height: size.height * .48,
                  decoration: const BoxDecoration(
                    color: ColorTheme.orangeLightColor,
                    // image: DecorationImage(
                    //   image: AssetImage(Images.bg),
                    //   fit: BoxFit.fitWidth,
                    // ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BookSliverAppBar(
                        size: size,
                        title: 'My reading list &',
                        subtitle: 'Blabla',
                      ),
                    ],
                  )),
            ),
          ),
          const _ReadingList(),
        ]);
  }
}

class _ReadingList extends ConsumerWidget {
  const _ReadingList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<SingleBook> singleBooks = ref.watch(readingListProvider);

    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(
              top: 24.0,
            ),
            child: FilterRadioButton(),
          ),
          ref.watch<SingleBookListState>(readingListNotifierProvider).maybeMap(
                orElse: () => const SizedBox.shrink(),
                empty: (_) => SizedBox(
                  height: MediaQuery.of(context).size.height -
                      AppBar().preferredSize.height -
                      kBottomNavigationBarHeight -
                      kToolbarHeight,
                  child: const Padding(
                    padding: EdgeInsets.all(58.0),
                    child: Center(
                      child: Text(
                        "You haven't added anything to reading list",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                ),
                loaded: (_) => BookList(
                  singlebooks: singleBooks,
                ),
              ),
        ],
      ),
    );
  }
}

class BookList extends StatelessWidget {
  const BookList({
    super.key,
    required this.singlebooks,
  });
  final List<SingleBook> singlebooks;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListView.separated(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(20),
            itemCount: singlebooks.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 20);
            },
            itemBuilder: (BuildContext context, int index) {
              final SingleBook item = singlebooks[index];
              return _BookListCard(
                item: item,
                pressRead: () => context.go(
                  '${AppPage.reading.routePath}/${item.id}',
                  extra: item,
                ),
              );
            }),
        const Gap(50),
      ],
    );
  }
}

class _BookListCard extends StatelessWidget {
  const _BookListCard({
    required this.item,
    required this.pressRead,
  });
  final SingleBook item;
  final Function() pressRead;

  @override
  Widget build(BuildContext context) {
    return BookCard(
      title: item.volumeInfo!.title,
      auth: item.volumeInfo!.authors.first,
      image: '${item.volumeInfo?.imageLinks?.medium}',
      pressRead: pressRead,
      isStarted: item.status,
      numberOfPageRead: item.numberOfPageRead,
      percentage:
          '${(item.numberOfPageRead / item.volumeInfo!.pageCount * 100).toStringAsFixed(2)} %',
    );
  }
}

class FilterRadioButton extends ConsumerWidget {
  const FilterRadioButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomRadioButton(
        padding: 6,
        enableShape: true,
        buttonValues: getListOfFilters(),
        buttonLables: getListOfFilters(),
        defaultSelected: getListOfFilters()[0],
        radioButtonValue: (String value) {
          if (value == FilterBooks.pending.getFiltersBooks())
            ref.read(filterProvider.notifier).state = FilterBooks.pending;
          else if (value == FilterBooks.inProgress.getFiltersBooks())
            ref.read(filterProvider.notifier).state = FilterBooks.inProgress;
          else
            ref.read(filterProvider.notifier).state = FilterBooks.isFinished;
        },
        elevation: 0,
        autoWidth: true,
        selectedBorderColor: Colors.transparent,
        unSelectedBorderColor: Colors.transparent,
        selectedColor: ColorTheme.mainGreenColor,
        unSelectedColor: ColorTheme.orangeLightColor);
  }
}
