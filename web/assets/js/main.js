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
import { initMenuHandler } from "./utilities/menuHandler.js";
import { initSwitchHandler } from "./utilities/switchHandler.js";
import { initLinkHandler } from "./utilities/linkHandler.js";
// import { initFilterHandler } from "./utilities/initFilterHandler.js";
import { initCalendarHandler } from "./utilities/calendarHandler.js";

// === SWUP LOAD ===
const swup = new Swup({
  plugins: [
    new SwupHeadPlugin(),
    new SwupScrollPlugin({
      animateScroll: false,
      scrollContainers: ".page-scroll",
    }),
  ],
});

// === ADD MODULES AND HANDLERS HERE ===

function initScripts() {
  initLotties();
  initMenuHandler();
  initDropdowns();
  initCollapsibles({ collapseSiblings: true });
  initSliders();
  initFilterHandler();
  initSimpleSliders();
  initScrollObserverHandler();
  initAccessibilityHandlers();
  initSwitchHandler();
  initCalendarHandler();
  initLinkHandler(swup);
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
  resetScroll();
  initScripts();
});

// SWUP

function resetScroll() {
  const scrollContainer = document.querySelector(".page-scroll");

  if (!scrollContainer) {
    window.scrollTo(0, 0);
    return;
  }

  scrollContainer.scrollTop = 0;
  scrollContainer.scrollLeft = 0;
}
