import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:imdb/views/common_widgets/custom_circulars_progress.dart';
import 'package:octo_image/octo_image.dart';

class NetworkImageDisplay extends StatefulWidget {
  final String url;
  final BoxFit? fit;
  const NetworkImageDisplay(this.url, {Key? key, this.fit}) : super(key: key);

  @override
  State<NetworkImageDisplay> createState() => _NetworkImageDisplayState();
}

class _NetworkImageDisplayState extends State<NetworkImageDisplay> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    precacheImage(NetworkImage(widget.url), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return buildOcto();
  }

  Widget buildOcto() {
    return OctoImage(
      image: CachedNetworkImageProvider(widget.url),
      errorBuilder: (context, url, error) => buildError(),
      fit: BoxFit.cover,
      width: double.infinity,
      placeholderBuilder: (context) =>
          const Center(child: CustomCircularProgress()),
    );
  }

  SizedBox buildError() {
    return SizedBox(
      width: double.infinity,
      child: Icon(Icons.warning_amber_rounded,
          size: 30, color: Theme.of(context).focusColor),
    );
  }
}
