var myList = [ {start: 30, end: 150}, {start: 540, end: 600}, {start: 560, end: 620}, {start: 610, end: 670} ]

// var myList = [ {start: 30, end: 150}, {start: 540, end: 600}, {start: 560, end: 620}, {start: 590, end: 670} ]

// var myList = [
//   { start:   0, end:  180 },
//   { start:  30, end:  90 },
//   { start:  60, end:  120 },
//   { start:  150, end:  180 },
//   { start:  210, end: 300 },
//   { start:  210, end:  270 },
//   { start:  150, end:  240 },
//   { start:  240, end: 300 },
//   { start: 330, end: 360 },
//   { start: 390, end: 420 },
//   { start: 390, end: 480 },
//   { start: 420, end: 480 },
//   { start: 510, end: 600 },
//   { start: 510, end: 580 },
// ]

// output = var positionedEventList = [
//   {
//     'width': 600,
//     'height': 120,
//     'top': 30,
//     'left': 0,
//   },
//   {
//     'width': 300,
//     'height': 60,
//     'top': 540,
//     'left': 0,
//   },
//   {
//     'width': 300,
//     'height': 60,
//     'top': 560,
//     'left': 300,
//   },
//   {
//     'width': 300,
//     'height': 60,
//     'top': 610,
//     'left': 0,
//   },
// ]

var mainWidth = 600
var mainHeight = 720

var findEventWidth = function (list, targetKey, counter) {
  if (counter === undefined) {
    counter = 0
  }
  var overlapArray = []
  list = list.sort()
  list.forEach(function (key) {
    if ((key['start'] > targetKey['start'] && key['start'] < targetKey['end']) || (key['end'] > targetKey['start'] && key['start'] < targetKey['end'])) {
      counter += 1
      if (key !== targetKey) {
        overlapArray.push(key)
      }
    }
  })
  if (overlapArray.length > 1) {
    console.log('counter before recursion', counter)
    var counterBeforeRecursion = counter
    findEventWidth(overlapArray, overlapArray[0], counter)
  }
  // console.log('overlapArray', overlapArray, targetKey)
  console.log('counter after recursion', counter)
  return counter
}

// if counterBeforeRecusion is true (if it went into the if statement in the first place)
// if ((counterAfterRecursion - counterBeforeRecursion)  === (counterBeforeRecursion - 1)) {
//  return counterBeforeRecursion
// } else {
//  return counterBeforeRecursion - 1
// }
// else return counter

var findEventLeft = function (list, width, targetKey) {
  if (width === mainWidth) {
    return 0
  } else {
    return 0
  }
}

var positionedEventsFromStartToEndEvents = function (list) {
  var positionedEventList = []
  // var eventRanges = []
  list.map(function (key) {
    var eventHeight = key['end'] - key['start']
    var eventTop = key['start']
    var eventWidth = (mainWidth / findEventWidth(list, key))
    var eventLeft = findEventLeft(list, eventWidth, key)
    // positionedEventList.push("{ 'width': " + eventWidth + ", 'height': " + eventHeight + ", 'top': " + eventTop + ", 'left': " + eventLeft + ", }")
    positionedEventList.push({
      width: eventWidth,
      height: eventHeight,
      top: eventTop,
      left: eventLeft,
    })
  })
  return positionedEventList
}

console.log(positionedEventsFromStartToEndEvents(myList))

var eventTreeToPositionedEvents = function (rows, containerWidth, containerHeight) {
  return rows.reduce(function (eventsList, row) {
    return eventsList.concat(row.children.reduce(function (eventsList, col, col_index) {
      return eventsList.concat(col.children.reduce(function (eventsList, event) {
        var positionedEvent = {}
        positionedEvent.width = containerWidth / row.children.length
        positionedEvent.height = event.end - event.start
        positionedEvent.top = event.start
        positionedEvent.left = col_index * positionedEvent.width
        return eventsList.concat(positionedEvent)
      }, []))
    }, []))
  }, [])
}

var noOverlap = function (lastItem, currentItem) {
  return lastItem.end <= currentItem.start
}

var eventsToEventTree = function (eventsList) {
  return eventsList.reduce(function (rows, eventItem) {
    var lastRow = rows[rows.length - 1]
    if (!lastRow || noOverlap(lastRow, eventItem)) {
      var row = {}
      row.start = eventItem.start
      row.end = eventItem.end
      var col = {}
      col.start = eventItem.start
      col.end = eventItem.end
      col.children = [eventItem]
      row.children = [col]
      return rows.concat(row)
    }
    row.children.forEach(function (col) {
      if (noOverlap(col, eventItem)) {
        col.children.push(eventItem)
      }
    })
    var col = {}
    col.start = eventItem.start
    col.end = eventItem.end
    col.children = [eventItem]
    lastRow.end = eventItem.end
    lastRow.children.push(col)
    return rows
  }, [])
}

































