import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/themes/resource.dart';

final class MoviesAppbar extends ConsumerStatefulWidget {
  const MoviesAppbar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MoviesAppbarState();
}

final class _MoviesAppbarState extends ConsumerState<MoviesAppbar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      foregroundColor: Colors.black,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      pinned: true,
      expandedHeight: MediaQuery.sizeOf(context).height * 0.25,

      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 16,
        ),
        background: Image.asset(
          R.ASSETS_IMAGES_SMALL_BANNER_PNG,
          fit: BoxFit.cover,
        ),
        title: SizedBox(
          height: 36,
          child: TextFormField(
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              prefixIconConstraints: const BoxConstraints(),
              prefixIcon: const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Icon(
                  Icons.search,
                  color: Colors.grey,
                  size: 15,
                ),
              ),
              hintText: 'Procurar filme',
              hintStyle: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
