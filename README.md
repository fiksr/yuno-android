# YU-NO: A Girl Who Chants Love at the Bound of this World — Native Android Port

A high-performance, native Android port of the classic visual novel **YU-NO: A Girl Who Chants Love at the Bound of this World** (*この世の果てで恋を唄う少女YU-NO*), supporting the **2011 TLWiki English Translation** and **Sega Saturn Japanese Voice Patch**.

Powered by [`ai5-sdl2`](https://github.com/nunuhara/ai5-sdl2) and SDL2, modernized with native touch gestures, widescreen aspect-ratio auto-scaling, low-latency audio routing, and in-game Saturn voice controls.

---

## Features

- **Native C/C++ Performance:** Built directly on top of SDL2 and native Android NDK for high frame rates and battery efficiency without heavy emulation layers.
- **English Translation Ready:** Built-in support for the 2011 TLWiki English script (`zMES.ARC`).
- **Saturn Voice Patch Integration:**
  - Automatic playback of Saturn voice clips (`VOICE_A`, `VOICE_B`, `VOICE_C`) in `.ogg` or `.wav`.
  - Independent dialogue audio channel (`AUDIO_CH_VOICE0`) so sound effects never truncate voice lines.
  - Auto-halts audio playback when dialogue advances.
- **In-Game Voice Toggle:**
  - Toggle voice acting on/off at any time using a **3-finger tap** or **top edge tap**.
  - On-screen toast notification badge confirms status (`Voice Acting: ENABLED` / `Voice Acting: MUTED`).
  - Automatically saves to persistent configuration (`AI5SDL2.INI`).
- **Modern Aspect-Ratio & Touch Scaling:**
  - Correct 4:3 presentation with smooth centering and pillarboxing across all Android phone and tablet screens (16:9, 16:10, 19.5:9, 21:9).
  - Touch input coordinates are automatically scaled and offset to match the active game viewport.
- **Embedded Fonts:**
  - Bundles Wine Tahoma, DotGothic16, Kosugi, and Noto Sans JP directly into the binary—no external font files needed.
- **Multi-Architecture Support:** Built for `arm64-v8a` (modern 64-bit phones/tablets), `armeabi-v7a` (older 32-bit devices), and `x86_64` (Chromebooks and emulators).

---

## Touch Controls

| Gesture | In-Game Action |
| :--- | :--- |
| **1-Finger Tap** | Advance dialogue / Select option / Left Click |
| **2-Finger Tap** | Open Game Menu / Cancel / Right Click / Back |
| **3-Finger Tap** | Toggle Voice Acting (Enabled / Muted) |
| **Tap Top Edge** | Toggle Voice Acting (alternative gesture) |
| **Drag / Hold** | Move cursor / interact with scene investigation |

---

## Installation & Setup

> **Note:** This APK is an engine port and **does NOT contain copyrighted game assets**. You must provide your own game files from your PC installation of YU-NO (2011 TLWiki English Translation).

### Step 1: Install the APK
Download the latest **`YuNo.apk`** from the [**Releases**](https://github.com/fiksr/yuno-android/releases) section and install it on your Android device.

### Step 2: Copy Your PC Game Files
1. Connect your Android device to your PC via USB (or use a file manager app).
2. In the root of your phone/tablet's Internal Storage, create a folder named:
   ```text
   YuNo
   ```
   *(Path: `/sdcard/YuNo/` or `/storage/emulated/0/YuNo/`)*
3. Copy the following files from your PC TLWiki game directory into the `YuNo` folder on your device:
   - `AI5ENG.INI` *(or `AI5WIN.INI`)*
   - All `.ARC` archive files:
     - `zMES.ARC` *(English translated script)*
     - `zDATA.ARC`
     - `zBG.ARC` *(or `BG.ARC`)*
     - `EFFECT.ARC`
     - `GRP.ARC`
     - `MIDI.ARC`
     - `WAVE.ARC`
   - Sound files: `SE*.WAV`
   - Voice folders (if you have the Saturn voice patch):
     - `VOICE_A/`
     - `VOICE_B/`
     - `VOICE_C/`

*(Alternative storage path for Android 11+ scoped storage: `/sdcard/Android/data/org.libsdl.app/files/`)*

### Step 3: Launch
Open the **YU-NO** app on your device. On Android 11 through 15, grant storage access when prompted. The game will detect your data files and launch into the title screen.

---

## Building from Source

### Prerequisites
- Android SDK with platform tools & NDK (r25+ recommended)
- CMake 3.22+
- Java JDK 17+
- Gradle (bundled via `./gradlew`)

### Build Steps
```powershell
# Clone the repository
git clone https://github.com/fiksr/yuno-android.git
cd yuno-android

# Build Debug APK
.\build_apk.ps1
```
The output APK will be placed in `YuNo.apk` and `app/build/outputs/apk/debug/app-debug.apk`.

---

## Credits & Acknowledgments
- **Original Game:** [ELF Corporation](https://en.wikipedia.org/wiki/ELF_Corporation) & [Hiroyuki Kanno](https://en.wikipedia.org/wiki/Hiroyuki_Kanno)
- **Engine:** [`ai5-sdl2`](https://github.com/nunuhara/ai5-sdl2) by nunuhara
- **English Translation:** [TLWiki Community (2011)](https://vndb.org/r19623)
- **Saturn Voice Patch:** Visual novel community contributors
- **Android Port & Improvements:** [fiksr](https://github.com/fiksr)
