import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marshather_app/utils/utils.dart';

const String DEFAULT_BACK_BTN_TEXT = 'Back';

PreferredSizeWidget sharedAppBar({
  required BuildContext context,
  VoidCallback? onPressed,
  String? text,
  TextButton? leadingTextButton,
}) =>
    PreferredSize(
      preferredSize: const Size.fromHeight(0),
      child: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Palette.backgroundDarkColor,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        automaticallyImplyLeading: false,
        leadingWidth: MediaQuery.of(context).size.width,
        centerTitle: false,
        elevation: 0,
        leading: Row(
          children: [
            leadingTextButton ??
                Container() /*??
                TextButton.icon(
                  onPressed: onPressed ?? () => Navigator.of(context).pop(),
                  icon: const Icon(
                    Icons.arrow_back_ios_new_outlined,
                    size: 16,
                    color: Colors.white,
                  ),
                  label: Text(
                    text ?? DEFAULT_BACK_BTN_TEXT,
                    maxLines: 2,
                    style: GoogleFonts.montserrat(
                      fontSize: 16.sp,
                      color: Colors.white,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                  ),
                ),*/
          ],
        ),
        backgroundColor: Colors.transparent,
      ),
    );
