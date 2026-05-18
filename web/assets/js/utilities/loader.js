// Minimal loader with your logic: add a class, wait for end, remove element.

import { lockBody, unlockBody } from "../core/bodyLock.js"; // optional

export function initLoader() {
  const el = document.querySelector(".loader");
  if (!el) return;

  // optional: lock while visible
  lockBody();

  // let the browser paint once, then trigger the animation/transition
  setTimeout(() => (el.style.animationName = "fade-out"), 0);

  const done = () => {
    // el.remove();
    el.style.display = 'none'
    unlockBody();
  };

  // works whether you use keyframe animations or simple opacity transitions
  el.addEventListener("animationend", done, { once: true });
  el.addEventListener("transitionend", done, { once: true });

  // tiny fallback (only if your CSS end event never fires)
  setTimeout(() => el.isConnected && done(), 1500);
}
