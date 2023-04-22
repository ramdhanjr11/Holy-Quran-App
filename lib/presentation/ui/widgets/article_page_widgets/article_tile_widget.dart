import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holy_quran_app/domain/entities/article.dart';
import 'package:holy_quran_app/presentation/ui/pages/article_detail_page.dart';

class ArticleTile extends StatelessWidget {
  final Article article;

  const ArticleTile({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleDetailPage(urlArticle: article.url),
          ),
        ),
        child: SizedBox(
          height: 120.h,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Image.network(
                  article.thumbnail,
                  fit: BoxFit.fill,
                  height: double.infinity,
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
                            article.date,
                            style: textTheme.bodySmall,
                          ),
                        ],
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        article.title,
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
      ),
    );
  }
}
