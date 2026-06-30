// queryHandler.js

import { queries } from "./queries.js";

class QueryHandler {
  constructor({
    container,
    query,
    variables = null,
    url = "/api",
    headers = {},
    autoFetch = false,
    onSuccess = null,
    onError = null,
  }) {
    if (!container) {
      throw new Error("QueryHandler requires a container.");
    }

    if (!query) {
      throw new Error("QueryHandler requires a GraphQL query.");
    }

    this.container = container;
    this.query = query;
    this.variables = variables;
    this.url = url;

    this.headers = {
      "Content-Type": "application/json",
      Accept: "application/json",
      "X-Craft-Gql-Cache": "no-cache",
      ...headers,
    };

    this.autoFetch = autoFetch;
    this.onSuccess = onSuccess;
    this.onError = onError;

    this.isLoading = false;
    this.abortController = null;

    this.init();
  }

  init() {
    if (this.autoFetch) {
      this.fetch();
    }
  }

  async fetch(variables = null) {
    try {
      this.setLoading(true);

      const data = await this.execute(variables);

      this.container.dispatchEvent(
        new CustomEvent("query:success", {
          detail: {
            data,
            handler: this,
          },
        }),
      );

      if (this.onSuccess) {
        this.onSuccess(data, this);
      }

      return data;
    } catch (error) {
      if (error.name === "AbortError") {
        return null;
      }

      console.error(error);

      this.container.dispatchEvent(
        new CustomEvent("query:error", {
          detail: {
            error,
            handler: this,
          },
        }),
      );

      if (this.onError) {
        this.onError(error, this);
      }

      return null;
    } finally {
      this.setLoading(false);
    }
  }

  async execute(variables = null) {
    const finalVariables = variables ?? this.variables;

    this.abortController = new AbortController();

    const response = await fetch(this.url, {
      method: "POST",
      headers: this.headers,
      body: JSON.stringify({
        query: this.query,
        variables: finalVariables,
      }),
      signal: this.abortController.signal,
    });

    const text = await response.text();

    let json;

    try {
      json = JSON.parse(text);
    } catch (error) {
      console.error("GraphQL response is not JSON:", text);
      throw error;
    }

    if (!response.ok) {
      throw new Error(`GraphQL HTTP error: ${response.status}`);
    }

    if (json.errors) {
      console.error("GraphQL errors:", json.errors);
      throw new Error("GraphQL returned errors.");
    }

    return json.data;
  }

  setLoading(isLoading) {
    this.isLoading = isLoading;

    this.container.classList.toggle("is-loading", isLoading);

    this.container.dispatchEvent(
      new CustomEvent("query:loading", {
        detail: {
          isLoading,
          handler: this,
        },
      }),
    );
  }

  abort() {
    if (this.abortController) {
      this.abortController.abort();
    }
  }

  setQuery(query) {
    this.query = query;
  }

  setVariables(variables) {
    this.variables = variables;
  }
}

export { QueryHandler };
