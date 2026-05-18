// === IMPORTS ===
import { initAccessibilityHandlers } from "./utilities/accessibilityHandler.js";
import { initLotties } from "./utilities/lottieHandler.js";
import { initLoader } from "./utilities/loader.js";
import { initDropdowns } from "./utilities/dropdownHandler.js";
import { initCollapsibles } from "./utilities/collapsiblesHandler.js";
import { initSimpleSliders } from "./utilities/simpleSlidersHandler.js";
import { initSliders } from "./utilities/slidersHandler.js";
import { initFilterHandler } from "./utilities/filterHandler.js";
import { initScrollObserverHandler } from "./utilities/scrollObserverHandler.js";

// === SWUP LOAD ===
const swup = new Swup({
  plugins: [
    // new SwupDebugPlugin(),
    new SwupHeadPlugin(),
  ],
});

// === ADD MODULES AND HANDLERS HERE ===

function initScripts() {
  initLotties();
  initDropdowns();
  initCollapsibles({ collapseSiblings: true });
  initSliders();
  initFilterHandler();
  initSimpleSliders();
  initScrollObserverHandler();
  initAccessibilityHandlers();
  // Add more module inits here that run on page reload and page switch (e.g., initFooter(), initModals(), etc.)
}

// === EVENT HANDLERS ===

// Window ready
window.addEventListener("load", () => {
  initLoader();
});

// DOM ready
document.addEventListener("DOMContentLoaded", () => {
  initScripts();

  console.log(
    `%cMade at Left--------------------
█///████//////██//////█//////███
██///████///█████///█████///████
███///████//////██/////███///███
████///████///█████///█████///██
█████//////█//////██///█████///█
---------------------left.studio`,
    "font-family:monospace",
  );
});

// Window resize
window.addEventListener("resize", () => {
  // initScripts();
});

// Swup page reload
swup.hooks.on("page:view", () => {
  initScripts();
});
