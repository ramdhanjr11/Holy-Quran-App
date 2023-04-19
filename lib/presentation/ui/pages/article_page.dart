import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holy_quran_app/presentation/ui/widgets/article_page_widgets/article_appbar_widget.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({super.key});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const ArticleAppbar(),
        ],
        body: ListView.builder(
          padding: const EdgeInsets.all(0),
          itemBuilder: (context, index) {
            return _buildArticleTile(context);
          },
          itemCount: 10,
        ),
      ),
    );
  }

  _buildArticleTile(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: SizedBox(
        height: 120.h,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Image.network(
                'https://images.unsplash.com/photo-1681282894486-9d7e6416c5ca?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.schedule,
                          size: 13,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          'Desember 8, 2022',
                          style: textTheme.bodySmall,
                        ),
                      ],
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      'Faedah Sirah Nabi: Perang Badar Kubra dan Pelajaran di Dalamnya',
                      style: textTheme.bodyLarge,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
