# NI Kontrol Z1: Deck A/B mixer

* Product: <https://www.native-instruments.com/en/products/traktor/dj-controllers/traktor-kontrol-z1/>
* Version: 1

## User Remote Script (Automapping)

**Description:**

* Similar to MIDI Remote Scripts but less powerful as the only options are what's exposed in the text config file (though these work well and provide LED feedback)
* Works in conjunction with Controller Editor to assign CCs
* Assigned channel 2 in Controller Editor to prevent controller clashes (if that's a thing with User Remote Scripts)

**Mappings:**

```txt
* Cue A              = Track 5/"DECK A" - Solo/Cue
* Cue B              = Track 6/"DECK B" Solo/Cue
* XFader             = XFader
```

## Manual MIDI mapping

The following mappings are done directly in the Live template:

```txt
* Left/Right Gain    = Track 5/6/"DECK A/B" - Macro - Gain
* Left/Right Hi      = Track 5/6/"DECK A/B" - Macro - EQ High
* Left/Right Mid     = Track 5/6/"DECK A/B" - Macro - EQ Mid
* Left/Right Low     = Track 5/6/"DECK A/B" - Macro - EQ Low
* Left/Right Filter  = Track 5/6/"DECK A/B" - Macro - Balance (rack macro used to share setting with Push2)
* Left/Right Fader   = Track 5/6/"DECK A/B" - Macro - Vol Rcvr (rack macro used to share setting with Push2)
* Left/Right LEDs    = Track "Meter 5/6"    - Device - midiAudioToCC - EnvelopeL
```

## Ableton Live MIDI setup

* Control Surface: `NI Kontrol Z1 TL3`
* Input: `Kontrol_Z1_TL3 Input`
  * Track: `On`
  * Sync: `Off`
  * Remote: `On`
* Output: `Kontrol_Z1_TL3 Output`
  * Track: `Off`
  * Sync: `Off`
  * Remote: `On`
