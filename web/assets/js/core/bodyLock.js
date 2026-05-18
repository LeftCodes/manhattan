import { store } from "./storeHandler.js";

function computeScrollbarWidth() {
  return window.innerWidth - document.documentElement.clientWidth;
}

// lock body function
export function lockBody() {
  if (store.get("isLocked")) return;

  const y = window.scrollY || window.pageYOffset;
  store.set({ scrollY: y });

  const w = computeScrollbarWidth();
  document.documentElement.style.setProperty("--scrollbar-w", `${w}px`);
  document.documentElement.classList.add("is-locked");

  Object.assign(document.body.style, {
    position: "fixed",
    overflow: "hidden",
  });
  
  store.set({ isLocked: true });
}

// unlock body function
export function unlockBody() {
  if (!store.get("isLocked")) return;

  document.documentElement.classList.remove("is-locked");
  document.documentElement.style.removeProperty("--scrollbar-w");

  Object.assign(document.body.style, {
    position: "",
    overflow: "",
  });

  const y = store.get("scrollY") || 0;
  window.scrollTo(0, y);

  store.set({ isLocked: false });
}

// toggle body function
export function toggleBodyLock(force) {
  const shouldLock = force ?? !store.get("isLocked");
  return shouldLock ? lockBody() : unlockBody();
}
