/*
USE CASE:

*/

export function initOrientation() {
  const orientationOverlay = document.querySelector(".orientation-overlay");
  const isLandscape = window.matchMedia("(orientation: landscape)").matches;
  const isMobile = "ontouchstart" in window || navigator.maxTouchPoints > 0;

  if (isLandscape && isMobile && window.innerWidth <= 768) {
    // Display orientation overlay
    orientationOverlay.classList.add("visible");
    lockBody();
  } else {
    orientationOverlay.classList.remove("visible");
    unlockBody();
  }
}
