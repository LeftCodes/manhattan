// queryHandler.js

import { queries } from "./queries.js";
import { QueryHandler } from "./queryHandler.js";
import { paramsHandler } from "./paramsHandler.js";
import HTMLRenderer from "./htmlRenderer.js";

class CalendarHandler {
  constructor({ container = null, className }) {
    this.container = container;
    this.className = className;

    this.init();
    this.initListeners();
  }

  init() {
    if (!this.container) return;

    this.queryHandler = new QueryHandler({
      container: this.container,
      query: queries.calendar.query,
      variables: queries.calendar.variables,
    });

    this.renderer = new HTMLRenderer({
      container: this.container,
      list: this.container.querySelector(".calendar__list"),
      template: this.container.querySelector(".calendar__template"),

      tags: {
        title: "[data-title]",
        "calendar.name": "[data-calendar-name]",

        startDate: {
          selector: "[data-start-date]",
          type: "text",
          transform: (value) => this.formatDate(value),
        },
      },
    });

    this.paramsHandler = paramsHandler;

    // week switch
    this.weekSwitch = document.querySelector(".calendar__week-switch");
    this.nextWeekBtn = this.weekSwitch.querySelector(".calendar__next-week");
    this.prevWeekBtn = this.weekSwitch.querySelector(".calendar__prev-week");
    this.currentWeekEl = this.weekSwitch.querySelector(
      ".calendar__current-week",
    );

    // state variables
    this.selectedClub = this.paramsHandler.get("club");
    this.weekOffset = 0;
    this.currentWeekRange = this.updateCurrentWeekRange();

    console.log(this.selectedClub);
    console.log(this.weekOffset);

    this.loadData();
  }

  initListeners() {
    this.nextWeekBtn.addEventListener("click", () => this.handleWeekChange(1));
    this.prevWeekBtn.addEventListener("click", () => this.handleWeekChange(-1));
  }

  // Fetch Data

  async loadData() {
    const variables = this.getCurrentWeekRange();
    const data = await this.queryHandler.fetch(variables);

    if (!data) return;

    this.data = data;

    console.log("Calendar data:", this.data);

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

    console.log(monday);

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

    console.log(newWeekRange);

    this.currentWeekEl.textContent = newWeekRange;
  }

  handleWeekChange(offset) {
    this.weekOffset += offset;
    this.currentWeekRange = this.updateCurrentWeekRange();

    console.log(this.handleWeekChange);
    

    this.loadData();
  }

  // Rendering

  renderCalendar(data) {}

  renderClass(cardData) {}
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
