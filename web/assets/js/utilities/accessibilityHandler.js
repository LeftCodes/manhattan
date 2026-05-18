/*

CREATE TEMPLATE STRUCTURE =>

1) Just add class of the button type:
  "accessibility-item__toggle", => is a toggle button
  "accessibility-item__scale", => is a range
  "accessibility-item__link", => is just a link
  "accessibility-item__reset" => resets all features
2) create id that starts with term "accessibility-" and unique name.

EXAMPLE STRUCTURE =>

1)
<p class="accessibility-item__toggle" id="accessibility-highlightTitle">
  {{ 'Titel Hervorheben'|t }}
</p>

2)
<div class="accessibility-item__toggle" id="accessibility-darkerContrast">
		<p data-active="{{ 'Invertierung umkehren'|t }}">{{ 'Invertieren'|t }}</p>
</div>

*/

class AccessibilityHandler {
  constructor(element) {
    this.element = element;
    this.id = this.element.id;
    this.isEnabled = false;
    this.isScale =
      this.element.classList.contains("accessibility-item__scale") || null;
    this.isReset =
      this.element.classList.contains("accessibility-item__reset") || null;
    this.elementValue = this.element.querySelector(".value");

    this.textEl = this.element.querySelector("p");
    this.textActive = this.textEl?.innerText || null;
    this.textInactive = this.textEl?.dataset.active;

    // methods
    this.init();
  }

  init() {
    this.initListener();
    this.loadState();
  }

  initListener() {
    console.log("hey");
    
    if (this.isScale) {
      this.element.querySelector(".increase").addEventListener("click", () => {
        this.updateFontSizeValue(1);
      });

      this.element.querySelector(".decrease").addEventListener("click", () => {
        this.updateFontSizeValue(-1);
      });
    } else if (this.isReset) {
      this.element.addEventListener("click", (e) => {
        this.resetAllSettings();
      });
    } else if (this.element.classList.contains("accessibility-item__toggle")) {
      this.element.addEventListener("click", (e) => {
        e.preventDefault();
        this.isEnabled = !this.isEnabled;
        this.updateState();
      });
    }
  }

  loadState() {
    const savedValue = localStorage.getItem(this.id);

    if (savedValue === null) return;

    if (!this.isScale) {
      this.isEnabled = savedValue === "true";
    } else {
      this.isEnabled = savedValue !== null;
      this.fontSizeValue = savedValue;
    }

    this.updateState();
  }

  updateState() {
    const newState = this.isScale ? this.fontSizeValue : this.isEnabled;

    localStorage.setItem(this.id, newState);

    this.applySetting();
  }

  applySetting() {
    this.updateButton();
    if (this.isScale) {
      this.updateFontSizeValue(null, this.fontSizeValue);
    } else {
      document.body.classList.toggle(this.id, this.isEnabled);

      if (
        this.id === "accessibility-readingGuide" ||
        this.id === "accessibility-bigCursor"
      )
        this.toggleListeners();
    }
  }

  updateButton() {
    if (this.isScale) {
    } else {
      if (this.textActive) {
        this.textEl.innerText = this.isEnabled
          ? this.textInactive
          : this.textActive;
      } else {
        this.element.classList.toggle("checked", this.isEnabled);
      }
    }
  }

  updateFontSizeValue(delta, newValue) {
    const VAR = "--accessibility-font-size";
    const root = document.documentElement;
    const valueEl = this.isScale
      ? this.element.querySelector(".value")
      : document.querySelector(".accessibility-item__scale .value");

    if (!valueEl) {
      console.warn("Missing .value element in accessibility-item__scale");
      return;
    }

    if (newValue) {
      valueEl.innerText = `${Math.round(newValue * 100)}%`;
      root.style.setProperty(VAR, String(newValue));
      return;
    }

    // Read current (trim in case of whitespace). Default to 1 if not set.
    const raw = getComputedStyle(root).getPropertyValue(VAR).trim();
    let current = parseFloat(raw);
    if (Number.isNaN(current)) current = 1;

    const STEP = 0.1; // 10% per click
    const MIN = 1.0,
      MAX = 1.5; // clamp range: 50%–200%

    const next = Math.min(MAX, Math.max(MIN, current + delta * STEP));

    valueEl.innerText = `${Math.round(next * 100)}%`;
    localStorage.setItem(this.id, next);
    root.style.setProperty(VAR, String(next));
  }

  toggleListeners() {
    if (this.id === "accessibility-readingGuide") {
      this.handleGuideListener();
    }
    if (this.id === "accessibility-bigCursor") {
      this.handleCursorListener();
    }
  }

