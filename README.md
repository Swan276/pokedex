# pokedex

## POKEDEX DeepLinks
### Testing in Android
adb shell am start -a android.intent.action.VIEW \
  -c android.intent.category.BROWSABLE \
  -d pd://poke.dex/pokemon-scanned/1 \
  am.envise.enviseam

### Testing in IOS
xcrun simctl openurl booted pd://poke.dex/pokemon-scanned/1
search pd://poke.dex/pokemon-scanned/1 in safari