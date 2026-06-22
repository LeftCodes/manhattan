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

    // filter
    this.selectedClub = this.paramsHandler.get("club");

    console.log(this.selectedClub);
    
    this.loadData();
  }

  async loadData() {
    const data = await this.queryHandler.fetch();

    if (!data) return;

    this.data = data;

    console.log("Calendar data:", this.data);

    this.renderCalendar(this.data);
  }

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
