/* REQUIREMENTS 

You need following structure in your html so it works:

<div class="card-switch">
	<button class="card-switch__button" data-value="item 1"></button>
	<button class="card-switch__button" data-value="item 2"></button>

	<div class="card-switch__item" data-value="item 1"></div>
	<div class="card-switch__item" data-value="item 2"></div>
</div>

You can also wrap the items in seperate containers!

*/

import { paramsHandler } from "./paramsHandler.js";

class SwitchHandler {
  constructor(switchHandler) {
    this.switchHandler = switchHandler;
    this.init();
  }

  init() {
    this.btns = this.switchHandler.querySelectorAll(".card-switch__button");
    this.items = this.switchHandler.querySelectorAll(".card-switch__item");

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

    console.log(currentItem);
      const initialBtn = currentItem
        ? [...this.btns].filter((btn) => btn.dataset.value === currentItem)
        : this.btns[0];

    console.log(initialBtn);

    this.handleItemDisplayByButton(initialBtn);
  }

  handleItemDisplayByButton(btn) {
    if (!this.items && !btn) return;

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
  const switches = document.querySelectorAll(".card-switch");

  if (switches) {
    switches.forEach((switchItem) => {
      const switchButtons = switchItem.querySelectorAll(".card-switch__button");

      if (!switchButtons.length) return;

      console.log("has switch button");

      const switchHandler = new SwitchHandler(switchItem);
    });
  }
}
