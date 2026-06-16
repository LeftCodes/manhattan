class ParamsHandler {
  constructor(options = {}) {
    this.options = {
      updateHistory: "push", // "push" or "replace"
      reload: false,
      eventName: "urlParamsChange",
      ...options,
    };

    this.refreshUrl();
    this.bindPopState();
  }

  refreshUrl() {
    this.url = new URL(window.location.href);
  }

  get(paramName) {
    this.refreshUrl();
    return this.url.searchParams.get(paramName);
  }

  getAll(paramName) {
    this.refreshUrl();
    return this.url.searchParams.getAll(paramName);
  }

  has(paramName) {
    this.refreshUrl();
    return this.url.searchParams.has(paramName);
  }

  set(paramName, value) {
    if (!paramName || value === undefined || value === null || value === "") {
      return this.delete(paramName);
    }

    this.refreshUrl();

    const oldValue = this.url.searchParams.get(paramName);

    this.url.searchParams.set(paramName, value);
    this.updateUrl();

    this.emitChange({
      action: "set",
      paramName,
      value,
      oldValue,
    });

    return value;
  }

  setMany(params = {}) {
    this.refreshUrl();

    const changedParams = {};

    Object.entries(params).forEach(([key, value]) => {
      const oldValue = this.url.searchParams.get(key);

      if (value === undefined || value === null || value === "") {
        this.url.searchParams.delete(key);
        changedParams[key] = {
          action: "delete",
          value: null,
          oldValue,
        };
      } else {
        this.url.searchParams.set(key, value);
        changedParams[key] = {
          action: "set",
          value,
          oldValue,
        };
      }
    });

    this.updateUrl();

    this.emitChange({
      action: "setMany",
      params: changedParams,
    });

    return params;
  }

  delete(paramName) {
    if (!paramName) return null;

    this.refreshUrl();

    const oldValue = this.url.searchParams.get(paramName);

    this.url.searchParams.delete(paramName);
    this.updateUrl();

    this.emitChange({
      action: "delete",
      paramName,
      value: null,
      oldValue,
    });

    return null;
  }

  clear() {
    this.refreshUrl();

    const oldParams = Object.fromEntries(this.url.searchParams.entries());

    this.url.search = "";
    this.updateUrl();

    this.emitChange({
      action: "clear",
      params: oldParams,
    });
  }

  updateUrl() {
    const newUrl = this.url.toString();

    if (this.options.reload) {
      window.location.href = newUrl;
      return;
    }

    if (this.options.updateHistory === "replace") {
      window.history.replaceState({}, "", newUrl);
    } else {
      window.history.pushState({}, "", newUrl);
    }
  }

  emitChange(detail = {}) {
    window.dispatchEvent(
      new CustomEvent(this.options.eventName, {
        detail: {
          ...detail,
          url: this.url.toString(),
          search: this.url.search,
          params: Object.fromEntries(this.url.searchParams.entries()),
        },
      }),
    );
  }

  onChange(callback) {
    if (typeof callback !== "function") return;

    window.addEventListener(this.options.eventName, callback);
  }

  offChange(callback) {
    if (typeof callback !== "function") return;

    window.removeEventListener(this.options.eventName, callback);
  }

  bindPopState() {
    window.addEventListener("popstate", () => {
      this.refreshUrl();

      this.emitChange({
        action: "popstate",
      });
    });
  }

  setParamByAttribute(element, options = {}) {
    if (!element) return null;

    const paramName = options.paramName || element.dataset.param;
    const value = options.value || element.dataset.value;

    if (!paramName) return null;

    return this.set(paramName, value);
  }

  getParamByAttribute(element, fallbackParamName = null) {
    if (!element) return null;

    const paramName = element.dataset.param || fallbackParamName;

    if (!paramName) return null;

    return this.get(paramName);
  }

  isActiveByAttribute(element, options = {}) {
    if (!element) return false;

    const paramName = options.paramName || element.dataset.param;
    const value = options.value || element.dataset.value;

    if (!paramName) return false;

    return this.get(paramName) === value;
  }

  createUrlWithParam(href, paramName, value) {
    if (!href || !paramName) return href;

    const url = new URL(href, window.location.origin);

    if (value === undefined || value === null || value === "") {
      url.searchParams.delete(paramName);
    } else {
      url.searchParams.set(paramName, value);
    }

    return url.toString();
  }
}

export const paramsHandler = new ParamsHandler({
  updateHistory: "replace",
  reload: false,
});
