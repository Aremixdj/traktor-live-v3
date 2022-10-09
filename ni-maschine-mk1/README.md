# NI Maschine Mk1: Ableton Resampler

Repurposing the MIDI mode of this old controller as a dedicated control surface for custom M4L Devices and Traktor DJing.

I'm also aiming to replace the functionality of the recently purchased MIDI Fighter Twisters. The Maschine Mk1 has screens which allows controls to be organised and labelled, even without the use of Python, and this is far more usable than printing overlays for controllers without screens. It's also a snap to change templates and I don't need to worry about the controller being in the wrong bank on startup as I do with the MFTs.

## M4L Devices

*Note that M4L Devices expose automappings of encoders 1-8, 9-13 etc via the `live.banks` object.*

* <https://github.com/dotherightthing/m4l-helpers>

## Access MIDI mode

* `SHIFT + CONTROL`

## Controller Editor template

**Description:**

* Provides pages of MIDI controls
* Page and name display on controller
* Control name displays on controller (text entered into static name fields in template)
* Control values display as slider positions
* Unneeded controls can be visually disabled

**Files:**

The following file is installed to the correct location by `npm run install`:

* `ni-controller-editor/Maschine_Mk1_TL3.ncm`

Note: An Ableton Live 11 template is available from <https://support.native-instruments.com/hc/en-us/articles/4413367278097-How-to-Install-MASCHINE-Templates-for-Ableton-Live> - but this won't open in the Controller Editor for Maschine Mk1. There is an update available for the software but I'm afraid that this might negatively impact support for Maschine Mk1, so I haven't installed it yet

**Installation:**

1. Install Native Access
2. Install Controller Editor
3. File > Open Template

## User Remote Script (Automapping)

> Technically speaking, User Remote Scripts are MIDI Remote Scripts that are configured via plain text files as opposed to being purely configured in Python [src](https://forum.ableton.com/viewtopic.php?t=204880)

**Description:**

* Similar to MIDI Remote Scripts but less powerful as the only options are what's exposed in the text config file (though these work well and provide LED feedback)
* Works in conjunction with Controller Editor to assign CCs and split mappings across hardware navigable 'pages'
* Assigned channel 1 in Controller Editor to prevent controller clashes (if that's a thing with User Remote Scripts)

**Files:**

The following file is installed to the correct location by `npm run install`:

* `user-remote-scripts/UserConfiguration.txt`

**Mappings:**

See Controller Editor.

## Manual MIDI mapping

The following mappings are done directly in the Live template.

Note: [...] denotes a label in the Controller Editor template.

```txt
* [Pan 1] = Track 1/"SAMPLE 1" - Macro - Balance (rack macro used to share setting with Push2)
* [Pan 2] = Track 2/"SAMPLE 2" - Macro - Balance (rack macro used to share setting with Push2)
* [Pan 3] = Track 3/"SAMPLE 3" - Macro - Balance (rack macro used to share setting with Push2)
* [Pan 4] = Track 4/"SAMPLE 4" - Macro - Balance (rack macro used to share setting with Push2)
* [Vol 1] = Track 1/"SAMPLE 1" - Macro - Vol Rcvr (rack macro used to share setting with Push2)
* [Vol 2] = Track 2/"SAMPLE 2" - Macro - Vol Rcvr (rack macro used to share setting with Push2)
* [Vol 3] = Track 3/"SAMPLE 3" - Macro - Vol Rcvr (rack macro used to share setting with Push2)
* [Vol 4] = Track 4/"SAMPLE 4" - Macro - Vol Rcvr (rack macro used to share setting with Push2)
* [VU 1]  = Track "Meter 1"    - Device - midiAudioToCC - EnvelopeL
* [VU 2]  = Track "Meter 2"    - Device - midiAudioToCC - EnvelopeL
* [VU 3]  = Track "Meter 3"    - Device - midiAudioToCC - EnvelopeL
* [VU 4]  = Track "Meter 4"    - Device - midiAudioToCC - EnvelopeL
* [XF 1]  = Track 1/"SAMPLE 1" - Xfade assign (A/B)
* [XF 2]  = Track 2/"SAMPLE 2" - Xfade assign (A/B)
* [XF 3]  = Track 3/"SAMPLE 3" - Xfade assign (A/B)
* [XF 4]  = Track 4/"SAMPLE 4" - Xfade assign (A/B)
```

## MIDI Remote Scripts (TODO)

**Description:**

* Similar to User Remote Scripts but more powerful as they use Python scripting and can access the LOM, e.g. `show_messsage` which updates Live's status bar
* Adds usability to the static labels in the template by exposing the name of the selected device
* Some manufacturers' scripts may also be able to expose the parameter names - see Issue #1

**Files:**

* Maschine Mk1: <https://github.com/nuno-andre/maschine-mk1>

**Installation:**

1. Copy to `/Applications/Ableton\ Live\ 11\ Standard.app/Contents/App-Resources/MIDI\ Remote\ Scripts`

### Decompiling compiled Python scripts (`.pyc` files)

1. Install <https://pypi.org/project/uncompyle6/>
2. change to target directory
3. `find . -name '*.pyc' -exec bash -c 'uncompyle6 $1 > $1.py' _ {}\;`

## Ableton Live Preferences

### MIDI

* Control Surface: `Maschine Mk1 TL3`
* Input: `Maschine Controller Virtual Input` (doesn't work with `Maschine Controller (MIDI input port 0)`)
* Input: `Maschine Controller Virtual Output` (doesn't work with `Maschine Controller (MIDI output port 0)`)

### MIDI Ports

* In: `Maschine_Mk1_TL3 Input`
  * Track: `On`
  * Sync: `Off`
  * Remote: `On`
* Out: `Maschine_Mk1_TL3 Output`
  * Track: `Off`
  * Sync: `Off`
  * Remote: `On` (required to send MIDI from VU Meter plugin to `VU N` encoders on LCD)
