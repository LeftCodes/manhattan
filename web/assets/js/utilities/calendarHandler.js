// queryHandler.js

import { queries } from "./queries.js";
import { QueryHandler } from "./queryHandler.js";
import { paramsHandler } from "./paramsHandler.js";
import HTMLRenderer from "./htmlRenderer.js";

class CalendarHandler {
  constructor({ container = null, templates }) {
    if (!container) return;

    this.container = container;

    this.init();
    this.initListeners();
  }

  init() {
    this.queryHandler = new QueryHandler({
      container: this.container,
      query: queries.calendar.query,
      variables: queries.calendar.variables,
    });

    this.renderer = new HTMLRenderer();

    this.paramsHandler = paramsHandler;
    // subsribe to param changes
    this.handleParamsChange = this.handleParamsChange.bind(this);
    this.paramsHandler.onChange(this.handleParamsChange);

    // Setup
    this.weekdayContainers = this.container.querySelectorAll("[data-weekday]");
    this.templates = {
      event: {
        selector: "[data-template='calendar-event']",
        tags: {
          "groupClass.0.title": "[data-title]",

          startDate: {
            selector: "[data-start-time]",
            transform: (value) => this.formatTime(value),
          },

          endDate: {
            selector: "[data-end-time]",
            transform: (value) => this.formatTime(value),
          },
        },
      },

      daytime: {
        selector: "[data-template='calendar-daytime']",
        tags: {
          daytime: "[data-daytime]",
        },
      },

      empty: {
        selector: "[data-template='calendar-empty']",
      },
    };

    // week switch
    this.weekSwitch = document.querySelector(".calendar__week-switch");
    this.nextWeekBtn = this.weekSwitch.querySelector(".calendar__next-week");
    this.prevWeekBtn = this.weekSwitch.querySelector(".calendar__prev-week");
    this.currentWeekEl = this.weekSwitch.querySelector(
      ".calendar__current-week",
    );

    //data 
    this.data = null;
    this.groupClassSlug = this.getGroupClass();

    // state variables
    this.selectedClub = this.formatName(this.paramsHandler.get("club"));
    this.weekOffset = 0;
    this.currentWeekRange = this.updateCurrentWeekRange();

    this.handleWeekChange(0)
  }

  initListeners() {
    if (this.nextWeekBtn) {
      this.nextWeekBtn.addEventListener("click", () =>
        this.handleWeekChange(1),
      );
    }

    if (this.prevWeekBtn) {
      this.prevWeekBtn.addEventListener("click", () =>
        this.handleWeekChange(-1),
      );
    }

  }

  getGroupClass() {
    return window.location.pathname.match(/\/gruppen\/([^/]+)/)?.[1] ?? null;
  }

  // Fetch Data

  async loadData() {
    const variables = this.getCurrentWeekRange();
    const data = await this.queryHandler.fetch(variables);

    if (!data) return;

    this.data = data;

    this.renderCalendar(this.data);
  }

  // Week Handling

  updateCurrentWeekRange() {
    const newWeekRange = this.getCurrentWeekRange();

    this.renderCurrentWeekRange(newWeekRange);

    return newWeekRange;
  }

  getCurrentWeekRange() {
    const today = new Date();

    const day = today.getDay();
    const diffToMonday = day === 0 ? -6 : 1 - day;

    const monday = new Date(today);
    monday.setHours(0, 0, 0, 0);
    monday.setDate(today.getDate() + diffToMonday + this.weekOffset * 7);

    const sunday = new Date(monday);
    sunday.setHours(23, 59, 59, 999);
    sunday.setDate(monday.getDate() + 6);

    return {
      rangeStart: this.formatDateForGraphQL(monday),
      rangeEnd: this.formatDateForGraphQL(sunday),
    };
  }

  formatDateForGraphQL(date) {
    if (!(date instanceof Date) || Number.isNaN(date.getTime())) {
      console.error("Invalid date passed to formatDateForGraphQL:", date);
      return null;
    }

    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, "0");
    const day = String(date.getDate()).padStart(2, "0");

