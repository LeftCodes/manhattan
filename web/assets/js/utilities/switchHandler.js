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
  constructor(switchContainer) {
    this.switchContainer = switchContainer;
    this.init();
  }

  init() {
    this.btns = this.switchContainer.querySelectorAll(".item-switch__button");
    this.items = this.switchContainer.querySelectorAll(".item-switch__item");

    console.log(this.items);

    this.paramsHandler = paramsHandler;

    this.initListeners();
    this.initInitialState();
  }

  initListeners() {
    if (this.btns) {
      this.btns.forEach((btn) => {
        btn.addEventListener("click", () =>
          this.handleItemDisplayByButton(btn),
        );
      });
    }
  }

  initInitialState() {
    if (!this.btns) return;

    const currentItem = this.paramsHandler.get("club");

    const initialBtn = currentItem
      ? [...this.btns].filter((btn) => btn.dataset.value === currentItem)[0]
      : this.btns[0];


    this.handleItemDisplayByButton(initialBtn);
  }

  handleItemDisplayByButton(btn) {
    if (!this.items || !btn) return;

    console.log(btn.dataset.value);

    const btnValue = btn.dataset.value;
    const item = [...this.items].filter((item) => {
      return item.dataset.value === btnValue;
    })[0];

    this.hideAllItems();
    this.displayItem(item);
    this.switchActiveButton(btn);
    this.updateUrl(btnValue);
  }

  displayItem(item) {
    if (item) {
      item.classList.add("visible");
    }
  }

  switchActiveButton(btn) {
    if (!this.btns.length || !btn) return;

    this.btns.forEach((btn) => btn.classList.remove("active"));
    btn.classList.add("active");
  }

  hideAllItems() {
    this.items.forEach((item) => item.classList.remove("visible"));
  }

  updateUrl(value) {
    this.paramsHandler.delete("club");
    this.paramsHandler.set("club", value);
  }
}

export function initSwitchHandler() {
  const switches = document.querySelectorAll(".item-switch");

  switches.forEach((switchItem, index) => {
    const switchButtons = switchItem.querySelectorAll(".item-switch__button");

    if (!switchButtons.length) return;

    const switchHandler = new SwitchHandler(switchItem);
  });
}
