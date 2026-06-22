// queries.js

export const queries = {
  calendar: {
    variables: null,

    query: `
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
    `,
  },
};
