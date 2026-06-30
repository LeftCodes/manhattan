/* REQUIREMENTS 

You need following structure in your html so it works:
<div class="item-switch">
  <button class="item-switch__button" data-value="item 1"></button>
  <button class="item-switch__button" data-value="item 2"></button>
  <div class="item-switch__item" data-value="item 1"></div>
  <div class="item-switch__item" data-value="item 2"></div>
</div>

You can also wrap the items in seperate containers!

*/

import { paramsHandler } from "./paramsHandler.js";

class SwitchHandler {
  constructor(switchContainer, options = {}) {
    this.switchContainer = switchContainer;

    this.options = {
      paramName: "club",
      buttonSelector: ".item-switch__button",
      itemSelector: ".item-switch__item",
      activeClass: "active",
      visibleClass: "visible",
      ...options,
    };

    this.paramsHandler = paramsHandler;
    this.selectedClub = null;


    this.handleParamsChange = this.handleParamsChange.bind(this);

    this.init();
  }

  init() {
    if (!this.switchContainer) return;

    this.btns = Array.from(
      this.switchContainer.querySelectorAll(this.options.buttonSelector),
    );

    this.items = Array.from(
      this.switchContainer.querySelectorAll(this.options.itemSelector),
    );

    if (!this.btns.length) return;

    this.paramsHandler.onChange(this.handleParamsChange);

    this.initListeners();
    this.initInitialState();
  }

  initListeners() {
    this.btns.forEach((btn) => {
      btn.addEventListener("click", () => {
        this.handleBtnClick(btn);
      });
    });
  }

  initInitialState() {
    const currentParam = this.paramsHandler.get(this.options.paramName);

    if (currentParam) {
      this.selectedClub = this.formatName(currentParam);
      this.updateUi(currentParam);
      return;
    }

    this.activateFirstItem();
  }

  handleBtnClick(btn) {
    if (!btn) return;

    const value = btn.dataset.value;

    if (!value) return;

    this.updateUrl(value);
  }

  updateUrl(value) {
    const newValue = this.formatName(value);

    if (!newValue) return;

    if (this.selectedClub === newValue) return;

    this.paramsHandler.set(this.options.paramName, value);

    this.selectedClub = newValue;
  }

  handleParamsChange(event) {
    const { action, paramName, value } = event.detail;

    if (paramName !== this.options.paramName) return;

    if (action === "set" || action === "update") {
      this.updateUi(value);
    }

    if (action === "delete" || action === "clear") {
      this.resetUi();
    }
  }

  updateUi(value) {
    const formattedValue = this.formatName(value);

    if (!formattedValue) return;

    const activeBtn = this.btns.find((btn) => {
      return this.formatName(btn.dataset.value) === formattedValue;
    });

    if (!activeBtn) return;

    const activeItem = this.items.find((item) => {
      return this.formatName(item.dataset.value) === formattedValue;
    });


    this.selectedClub = formattedValue;

    this.switchActiveButton(activeBtn);

    if (!activeItem) return;

    this.hideAllItems();
    this.displayItem(activeItem);
  }

  activateFirstItem() {
    const firstBtn = this.btns[0];

    if (!firstBtn) return;

    const value = firstBtn.dataset.value;

    if (!value) return;

    this.updateUi(value);
  }

  resetUi() {
    this.selectedClub = null;

    this.btns.forEach((btn) => {
      btn.classList.remove(this.options.activeClass);
    });

    this.hideAllItems();
  }

  displayItem(item) {
    item.classList.add(this.options.visibleClass);
  }

  switchActiveButton(activeBtn) {
    this.btns.forEach((btn) => {
      btn.classList.remove(this.options.activeClass);
    });

    activeBtn.classList.add(this.options.activeClass);
  }

  hideAllItems() {
    this.items.forEach((item) => {
      item.classList.remove(this.options.visibleClass);
    });
  }

  formatName(name) {
    return String(name || "")
      .toLowerCase()
      .replace(/\bclub\b/g, "")
      .replace(/\s+/g, " ")
      .trim();
  }

  destroy() {
    this.paramsHandler.offChange(this.handleParamsChange);
  }
}

export function initSwitchHandler() {
  const switches = document.querySelectorAll(".item-switch");

  switches.forEach((switchItem) => {
    if (switchItem.dataset.switchInitialized === "true") return;

    const switchButtons = switchItem.querySelectorAll(".item-switch__button");

    if (!switchButtons.length) return;

    switchItem.dataset.switchInitialized = "true";

    new SwitchHandler(switchItem);
  });
}