  handleGuideListener() {
    const guide = document.body.querySelector(".accessibility-spotlight");

    if (this.isEnabled) {
      if (this.guideHandler) return;

      this.guideHandler = (e) => {
        const h = guide.offsetHeight || 160;
        const top = Math.max(
          0,
          Math.min(window.innerHeight - h, e.clientY - h / 2)
        );
        guide.style.top = `${top}px`;
      };

      window.addEventListener("pointermove", this.guideHandler, {
        passive: true,
      });
    } else {
      if (this.guideHandler) {
        window.removeEventListener("pointermove", this.guideHandler);
        this.guideHandler = null;
      }
    }
  }

  handleCursorListener() {
    const cursor = document.querySelector(".accessibility-cursor");

    if (!cursor) return;

    if (this.isEnabled) {
      // add class to hide OS cursor
      document.body.classList.add("accessibility-bigCursor");

      if (this.cursorHandler) return; // already active

      let x = 0,
        y = 0,
        raf = null;

      this.cursorHandler = (e) => {
        x = e.clientX;
        y = e.clientY;
        if (raf) return;

        raf = requestAnimationFrame(() => {
          cursor.style.transform = `translate(${x}px, ${y}px)`;
          raf = null;
        });
      };

      // show/hide when entering/leaving the window (optional)
      this.cursorEnterHandler = () => {
        cursor.style.opacity = "1";
      };
      this.cursorLeaveHandler = () => {
        cursor.style.opacity = "0";
      };

      window.addEventListener("pointermove", this.cursorHandler, {
        passive: true,
      });
      window.addEventListener("pointerenter", this.cursorEnterHandler);
      window.addEventListener("pointerleave", this.cursorLeaveHandler);
    } else {
      // disable
      if (this.cursorHandler) {
        window.removeEventListener("pointermove", this.cursorHandler);
        window.removeEventListener("pointerenter", this.cursorEnterHandler);
        window.removeEventListener("pointerleave", this.cursorLeaveHandler);
        this.cursorHandler = null;
        this.cursorEnterHandler = null;
        this.cursorLeaveHandler = null;
      }
      document.body.classList.remove("accessibility-bigCursor");
    }
  }

  resetAllSettings() {
    this.clearStyles();
    this.clearButtons();
    this.clearLocalStorage();
  }

  clearStyles() {
    const body = document.body;
    const toRemove = [...body.classList].filter((c) =>
      c.toLowerCase().includes("accessibility")
    );
    if (toRemove.length) body.classList.remove(...toRemove);
  }

  clearButtons() {
    const buttons = document.querySelectorAll(
      ".accessibility-menu__container .checked"
    );
    buttons.forEach((button) => button.classList.remove("checked"));
    this.updateFontSizeValue(null, 1);
  }

  clearLocalStorage() {
    const term = "accessibility";

    const matches = Object.keys(localStorage)
      .filter((k) => k.toLowerCase().includes(term))
      .map((k) => ({ key: k, value: localStorage.getItem(k) }));

    matches.forEach((item) => {
      localStorage.removeItem(item.key);
    });
  }
}

function getStates() {
  let returnValues = [];

  // loop through all keys in localStorage
  for (let i = 0; i < localStorage.length; i++) {
    const keyName = localStorage.key(i);

    // only process keys that contain "accessibility"
    if (keyName.includes("accessibility")) {
      try {
        const storedValue = JSON.parse(localStorage.getItem(keyName));
        if (storedValue) {
          returnValues.push(keyName);
        }
      } catch (e) {
        console.warn("Could not parse value for", keyName, e);
      }
    }
  }

  return returnValues;
}

// EXPORT FUNCTION

export function initAccessibilityHandlers() {

  console.log("Init Accessibility Handlers");
  
  // check if accessibility buttons are on the page
  const supportedTypes = [
    "accessibility-item__toggle",
    "accessibility-item__scale",
    "accessibility-item__link",
    "accessibility-item__reset",
  ];
  let elements = supportedTypes.flatMap((type) =>
    Array.from(document.querySelectorAll(`.${type}`))
  );

  // if empty, check if accessibility states are saved in local storage
  if (elements.length === 0) {
    const localStates = getStates();
    localStates.forEach((state) => {
      document.body.classList.toggle(state, true);
    });
    return;
  }

  // if not empty, create accessibility handler for each button
  elements.forEach((el) => new AccessibilityHandler(el));
}


