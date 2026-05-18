// collapsibles.js

if (!crypto.randomUUID) {
  crypto.randomUUID = function () {
    return ([1e7] + -1e3 + -4e3 + -8e3 + -1e11).replace(/[018]/g, (c) =>
      (
        c ^
        (crypto.getRandomValues(new Uint8Array(1))[0] & (15 >> (c / 4)))
      ).toString(16),
    );
  };
}

export class Collapsible {
  static registry = new Map();

  constructor(element, options = {}) {
    this.element = element;
    this.options = {
      collapseSiblings: false,
      ...options,
    };

    this.initialHeight =
      getComputedStyle(document.documentElement)
        .getPropertyValue("--space-collapsible-initial")
        .trim() || "20px";

    this.isBlocked = this.element.classList.contains("blocked");
    this.isOpen = element.classList.contains("expanded");
    this.container = element.closest(".collapsibles-list");

    // ID
    this.id = element.id || crypto.randomUUID();
    element.id = this.id;

    // =========================
    // Accessibility
    // =========================
    this.element.setAttribute("role", "button");
    this.element.setAttribute("tabindex", this.isBlocked ? "-1" : "0");
    this.element.setAttribute("aria-expanded", String(this.isOpen));

    if (this.isBlocked) {
      this.element.setAttribute("aria-disabled", "true");
    }

    // Register instance
    Collapsible.registry.set(this.id, this);

    // Initial styles
    this.element.style.height = this.isOpen
      ? `${this.element.scrollHeight}px`
      : `calc(${this.initialHeight} + 2px)`;

    // =========================
    // Events
    // =========================
    this.element.addEventListener("click", (e) => {
      if (
        this.isBlocked || e.target.closest(".collapsible__skip-toggle")
          ? true
          : false
      )
        return;
      this.toggle();
    });

    this.element.addEventListener("keydown", (e) => {
      if (this.isBlocked) return;
      if (e.key === "Enter" || e.key === " ") {
        e.preventDefault();
        this.toggle();
      }
    });
  }

  toggle() {
    this.isOpen ? this.collapse() : this.expand();
  }

  expand() {
    if (!this.element || this.isBlocked) return;

    // Collapse siblings if enabled
    if (this.options.collapseSiblings) {
      this.collapseSiblings();
    }

    this.element.style.display = "grid";
    this.element.style.height = this.element.scrollHeight + "px";

    this.element.classList.add("expanded");
    this.element.setAttribute("aria-expanded", "true");
    this.isOpen = true;

    const transitionDuration =
      parseFloat(
        getComputedStyle(document.documentElement).getPropertyValue(
          "--collapsible-transition-duration",
        ),
      ) || 0.3;

    setTimeout(() => {
      if (this.isOpen) this.element.style.height = "auto";
    }, transitionDuration * 1000);
  }

  collapse() {
    if (!this.element || this.isBlocked) return;

    const currentHeight = this.element.scrollHeight + "px";
    this.element.style.height = currentHeight;
    void this.element.offsetHeight;

    this.element.style.height = `calc(${this.initialHeight} + 2px)`;
    this.element.classList.remove("expanded");
    this.element.setAttribute("aria-expanded", "false");
    this.isOpen = false;
  }

  collapseSiblings() {
    if (!this.container) return;

    const siblings = this.container.querySelectorAll(".collapsible");

    siblings.forEach((el) => {
      if (el === this.element) return;

      const instance = Collapsible.registry.get(el.id);
      if (!instance) return;
      if (instance.isBlocked) return;
      if (!instance.isOpen) return;

      instance.collapse();
    });
  }
}

export function initCollapsibles({ collapseSiblings = false } = {}) {
  const elements = document.querySelectorAll(".collapsible");
  elements.forEach((el) => new Collapsible(el, { collapseSiblings }));
}

/**
 * Expand the collapsible containing a given element
 * @param {HTMLElement} element
 * @returns {boolean} - true if a collapsible was expanded
 */
export function expandCollapsibleContaining(element) {
  if (!element) return false;
  const collapsible = element.closest(".collapsible");
  if (!collapsible) return false;

  const instance = Collapsible.registry.get(collapsible.id);
  if (!instance) return false;

  if (!instance.isOpen) instance.expand();
  return true;
}
