var myList = [ {start: 30, end: 150}, {start: 540, end: 600}, {start: 560, end: 620}, {start: 590, end: 670} ]

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


