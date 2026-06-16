class MenuHandler {
  constructor(menuEl) {
    this.menuEl = menuEl;
    this.init();

    this.initListeners();
  }

  init() {
    this.menuBtns = document.querySelectorAll(".menu__btn button");
    this.closeBtns = document.querySelectorAll(".menu__close-button");

    this.containers = document.querySelectorAll(".menu__content");
    this.navContainer = document.querySelector(".menu__content--nav");
    this.trialContainer = document.querySelector(".menu__content--trial");
  }

  initListeners() {
    if (this.menuBtns) {
      this.menuBtns.forEach((btn) => {
        btn.addEventListener("click", () => this.handleExpandButtonClick(btn));
      });
    }

    if (this.closeBtns) {
      this.closeBtns.forEach((btn) => {
        btn.addEventListener("click", () => this.handleCloseButtonClick(btn));
      });
    }
  }

  handleExpandButtonClick(btn) {

    const btnType = btn.dataset.type;

    this.containers.forEach((el) => el.classList.remove("expanded"));

    if (btnType === "nav") {
      this.expand(this.navContainer);
    } else {
      this.expand(this.trialContainer);
    }
  }

  handleCloseButtonClick(btn) {
    this.containers.forEach((el) => el.classList.remove("expanded"));
  }

  expand(container) {
    container.style.display = "flex";
    container.classList.add("expanded");
  }

  close(container) {
    container.classList.remove("expanded");
    setTimeout(() => {
      container.style.display = "none";
    }, 500);
  }
}

export function initMenuHandler() {
  const menuEl = document.querySelector(".menu");

  if (menuEl) {
    const menuHandler = new MenuHandler(menuEl);
  }
}
