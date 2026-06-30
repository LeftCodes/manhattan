/* REQUIREMENTS

Buttons/links need:
- .button--params
- data-href
- data-value

Example:
<button
  class="button--params"
  data-href="/gruppen"
  data-value="Club Wien"
>
  Club Wien
</button>

*/

import { paramsHandler } from "./paramsHandler.js";

class LinkHandler {
  constructor(button, swup = null) {
    this.button = button;
    this.swup = swup;
    this.paramsHandler = paramsHandler;

    this.handleClick = this.handleClick.bind(this);

    this.init();
  }

  init() {
    if (!this.button) return;

    this.button.addEventListener("click", this.handleClick);
  }

  handleClick(e) {
    e.preventDefault();

    const href = this.button.dataset.href || this.button.getAttribute("href");
    const value = this.button.dataset.value;

    if (!href) return;

    const newHref = this.paramsHandler.createUrlWithParam(
      href,
      "club",
      value,
    );

    if (this.swup) {
      this.swup.navigate(newHref);
      return;
    }

    window.location.href = newHref;
  }

  destroy() {
    this.button.removeEventListener("click", this.handleClick);
  }
}

export function initLinkHandler(swup = null, scope = document) {
  const btns = scope.querySelectorAll(".button--params");

  if (!btns.length) return;

  btns.forEach((btn) => {
    if (btn.dataset.linkHandlerInitialized === "true") return;

    btn.dataset.linkHandlerInitialized = "true";

    new LinkHandler(btn, swup);
  });
}