import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingWidget extends StatelessWidget {
  const ShimmerLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: 8, // Number of shimmer items
          itemBuilder: (context, index) {
            return const Card(
              elevation: 10,
              margin: EdgeInsets.all(8),
            );
          },
        ));
  }
}

//TODO:
class ShimmerCartLoading extends StatelessWidget {
  const ShimmerCartLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListView.builder(
        itemCount: 10, // Number of shimmer loading items
        itemBuilder: (context, index) {
          return ListTile(
            title: Container(
              width: 100.0,
              height: 20.0,
              color: Colors.white,
            ),
            subtitle: Container(
              width: 200.0,
              height: 16.0,
              color: Colors.white,
            ),
          );
        },
      ),
    );
  }
}

class ShimmerDescription extends StatelessWidget {
  const ShimmerDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Shimmer effect for an image
        const ShimmerImage(),

        // Other content in the description page
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 200,
                  height: 20,
                  color: Colors.white, // Shimmer effect for title
                ),
                const SizedBox(height: 16),
                Container(
                  width: 300,
                  height: 12,
                  color: Colors.white, // Shimmer effect for description
                ),
                const SizedBox(height: 16),
                Container(
                  width: 250,
                  height: 12,
                  color: Colors.white, // Shimmer effect for additional content
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ShimmerImage extends StatelessWidget {
  const ShimmerImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Center(
        child: Container(
          width: 300,
          height: 500,
          margin: const EdgeInsets.all(16.0),
          color: Colors.white,
        ),
      ),
    );
  }
}
