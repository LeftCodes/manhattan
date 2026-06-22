// queries.js

export const queries = {
  calendar: {
    variables: null,

    query: `
    query CalendarWeek($rangeStart: String, $rangeEnd: String) {
          solspace_calendar {
            events(
              rangeStart: $rangeStart
              rangeEnd: $rangeEnd
              loadOccurrences: true
            ) {
              title
              startDate
              endDate

              calendar {
                id
                name
                handle
              }
            }
      }
    }
    `,
  },
};
