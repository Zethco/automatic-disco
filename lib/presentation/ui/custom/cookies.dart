import 'package:flutter/material.dart';
import '../../../data/preferences/preferences.dart';
import '../../../devices/platform/abstract/platform_info.dart';
import '../../../di/di_init.dart';
import '../../resources/locale/generated/l10n.dart';
import '../../resources/resources.dart';

class Cookies extends StatefulWidget {
  final Widget child;
  final Widget? cookiesChild;
  final Alignment alignment;

  const Cookies({
    super.key,
    required this.child,
    this.cookiesChild,
    this.alignment = Alignment.bottomCenter,
  });

  @override
  State<StatefulWidget> createState() => _CookiesState();
}

class _CookiesState extends State<Cookies> {
  PlatformInfo get _platformInfo => getIt();

  Preferences get _preferences => getIt();
  bool _needsCookies = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _needsCookies = !_preferences.getCookiesAllowed();
    });
  }

  void _confirmCookies() {
    _preferences.setCookiesAllowed(true);
    setState(() {
      _needsCookies = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _platformInfo.isWeb && _needsCookies
        ? Stack(
            children: [
              widget.child,
              Align(
                alignment: widget.alignment,
                child: widget.cookiesChild ??
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width,
                      ),
                      child: Card(
                        child: Container(
                          padding: EdgeInsets.all(spacing.s),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                S.of(context).cookiesTitle,
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              SizedBox(height: spacing.s),
                              SelectableText(
                                S.of(context).cookiesBody,
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              SizedBox(height: spacing.s),
                              Align(
                                alignment: Alignment.centerRight,
                                child: ElevatedButton(
                                  onPressed: () => _confirmCookies(),
                                  child: Text(S.of(context).cookiesAcceptCTA),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
              ),
            ],
          )
        : widget.child;
  }
}
