import {
  writeToProfile, importJson,
  // rule and layers
  rule, layer, simlayer, hyperLayer, modifierLayer, duoLayer,
  // from / map()
  map, mapConsumerKey, mapPointingButton, mapSimultaneous, mapDoubleTap, mouseMotionToScroll, singleTap,
  // to
  toKey, toConsumerKey, toPointingButton, toHyper, toSuperHyper, toMeh, to$, toApp, toPaste, toTypeSequence, toNone, toNotificationMessage, toRemoveNotificationMessage, toInputSource, toSetVar, toUnsetVar, toMouseKey, toMouseCursorPosition, toStickyModifier, toCgEventDoubleClick, toSleepSystem,
  // conditions
  ifApp, ifDevice, ifVar, ifDeviceExists, ifInputSource, ifKeyboardType, ifEventChanged,
  // utils
  withCondition, withMapper, withModifier, modifierKeyAliases, multiModifierAliases, LetterKeyCode, KeyAlias, ModifierKeyAlias, MultiModifierAlias
} from 'karabiner.ts'

import { homedir } from 'node:os'
import { resolve } from 'node:path'

// ! Change '--dry-run' to your Karabiner-Elements Profile name.
// (--dry-run print the config json into console)
// + Create a new profile if needed.
writeToProfile('x', [
  // Imported shared rules
  //importJson(
    //resolve(
      //homedir(),
      //'.config/karabiner/assets/complex_modifications/1735190359.json',
      //'.dotfiles/karabiner-config/src/my-rules.json',
    //),
  //),
  // Local JSON file
  importJson(resolve(__dirname, './my-rules.json')),

   //It is not required, but recommended to put symbol alias to layers,
  // (If you type fast, use simlayer instead, see https://evan-liu.github.io/karabiner.ts/rules/simlayer)
  // to make it easier to write '←' instead of 'left_arrow'.
  // Supported alias: http://github.com/evan-liu/karabiner.ts/blob/main/src/utils/key-alias.ts
  layer('/', 'symbol-mode').manipulators([
    //     / + [ 1    2    3    4    5 ] =>
    withMapper(['⌘', '⌥', '⌃', '⇧', '⇪', '↖', '↘'])((k, i) =>
      map((i + 1) as NumberKeyValue).toPaste(k),
    ),
    withMapper(['←', '→', '↑', '↓', '␣', '⏎', '⇥', '⎋', '⌫', '⌦', '⇪'])((k) =>
      map(k).toPaste(k),
    ),
  ]),
  layer('/', 'emoji').manipulators({
    l: toPaste('😂'), // joy
    t: toPaste('😊🙏') // thanks
  }),

  duoLayer('j', 'k', 'launch-app').manipulators({
    c: toApp('Calendar'),
    f: to$('open ~/Downloads'),
    o: toApp('Obsidian'),
    s: to$("osascript -e 'tell application \"Safari\" to make new document'"),
    t: toApp('Ghostty'),
    z: toApp('Zed'),
    p: toApp('Microsoft Powerpoint'),
    w: toApp('WhatsApp'),

  }),

//  rule('Caps Lock → Hyper').manipulators([
//    map('caps_lock').toHyper().toIfAlone('caps_lock'),
//  ]),

  rule('Safari: Press Cmd+Shift+1 to run moveSafariTabToFirst.scpt', ifApp('Safari')).manipulators([
    map('1', '⇧', '⌘').to$('osascript /Users/edmundsitumorang/.dotfiles/Scripts/moveSafariTabToFirst.scpt')    
  ]),

  rule('Safari: Map ⌘+,/. → back/fwd | ⌘+m → left tab', ifApp('Safari')).manipulators([
      map(',', {left: '⌘⌥⌃⇧'}).to('←', 'l⌘'),
      map('.', {left: '⌘⌥⌃⇧'}).to('→', 'l⌘'),
      map('m', {left: '⌘⌥⌃⇧'}).to('←', 'l⌘⌥'),
      map('/', {left: '⌘⌥⌃⇧'}).to('→', 'l⌘⌥'),
      map('n', {left: '⌘⌥⌃⇧'}).to('n', 'l⌘'),
      map('b', {left: '⌘⌥⌃⇧'}).to('w', 'l⌘'),
  ]),

  rule('Hyper: Right_Command → Hyper | Alone: Escape').manipulators([
    map('right_command').toHyper()
      .toIfAlone('⎋').parameters({ 'basic.to_if_alone_timeout_milliseconds': 500 }), ]),
 
  rule('OSX: Shift + Backspace → Forward Delete').manipulators([
    map('⌫', 'right_shift').to('⌫', 'fn'),
  ]),

  rule('OSX: fn + esc → Lock Screen').manipulators([
    map('⎋', 'fn').to('q', 'l⌘⌃'),
  ]),

  rule('OSX: alt + esc → Aerospace enable toggle').manipulators([
    map('⎋', '⌥').to$('/opt/homebrew/bin/aerospace enable toggle'),
  ]),

  //rule('OSX: DoubleTaps').manipulators([
  //  mapDoubleTap('l⇧', '', 'any').to('⇪')
      //.singleTap(toKey('⎋'))
      //.toIfHeldDown("l⇧")
      //.parameters({
      //  "basic.to_delayed_action_delay_milliseconds": 250,
      //  "basic.to_if_alone_timeout_milliseconds": 250,
      //  "basic.to_if_held_down_threshold_milliseconds": 250
      //})
  //]),
  rule('OSX: DoubleTap COMMANDS').manipulators([
    // mapDoubleTap('↑').to('↖︎'),
    // mapDoubleTap('↓').to('end'),
    // mapDoubleTap('⇪').to('⎋')
    // mapDoubleTap('r⌥').to$('/opt/homebrew/bin/sketchybar --reload'),
    //mapDoubleTap('l⇧').to('⇪').singleTap(toKey('l⇧'))
    mapDoubleTap("right_shift").to("caps_lock").toIfHeldDown("right_shift")

  ]),

  rule('Hyper: ⌃⇧⌥⌘ + h/j/k/l | i/o → ←↓↑→ | pgup/pgdn').manipulators([
    map('h', 'Hyper').to('←'),
    map('j', 'Hyper').to('↓'),
    map('k', 'Hyper').to('↑'),
    map('l', 'Hyper').to('→'),
    map('i', {left: '⌘⌥⌃⇧'}).to('↑', 'fn'), 
    map('o', {left: '⌘⌥⌃⇧'}).to('↓', 'fn'),
    map('u', {left: '⌘⌥⌃⇧'}).to('home'),
    map('p', {left: '⌘⌥⌃⇧'}).to('end'),
    map('⏎', {left: '⌘⌥⌃⇧'}).to('escape'),
    map('g', {left: '⌘⌥⌃⇧'}).to('←', '⌘'),
    map(';', {left: '⌘⌥⌃⇧'}).to('→', '⌘'),
  ]),

  // Open apps via shortcut hyper+o keys
  //hyperLayer('o')
  //  .description('Open Apps')
  //  .leaderMode({ sticky: true })
  //  .notification('Open apps:\nb(browser - Firefox), c(chat - MS Teams), e(editor - VS Code),\nf(file explorer - Finder), t(terminal - Ghostty), m(mail - MS Outlook),\n","(System Settings)')
  //  .manipulators({
  //    // browser (+ b)
  //    b: toApp('Firefox'),
  //    // chat app (+ c)
  //    c: toApp('Microsoft Teams'),
  //    // code editor (+ e)
  //    e: toApp('Visual Studio Code'),
  //    // file explorer / finder (+ f)
  //    f: toApp('Finder'),
  //    // terminal (+ t)
  //    t: toApp('Ghostty'),
  //    // mail app (+ m)
  //    m: toApp('Microsoft Outlook'),
  //    // System settings (+ ,)
  //    ',': toApp('System Settings'),
  //  }),
  //
  //  hyperLayer('s', 'system').manipulators({
  //  l: toKey('q', '⌘⌃'), // Lock screens
  //}),
  //
  hyperLayer('\'', 'program')
    .leaderMode()
    .notification('Open apps:\nb(browser - Firefox), c(chat - MS Teams), e(editor - VS Code),\nf(file explorer - Finder), t(terminal - Ghostty), m(mail - MS Outlook),\n","(System Settings)')
    .manipulators({
      
      ',': toApp('System Settings')
    
  }),

])
