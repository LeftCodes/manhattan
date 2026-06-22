// htmlRenderer.js

export default class HTMLRenderer {
  constructor({ container, template, list, tags = {} }) {
    if (!container) {
      throw new Error("HTMLRenderer requires a container.");
    }

    if (!template) {
      throw new Error("HTMLRenderer requires a template element.");
    }

    if (!list) {
      throw new Error("HTMLRenderer requires a list element.");
    }

    this.container = container;
    this.template = template;
    this.list = list;
    this.tags = tags;
  }

  render(data, append = false) {
    if (!append) {
      this.clear();
    }

    const items = Array.isArray(data) ? data : [data];

    const fragment = document.createDocumentFragment();

    items.forEach((item) => {
      const element = this.renderItem(item);
      fragment.appendChild(element);
    });

    this.list.appendChild(fragment);
  }

  renderItem(data) {
    const clone = this.template.content.cloneNode(true);

    Object.entries(this.tags).forEach(([dataKey, config]) => {
      this.renderField(clone, data, dataKey, config);
    });

    return clone;
  }

  renderField(clone, data, dataKey, config) {
    const value = this.getValue(data, dataKey);

    // Simple syntax:
    // title: "[data-title]"
    if (typeof config === "string") {
      this.setText(clone.querySelector(config), value);
      return;
    }

    // Advanced syntax:
    // title: { selector: "[data-title]", type: "text" }
    const {
      selector,
      type = "text",
      attr = null,
      fallback = "",
      removeIfEmpty = true,
      transform = null,
    } = config;

    const element = clone.querySelector(selector);

    if (!element) return;

    const finalValue = transform ? transform(value, data) : value;

    const output = finalValue ?? fallback;

    if (
      (output === "" || output === null || output === undefined) &&
      removeIfEmpty
    ) {
      element.remove();
      return;
    }

    if (type === "text") {
      element.textContent = output;
      return;
    }

    if (type === "html") {
      element.innerHTML = output;
      return;
    }

    if (type === "attr") {
      element.setAttribute(attr, output);
      return;
    }

    if (type === "image") {
      element.setAttribute("src", output);
      element.setAttribute("alt", data.alt ?? "");
      return;
    }

    if (type === "class") {
      element.classList.add(output);
      return;
    }
  }

  getValue(data, path) {
    return path.split(".").reduce((value, key) => {
      return value?.[key];
    }, data);
  }

  setText(element, value) {
    if (!element) return;

    if (value) {
      element.textContent = value;
    } else {
      element.remove();
    }
  }

  clear() {
    this.list.innerHTML = "";
  }
}
