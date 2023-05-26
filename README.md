# Inject-IPA

Inject dylib into ipa

## Guide

**This tutorial uses WeChat as an example, and other IPAs are similar.**

1. Install `injectipa` on your Mac.

Download [injectipa.pkg](https://github.com/Netskao/MacOS-Utils/raw/main/injectipa.pkg).

2. Modify the theme of Dump `WeChat.ipa`.

```bash
./inject-theme.sh WeChat_8.0.38_dump.ipa
```

3. Inject `MiYou(微信助手)` and `WCPureExtension(微信纯净)`.

```bash
injectipa WeChat_8.0.38_dump-theme.ipa dylibs/{MiYou,WCPureExtension}.dylib -n WeChat
```

## File and Directory Descriptions

- `xiamo`: Third-party WeChat theme called `夏沫`.
- `injectipa`: a dylib command line injection tool provided by [Netskao](https://github.com/Netskao).
- `dylibs`: Dynamic libraries commonly used by WeChat, including `MiYou 3.6-0` and `WCPureExtension 3.4-2`.
- `inject-theme.sh`: Shell script to replace WeChat theme.

## Author

**Inject-IPA** © [Vincent Young](https://github.com/missuo), Released under the [MIT](./LICENSE) License.<br>
