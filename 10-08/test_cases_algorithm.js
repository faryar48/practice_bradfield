var equals = function (a, b) {
  return JSON.stringify(a) === JSON.stringify(b)
}

var E = function (start, end) {
  return {start: start, end: end}
}

var G = function (start, end, children) {
  return {start: start, end: end, children: children}
}

var R = G
var C = G

var eventsToEventTree_test_cases = [
  {
    given: [
    {start: 30, end: 150},
    {start: 540, end: 600},
    {start: 540, end: 600},
    {start: 560, end: 620},
    {start: 610, end: 670} ],
    expected: [
      R(30, 150, [
        C(30, 150, [
          E(30, 150),
        ]),
      ]),
      R(540, 670, [
        C(540, 670, [
          E(540, 600),
          E(610, 670),
        ]),
        C(540, 600, [
          E(540, 600),
        ]),
        C(560, 620, [
          E(560, 620),
        ]),
      ]),
    ],
  },
]

var eventTreeToPositionedEvents_test_cases = [
  {
    given: {
      containerWidth: 600,
      containerHeight: 720,
      rows: [
        R(30, 150, [
          C(30, 150, [
            E(30, 150),
          ]),
        ]),
        R(540, 670, [
          C(540, 670, [
            E(540, 600),
            E(610, 670),
          ]),
          C(560, 620, [
            E(560, 620),
          ]),
        ]),
      ],
    },
    expected: [
      {
        'width': 600,
        'height': 120,
        'top': 30,
        'left': 0,
      },
      {
        'width': 300,
        'height': 60,
        'top': 540,
        'left': 0,
      },
      {
        'width': 300,
        'height': 60,
        'top': 610,
        'left': 0,
      },
      {
        'width': 300,
        'height': 60,
        'top': 560,
        'left': 300,
      },
    ],
  },
]

// eventTreeToPositionedEvents_test_cases.forEach(function (test_case) {
//   var actual = eventTreeToPositionedEvents(test_case.given.rows, test_case.given.containerWidth, test_case.given.containerHeight)
//   if (equals(actual, test_case.expected)) {
//     console.log('test case passes')
//   } else {
//     console.log('fails', JSON.stringify(actual), JSON.stringify(test_case.expected))
//   }
// })

eventsToEventTree_test_cases.forEach(function (test_case) {
  var actual = eventsToEventTree(test_case.given)
  if (equals(actual, test_case.expected)) {
    console.log('test case passes')
  } else {
    console.log('fails', actual, test_case.expected)
  }
})
