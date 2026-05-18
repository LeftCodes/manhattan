// dropdownsHandler.js

if (!crypto.randomUUID) {
  crypto.randomUUID = function () {
    return ([1e7] + -1e3 + -4e3 + -8e3 + -1e11).replace(/[018]/g, c =>
      (c ^ crypto.getRandomValues(new Uint8Array(1))[0] & 15 >> c / 4).toString(16)
    );
  };
}

export class Dropdown {
  static registry = new Map(); // keeps track of all dropdown instances

  constructor(element) {
    this.element = element;
    this.label = element.querySelector('.dropdown__label');
    this.content = element.querySelector('.dropdown__content');
    this.isOpen = element.classList.contains('expanded');
    this.container = element.closest('.section-dropdowns');

    if (!this.label || !this.content) {
      console.warn('Dropdown element missing required structure:', element);
      return;
    }

    // Setup accessibility
    this.id = element.id || crypto.randomUUID();
    element.id = this.id;

    this.label.setAttribute('role', 'button');
    this.label.setAttribute('tabindex', '0');
    this.label.setAttribute('aria-controls', this.id + '-content');
    this.content.id = this.id + '-content';
    this.content.setAttribute('aria-hidden', this.isOpen ? 'false' : 'true');

    // Register instance
    Dropdown.registry.set(this.id, this);

    // Set initial styles
    this.content.style.height = this.isOpen ? `${this.content.scrollHeight}px` : '0px';

    // Bind events
    this.label.addEventListener('click', (e) => {
      if (e.target.closest('.dropdown__skip-toggle') ? true : false) return;
      this.toggle();
    });
    this.label.addEventListener('keydown', (e) => {
      if (e.key === 'Enter' || e.key === ' ') {
        e.preventDefault();
        this.toggle();
      }
    });

    // this.element.addEventListener('click', (e) => {
    //   if (!this.isOpen) return;
    //   if (this.label.contains(e.target)) return;
    //   this.collapse();
    // });

  }

  toggle() {
    this.isOpen ? this.collapse() : this.expand();
  }

  expand() {
    if (!this.content) return;

    this.collapseSiblings();

    this.content.style.visibility = 'unset';
    this.content.style.display = 'grid';
    const fullHeight = this.content.scrollHeight + 'px';
    this.content.style.height = fullHeight;

    this.element.classList.add('expanded');
    this.content.setAttribute('aria-hidden', 'false');
    this.label.setAttribute('aria-expanded', 'true');
    this.isOpen = true;

    // Reset height after transition to allow dynamic content
    const transitionDuration = parseFloat(getComputedStyle(document.documentElement).getPropertyValue('--dropdown-transition-duration')) || 0.3;
    setTimeout(() => {
      if (this.isOpen) this.content.style.height = 'auto';
    }, transitionDuration * 1000);
  }

  collapse() {
    if (!this.content) return;

    const currentHeight = this.content.scrollHeight + 'px';
    this.content.style.height = currentHeight;

    // Force reflow to trigger transition
    void this.content.offsetHeight;

    // this.content.style.height = '10vh';
    this.content.style.height = '0px';
    this.element.classList.remove('expanded');
    this.content.setAttribute('aria-hidden', 'true');
    this.label.setAttribute('aria-expanded', 'false');
    this.isOpen = false;

    this.content.addEventListener("transitionend", () => {
      if (!this.isOpen) this.content.style.visibility = 'hidden';
    });
  }

  collapseSiblings() {
    if (!this.container) return;

    const siblings = this.container.querySelectorAll('.dropdown');

    siblings.forEach((el) => {
      if (el === this.element) return;

      const instance = Dropdown.registry.get(el.id);
      if (!instance) return;
      if (!instance.isOpen) return;

      instance.collapse();
    });
  }
}

export function initDropdowns() {
  const elements = Array.from(document.querySelectorAll('.dropdown'));
  
  elements.forEach((el) => new Dropdown(el));
}

/**
 * Expand the dropdown containing a given element
 * @param {HTMLElement} element
 * @returns {boolean} - true if a dropdown was expanded
 */
export function expandDropdownContaining(element) {
  if (!element) return false;
  const dropdown = element.closest('.dropdown');
  if (!dropdown) return false;

  const instance = Dropdown.registry.get(dropdown.id);
  if (!instance) return false;

  if (!instance.isOpen) instance.expand();
  return true;
}

export function toggleDropdown(selectorOrElement) {
  const el = typeof selectorOrElement === "string"
    ? document.querySelector(selectorOrElement)
    : selectorOrElement;
  if (!el) return false;

  const id = el.id;
  const instance = Dropdown.registry.get(id);
  if (instance) {
    instance.toggle();
    return true;
  }
  return false;
}

export function collapseDropdown(selectorOrElement) {
  const el = typeof selectorOrElement === "string"
    ? document.querySelector(selectorOrElement)
    : selectorOrElement;
  if (!el) return false;

  const id = el.id;
  const instance = Dropdown.registry.get(id);
  if (instance && instance.isOpen) {
    instance.toggle();
    return true;
  }
  return false;
}