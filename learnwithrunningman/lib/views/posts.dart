import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:url_launcher/url_launcher.dart';

class Post {
  final String title;
  final List<String> caption;
  final List<String> images;
  final String? url;

  Post({
    required this.title,
    required this.caption,
    required this.images,
    this.url,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['title'] as String,
      caption: json['caption'] is List
          ? List<String>.from(json['caption'])
          : [json['caption'] as String],  // Wrap the single string in a list
      images: List<String>.from(json['images']),
      url: json['url'] as String?,
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
  void dispose() {
    super.dispose();
    _posts.clear();
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
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _postHeader(post.title),
                    _imageCarousel(post.images, post.title, post.caption),
                    ElevatedButton(
                        onPressed: () {
                          _launchURL(post.url ?? '');
                        },
                        child: const Text("TO THE URL")),
                  ],
                ),
              );
            } else {
              return const SizedBox();
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
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.article,
            color: Colors.white,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageCarousel(List<String> images, String title, List<String> caption) {
  int currentIndex = 0;
  return StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) {
      return Column(
        children: [
          Stack(
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
                    height: MediaQuery.of(context).size.height * 0.3,
                    color: Colors.grey, // Grey background for blank areas
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.contain, // Prevent cropping, show full image
                    ),
                  );
                }).toList(),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.black54,
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
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: PageView.builder(
              itemCount: caption.length,
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(12), // Padding for better readability
                  child: SingleChildScrollView( // Allows scrolling for longer content
                    child: Text(
                      caption[currentIndex].replaceAll(r'\n', '\n'), // Convert JSON \n into actual line breaks
                      style: const TextStyle(
                        fontSize: 14,  // Increased readability
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.left, // Aligning text to the left for better language display
                    ),
                  ),
                );
              },
            ),
          )
        ],
      );
    },
  );
}
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}
