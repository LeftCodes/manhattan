// filterHandler.js

import { initFilterManager } from "./filterManager.js";

const URL = "/api";

let pagination = {
  limit: 12,
  offset: 0,
};

export function initFilterHandler() {
  const filter = document.querySelector(".filter");
  if (!filter) return;

  const filterList = filter.querySelector(".filter__list");
  const filterLoadMore = filter.querySelector(".filter__load-more");
  const template = filter.querySelector(".filter-card-template");

  let isReady = false;
  let initPromise = null;

  // -----------------------------
  // Curated list setup
  // -----------------------------

  const isCurated = false;
  let curatedEntryIds = [];
  let curatedIndexMap = new Map(null);

  // -----------------------------
  // Filter Manager
  // -----------------------------
  const filterManager = initFilterManager(filter, {
    onSelectionChange: () => {
      if (!isReady) return;
      console.log("onSelectionChange");

      setTimeout(() => triggerQuery(), 0);
    },
  });

  // -----------------------------
  // Helpers
  // -----------------------------
  function setLoading(isLoading) {
    const loadingEl = filter.querySelector(".calendar-card__card-loading");
    if (loadingEl) loadingEl.style.display = isLoading ? "block" : "none";
    filterList.classList.toggle("loading", isLoading);
  }

  function toggleNoResults(show) {
    const noResultEl = filter.querySelector(".calendar-card__card-no-result");
    if (noResultEl) noResultEl.style.display = show ? "block" : "none";
  }

  // -----------------------------
  // Build query variables
  // -----------------------------

  function buildVariables() {
    let categories =
      filterManager.activeFilters.size > 0
        ? Array.from(filterManager.activeFilters)
        : null;

    if (categories) categories.unshift("AND");

    return {
      // language: [filter.dataset.language],
      categories,
      ids: curatedEntryIds,
      limit: pagination.limit,
      offset: pagination.offset,
    };
  }

  // -----------------------------------------------
  // GraphQL queries
  // -----------------------------------------------

  function queryEntries() {
    return `
     query {
  solspace_calendar {
    calendars {
      id
      uid
      name
      handle
      description
      color
      lighterColor
      darkerColor
      icsHash
      allowRepeatingEvents

      events(loadOccurrences: false) {
        id
        uid
        postDate
        calendarId
        #calendar - allows you to select events calendar data
        title
        authorId
        startDate
        startDateLocalized
        initialStartDate
        endDate
        endDateLocalized
        initialEndDate
        allDay
        rrule
        freq
        interval
        count
        until
        untilLocalized
        byMonth
        byYearDay
        byMonthDay
        byDay
      }
    }
  }
}
  `;
  }

  // -----------------------------
  // Fetch Entries
  // -----------------------------
  async function fetchEntries(variables) {
    const response = await fetch(URL, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
        "X-Craft-Gql-Cache": "no-cache",
      },
      body: JSON.stringify({
        query: queryEntries(),
        variables,
      }),
    });

    const text = await response.text();

    let json;

    try {
      json = JSON.parse(text);
    } catch (e) {
      console.error("Response is not JSON:", text);
      throw e;
    }

    if (!response.ok || json.errors) {
      console.error("GraphQL errors:", json.errors);
      throw new Error(`GraphQL error / HTTP ${response.status}`);
    }

    return json.data;
  }

  // -----------------------------
  // Fetch + Render
  // -----------------------------
  let allEntries = [];
  async function triggerQuery(loadMore = false) {
    if (!isReady) return;

    if (!loadMore) {
      allEntries = [];
      pagination.offset = 0;
      filterList.innerHTML = "";
      toggleNoResults(false);
    }

    filterLoadMore.disabled = true;

    setLoading(true);
    const variables = buildVariables();

    try {
      // 1. Fetch date entries
      const { entries, total } = await fetchEntries(variables);

      console.log(entries);

      // If we are loading more but no more entries exist → stop early
      if (loadMore && entries.length === 0) {
        setLoading(false);
        return;
      }

      // 2. Append or replace display list (render)
      if (loadMore) {
        allEntries.push(...entries);
        renderEntries(entries, true);
      } else {
        allEntries = entries;
        renderEntries(allEntries, false);
      }

      if (!loadMore && total === 0) {
        toggleNoResults(true);
        setLoading(false);
        return;
      }

      pagination.offset += pagination.limit;

      filterLoadMore.disabled = allEntries.length >= total;

      requestAnimationFrame(() => {
        filterList.querySelectorAll(".filter-card").forEach((card) => {
          card.classList.add("visible");
        });
      });
    } catch (err) {
      console.error(err);
    } finally {
      setLoading(false);
    }
  }

  // -----------------------------
  // Render helpers
  // -----------------------------
  function setText(el, value) {
    if (!el) return;
    value ? (el.textContent = value) : el.remove();
  }

  function setHTML(el, value) {
    if (!el) return;
    value ? (el.innerHTML = value) : el.remove();
  }

  function setImage(pictureElement, image) {
    if (!pictureElement || !image) return;

    const sources = pictureElement.querySelectorAll("source");
    const img = pictureElement.querySelector("img");

    sources.forEach((source) => {
      const media = source.getAttribute("media");

      if (media === "(min-width:600px)") {
        source.setAttribute("srcset", image.url800);
      } else if (media === "(min-width:400px)") {
        source.setAttribute("srcset", image.url600);
      }
    });

    if (img) {
      img.setAttribute("src", image.url400);
      img.setAttribute("alt", image.alt || "");
    }
  }

  function setVideo(video, url) {
    if (!video) return;
    if (url) {
      video.src = url;
    } else {
      video.remove();
    }
  }

  // -----------------------------
  // Render Entries
  // -----------------------------
  function renderEntries(entries, append = false) {
    if (!append) filterList.innerHTML = "";

    const fragment = document.createDocumentFragment();

    entries.forEach((entry) => {
      const clone = template.content.cloneNode(true);
      const card = clone.querySelector("li");

      // ---- Main link
      const link = entry.url;
      clone.querySelector(".filter-card__link").href = link;

      // ---- Title & text
      setText(clone.querySelector(".filter-card__title"), entry.title);
      setText(
        clone.querySelector(".filter-card__subtitle"),
        entry.subtitleText,
      );

      // ---- Media
      if (entry.mediaElement.mediaType == "image") {
        setImage(
          clone.querySelector(".filter-card__image"),
          entry.mediaElement.image?.[0],
        );
        setVideo(clone.querySelector(".filter-card__video"), "");
      } else if (entry.mediaElement.mediaType == "video") {
        clone.querySelector(".filter-card__image").remove();
        setVideo(
          clone.querySelector(".filter-card__video"),
          entry.mediaElement.video?.[0]?.url,
        );
      }

      // ---- Metadata
      if (card) card.dataset.entryId = entry.id;

      fragment.appendChild(clone);
    });

    filterList.appendChild(fragment);
  }

  // Load more button
  filterLoadMore.addEventListener("click", () => {
    triggerQuery(true);
    console.log("filter load more btn");
  });

  // ––––––––––––––––––––––––
  // Initial load
  // ––––––––––––––––––––––––

  async function init() {
    if (initPromise) return initPromise;

    initPromise = (async () => {
      try {
        setLoading(true);
        isReady = true;
        console.log("initial load");

        await triggerQuery();
      } catch (err) {
        console.error(err);
      } finally {
        setLoading(false);
      }
    })();

    return initPromise;
  }

  init();
}
