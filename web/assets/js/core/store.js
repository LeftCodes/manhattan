// core/store.js
export function createStore(initial = {}) {
  const subs = new Map(); // key -> Set<fn>
  const state = { ...initial };

  const api = {
    get: (k) => (k ? state[k] : { ...state }),
    set: (partial) => {
      const changed = [];
      for (const [k, v] of Object.entries(partial)) {
        if (state[k] !== v) {
          state[k] = v;
          changed.push(k);
        }
      }
      if (!changed.length) return;
      for (const k of changed)
        subs.get(k)?.forEach((fn) => fn(state[k], k, { ...state }));
      subs.get("*")?.forEach((fn) => fn({ ...state }, "*"));
    },
    subscribe: (key, fn) => {
      const k = key ?? "*";
      if (!subs.has(k)) subs.set(k, new Set());
      subs.get(k).add(fn);
      // fire immediately
      fn(k === "*" ? { ...state } : state[k], k, { ...state });
      return () => subs.get(k)?.delete(fn);
    },
  };
  return api;
}

// default singleton
export const store = createStore({ isLocked: false, scrollY: 0 });

