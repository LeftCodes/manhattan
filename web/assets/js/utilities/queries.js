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
        ... on clubBrunn_Event {
            groupClass {
            title
              slug
              url
            }
          }
          ... on clubWien_Event {
            groupClass {
            title
              slug
            }
          }
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
