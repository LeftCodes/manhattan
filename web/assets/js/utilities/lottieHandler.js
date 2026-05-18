/*
USE CASE:
Use as dataset "data-lottie" and it will track all these elements

Example:
<div id="logo" data-lottie="{{ alias('@web') }}/assets/lottie/TEA_logoAni3.json"></div>
*/

export function initLotties() {
  const els = Array.from(document.querySelectorAll("[data-lottie]"));
  if (!els.length) return null;

  const instances = new Map();

  els.forEach((el) => {
    // Clear a previous instance on the same node (in case of re-init)
    if (el.__lottie) {
      try {
        el.__lottie.destroy();
      } catch (_) {}
      el.__lottie = null;
    }

    const path = el.dataset.lottie;
    const loop = el.dataset.loop !== "false"; // default true
    const autoplay = el.dataset.autoplay !== "false"; // default true
    const renderer = el.dataset.renderer || "svg";
    const name = el.dataset.name || undefined;
    const speed = el.dataset.speed ? parseFloat(el.dataset.speed) : null;
    const segment = el.dataset.segment
      ? el.dataset.segment.split(",").map((n) => parseFloat(n.trim()))
      : null;

    if (!path) return;

    const anim = lottie.loadAnimation({
      container: el,
      renderer,
      loop,
      autoplay,
      path,
      name,
    });

    if (speed && !Number.isNaN(speed)) anim.setSpeed(speed);
    if (
      segment &&
      segment.length === 2 &&
      segment.every((n) => !Number.isNaN(n))
    ) {
      // play segment once on init
      anim.playSegments(segment, true);
    }

    el.__lottie = anim;
    instances.set(el, anim);
  });

  // Teardown for Swup or page change
  return () => {
    instances.forEach((anim, el) => {
      try {
        anim.destroy();
      } catch (_) {}
      el.__lottie = null;
    });
    instances.clear();
  };
}
