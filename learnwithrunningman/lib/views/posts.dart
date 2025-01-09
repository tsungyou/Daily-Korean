import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:url_launcher/url_launcher.dart';

class Post {
  final String? title;
  final String? caption;
  final List<String> images;
  final String? url;

  Post({
    this.title,
    this.caption,
    required this.images,
    this.url,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['title'] as String?,
      caption: json['caption'] as String?,
      images: List<String>.from(json['images']),
    );
  }
}

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  List<dynamic> _posts = [];
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  Future<void> _fetchPosts() async {
    final String jsonString = await rootBundle.loadString("assets/data/post.json");
    final Map<String, dynamic> data = jsonDecode(jsonString);
    setState(() {
      _posts = data.entries
          .map((entry) => Post.fromJson(entry.value))
          .toList();
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _fetchPosts,
              child: ListView.builder(
                itemCount: _posts.length,
                itemBuilder: (context, index) {
                  final post = _posts[index];
                  if (post is Post) {
                    return Card(
                      margin: const EdgeInsets.symmetric(
                        vertical: 4.0,
                        horizontal: 0.0,
                      ),
                      elevation: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (post.title != null) _postHeader(post.title!),
                          _imageCarousel(post.images),
                          if (post.title != null && post.caption != null)
                            _titleAndCaps(post.title!, post.caption!),
                          ElevatedButton(onPressed: (){_launchURL(post.url);}, child: const Text("TO THE URL")),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
    );
  }

  Widget _postHeader(String title) {
return Container(
    padding: const EdgeInsets.all(12.0),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 196, 208, 229), // Background color added
      borderRadius: BorderRadius.circular(10.0), // Rounded corners for style
    ),
    child: Row(
      children: [
        const Icon(
          Icons.article, // Added an icon for style
          color: Colors.white,
        ),
        const SizedBox(width: 8),
        Expanded( // Expanded to ensure text doesn't overflow
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white, // Adjusted text color for visibility
            ),
            overflow: TextOverflow.ellipsis, // Prevents overflow issues
          ),
        ),
      ],
    ),
  );
}

  Widget _imageCarousel(List<String> images) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        int currentIndex = 0;
        return Stack(
          alignment: Alignment.bottomRight,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1,
                viewportFraction: 1,
                enableInfiniteScroll: false,
                enlargeCenterPage: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
              items: images.map((imageUrl) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imageUrl),
                      fit: BoxFit.contain, // Ensures image covers entire area
                    ),
                  ),
                );
              }).toList(),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '${currentIndex + 1}/${images.length}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _titleAndCaps(String title, String caps) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 8.0,
      ),
      child: RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: [
            TextSpan(
              text: title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: ' $caps'),
          ],
        ),
      ),
    );
  }
    void _launchURL(StringUrl) async {
    final Uri url = Uri.parse(
      StringUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}