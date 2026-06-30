// htmlRenderer.js

export default class HTMLRenderer {
  renderOne({
    container,
    template,
    data,
    append = true,
    scope = document,
  }) {
    const targetEl = this.getElement(container, scope);
    const templateEl = this.getTemplate(template, scope);

    if (!targetEl) {
      throw new Error("HTMLRenderer: container not found.");
    }

    if (!templateEl) {
      console.log(templateEl);
      throw new Error("HTMLRenderer: template not found.");
    }

    if (!append) {
      this.clear(targetEl);
    }

    const fragment = this.createFragment(templateEl, template, data);
    const renderedNodes = Array.from(fragment.children);

    targetEl.appendChild(fragment);

    return renderedNodes;
  }

  renderMany({
    container,
    template,
    data = [],
    append = false,
    scope = document,
    classes = "",
  }) {
    const targetEl = this.getElement(container, scope);
    const templateEl = this.getTemplate(template, scope);

    if (!targetEl) {
      throw new Error("HTMLRenderer: container not found.");
    }

    if (!templateEl) {
      throw new Error("HTMLRenderer: template not found.");
    }

    if (!append) {
      this.clear(targetEl);
    }

    const fragment = document.createDocumentFragment();

    data.forEach((item) => {
      const itemFragment = this.createFragment(templateEl, template, item);
      fragment.appendChild(itemFragment);
    });

    const renderedNodes = Array.from(fragment.children);

    targetEl.appendChild(fragment);

    return renderedNodes;
  }

  createFragment(templateEl, templateConfig, data) {
    const clone = templateEl.content.cloneNode(true);

    Object.entries(templateConfig.tags ?? {}).forEach(([dataKey, config]) => {
      this.renderField(clone, data, dataKey, config);
    });

    return clone;
  }

  renderField(clone, data, dataKey, config) {
    const value = this.getValue(data, dataKey);

    // Simple syntax:
    // title: "[data-title]"
    if (typeof config === "string") {
      const element = clone.querySelector(config);
      this.setText(element, value);
      return;
    }

    // Advanced syntax:
    // startDate: { selector: "[data-start-time]", transform: ... }
    const {
      selector,
      type = "text",
      attr = null,
      fallback = "",
      removeIfEmpty = true,
      transform = null,
      value: customValue = null,
    } = config;

    const element = clone.querySelector(selector);

    if (!element) return;

    const rawValue = customValue ? customValue(data) : value;
    const finalValue = transform ? transform(rawValue, data) : rawValue;
    const output = finalValue ?? fallback;

    if (
      removeIfEmpty &&
      (output === "" || output === null || output === undefined)
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
      if (!attr) return;
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

    if (value === null || value === undefined || value === "") {
      element.remove();
      return;
    }

    element.textContent = value;
  }

  clear(container) {
    container.innerHTML = "";
  }

  getElement(elementOrSelector, scope = document) {
    if (!elementOrSelector) return null;

    if (elementOrSelector instanceof Element) {
      return elementOrSelector;
    }

    return scope.querySelector(elementOrSelector);
  }

  getTemplate(template, scope = document) {
    if (!template) return null;

    if (template instanceof HTMLTemplateElement) {
      return template;
    }

    if (template.element instanceof HTMLTemplateElement) {
      return template.element;
    }

    if (template.selector) {
      return (
        scope.querySelector(template.selector) ??
        document.querySelector(template.selector)
      );
    }

    return null;
  }
}