    return `${year}-${month}-${day}`;
  }

  renderCurrentWeekRange(weekRange) {
    if (!this.currentWeekEl || !weekRange) return;

    const startDate = new Date(`${weekRange.rangeStart}T00:00:00`);
    const endDate = new Date(`${weekRange.rangeEnd}T00:00:00`);

    const formatter = new Intl.DateTimeFormat("de-AT", {
      day: "2-digit",
      month: "2-digit",
      year: "2-digit",
    });

    const newWeekRange = `${formatter.format(startDate)} – ${formatter.format(endDate)}`;

    this.currentWeekEl.textContent = newWeekRange;
  }

  handleWeekChange(offset) {
    this.weekOffset += offset;
    this.currentWeekRange = this.updateCurrentWeekRange();

    this.loadData();
  }

  // Rendering

  renderCalendar(data) {
    console.log(data);
    const events = this.getFilteredEventsByClub(data);

    console.log(events);

    this.clearWeekdays();

    for (let weekday = 0; weekday < 7; weekday++) {
      const weekdayContainer = this.container.querySelector(
        `[data-weekday="${weekday}"]`,
      );

      if (!weekdayContainer) continue;

      const classContainer = weekdayContainer.querySelector(
        "[data-weekday-events]",
      );

      if (!classContainer) continue;

      const dayEvents = events
        .filter((event) => this.getWeekdayNumber(event.startDate) === weekday)
        .sort((a, b) => new Date(a.startDate) - new Date(b.startDate));

      const morningEvents = dayEvents.filter((event) =>
        this.isBeforeNoon(event.startDate),
      );

      const afternoonEvents = dayEvents.filter(
        (event) => !this.isBeforeNoon(event.startDate),
      );

      if (morningEvents.length) {
        this.renderDaytime(classContainer, "VM");

        morningEvents.forEach((event) => {
          this.renderEvent(classContainer, event);
        });
      } else {
        this.renderDaytime(classContainer, "VM");
        this.renderEmptyDay(classContainer);
      }

      if (afternoonEvents.length) {
        this.renderDaytime(classContainer, "NM");

        afternoonEvents.forEach((event) => {
          this.renderEvent(classContainer, event);
        });
      } else {
        this.renderDaytime(classContainer, "NM");
        this.renderEmptyDay(classContainer);
      }
    }
  }

  clearWeekdays() {
    this.container
      .querySelectorAll("[data-weekday-events]")
      .forEach((container) => {
        container.replaceChildren();
      });
  }

  // Outputs: Monday = 0, Sunday = 1, ...
  getWeekdayNumber(dateString) {
    const date = new Date(dateString);
    const day = date.getDay();
    return day === 0 ? 6 : day - 1;
  }

  formatTime(dateString) {
    if (!dateString) return "";
    return new Intl.DateTimeFormat("de-AT", {
      hour: "2-digit",
      minute: "2-digit",
    }).format(new Date(dateString));
  }

  renderDaytime(container, daytime) {
    this.renderer.renderOne({
      container,
      template: this.templates.daytime,
      data: {
        daytime,
      },
      scope: this.container,
      append: true,
    });
  }

  renderEvent(container, event) {
    const eventEl = this.renderer.renderOne({
      container,
      template: this.templates.event,
      data: event,
      scope: this.container,
      append: true,
    })[0];

    const eventClassUrl = event.groupClass[0].slug;

    if (this.groupClassSlugMatches(event)) {

      this.highlightEvent(eventEl);
    }
  }

  groupClassSlugMatches(event) {
    return event.groupClass[0].slug === this.groupClassSlug;
  }

  highlightEvent(element) {
    element.classList.add("highlighted");
  }

  renderEmptyDay(container) {
    this.renderer.renderOne({
      container,
      template: this.templates.empty,
      scope: this.container,
      append: true,
    });
  }

  isBeforeNoon(dateString) {
    const date = new Date(dateString);

    return date.getHours() < 12;
  }

  handleParamsChange(event) {
    const { action, value } = event.detail;

    if (action === "set") {
      this.selectedClub = this.formatName(value);
      this.renderCalendar(this.data)
    }
  }

  getFilteredEventsByClub(data) {
    const events = data?.solspace_calendar?.events ?? [];
    return events.filter((event) => this.formatName(event.calendar.name) === this.selectedClub);
  }

  // Helper Functions

  formatName(name) {
    return String(name || "")
      .toLowerCase()
      .replace(/\bclub\b/g, "")
      .replace(/\s+/g, " ")
      .trim();
  }
}

export function initCalendarHandler() {
  const calendarContainers = document.querySelectorAll(".calendar");

  if (!calendarContainers.length) return;

  calendarContainers.forEach((container) => {
    const calendarHandler = new CalendarHandler({
      container,
    });
  });
}

export { CalendarHandler };
