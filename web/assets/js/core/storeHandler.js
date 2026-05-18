import { createStore } from "./store.js";

// DEFAULT STORE
// define global variables that can be accessible from every module
export const store = createStore({
  isLocked: false, // create variables with values, prefferably no functions, just static values
  scrollY: 0,
});

// CREATE MORE STORES HERE
