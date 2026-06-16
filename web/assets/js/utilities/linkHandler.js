/* REQUIREMENTS 


*/

import { paramsHandler } from "./paramsHandler.js";

class LinkHandler {
  constructor(btns) {
    this.btns = btns;

    this.init();
  }

  init() {
    this.paramsHandler = paramsHandler;
    this.initListeners();
  }

  initListeners() {
    if (this.btns) {
      this.btns.forEach((btn) => {
        btn.addEventListener("click", (e) => this.handleClick(e, btn));
      });
    }
  }

  handleClick(e, button) {

    const href = button.dataset.href;
    const value = button.dataset.value;

    const newHref = this.paramsHandler.createUrlWithParam(href, "club", value);

    window.location.href = newHref;
  }
}

export function initLinkHandler() {
  const btns = document.querySelectorAll(".button--params");

  if (btns) {
    const linkHandler = new LinkHandler(btns);
  }
}
