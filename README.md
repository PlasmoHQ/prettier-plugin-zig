<p align="center">
  <a href="https://plasmo.com">
    <img alt="plasmo logo" width="75%" src="https://www.plasmo.com/assets/banner-black-on-white.png" />
  </a>
</p>

<p align="center">
  <a aria-label="License" href="./LICENSE">
    <img alt="See License" src="https://img.shields.io/npm/l/plasmo"/>
  </a>
  <a aria-label="Twitter" href="https://www.twitter.com/plasmohq">
    <img alt="Follow PlasmoHQ on Twitter" src="https://img.shields.io/twitter/follow/plasmohq?logo=twitter"/>
  </a>
  <a aria-label="Twitch Stream" href="https://www.twitch.tv/plasmohq">
    <img alt="Watch our Live DEMO every Friday" src="https://img.shields.io/twitch/status/plasmohq?logo=twitch&logoColor=white"/>
  </a>
  <a aria-label="Discord" href="https://www.plasmo.com/s/d">
    <img alt="Join our Discord for support and chat about our projects" src="https://img.shields.io/discord/946290204443025438?logo=discord&logoColor=white"/>
  </a>
</p>

# Prettier plugin Zig

A prettier plugin for the Zig programming language from [plasmo](https://www.plasmo.com/).

NOTE: This project is currently stalled until the release of Prettier v3, when the plugin system will support async parser/printer, which would enable running a WASM parser.

`zig fmt` seems to do the job already so we will stick to that. Maybe fix the vscode package to use the wasm module instead of invoking zig cli! -> We can certainly do that! Perhaps even inlining the wasm, which will let us use the plugin even in web environment.

A potential approach to fix this issue is to use deasync package, however that sounds like a cumbersome hack for something that people might not want or even care about.

# Support

The [Battle Station](https://www.plasmo.com/s/chat) is open for ambassadors.

# License

[MIT](./LICENSE) ⭐ [Plasmo Corp.](https://plasmo.com)
