/* 
add the sound file name below, follow the structure, 
this concept is especially useful for sound randomization.

// EXAMPLE USAGE:

const sfx = new SoundHandler('/assets/sounds/', 3);

// start multiple at once
const a1 = sfx.play('mouse-click');
const a2 = sfx.play('mouse-click');

// stop one
sfx.stop(a1);

// stop a whole group
sfx.stopByName('mouse-click');

// stop everything
sfx.stopAll();

test 5
*/

const soundMap = {
  "example-sound": [
    "example-sound1.mp3",
    "example-sound2.mp3",
    "example-sound3.mp3",
  ],
  "sound-name": ["sound-name1.wav", "sound-name2.wav", "sound-name3.wav"],
  "single-sound": ["single-sound.mp3"],
};

export default class SoundHandler {
  constructor(basePath = "/assets/sounds/") {
    this.basePath = basePath;
    this.isActive = false;

    // name -> [files]
    this.filesByName = new Map(Object.entries(soundMap));

    // file -> single Audio instance (preloaded)
    this.audioByFile = new Map();

    // preload once
    for (const files of this.filesByName.values()) {
      for (const file of files) {
        const a = new Audio(this.basePath + file);
        a.preload = "auto";
        a.load();
        a._file = file;
        this.audioByFile.set(file, a);
      }
    }
  }

  // plays a random file for the given group name, reusing the single Audio instance
  play(name, { volume = 1, loop = false } = {}) {
    const files = this.filesByName.get(name);
    if (!files?.length) return null;

    // pick a random audio file
    const file = files[(Math.random() * files.length) | 0];
    const audio = this.audioByFile.get(file);
    if (!audio) return null;

    audio.loop = loop;
    audio.volume = volume;

    // reuse the same element: restart from 0 each time
    try {
      audio.pause();
    } catch {}
    audio.currentTime = 0;
    audio.play().catch((err) => console.warn("Audio play failed:", err));
    return audio; // you can keep and stop this later
  }

  stop(audio) {
    if (!audio) return;
    try {
      audio.pause();
    } catch {}
    audio.currentTime = 0;
  }

  stopByName(name) {
    const files = this.filesByName.get(name) || [];
    for (const file of files) {
      const a = this.audioByFile.get(file);
      if (a) this.stop(a);
    }
  }

  stopAll() {
    for (const a of this.audioByFile.values()) this.stop(a);
  }
}
