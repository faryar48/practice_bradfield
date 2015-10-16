// var myList = [ {start: 30, end: 150}, {start: 540, end: 600}, {start: 560, end: 620}, {start: 610, end: 670} ]

var myList = [ {start: 30, end: 150}, {start: 540, end: 600}, {start: 540, end: 600}, {start: 560, end: 620}, {start: 610, end: 670} ]

var mainWidth = 600
var mainHeight = 720

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

var createRow = function (eventItem) {
  var row = {}
  row.start = eventItem.start
  row.end = eventItem.end
  var col = createCol(eventItem)
  row.children = [col]
  return row
}

var createCol = function (eventItem) {
  var col = {}
  col.start = eventItem.start
  col.end = eventItem.end
  col.children = [eventItem]
  return col
}

var eventsToEventTree = function (eventsList) {
  return eventsList.reduce(function (rows, eventItem) {
    var lastRow = rows[rows.length - 1]

    if (!lastRow || noOverlap(lastRow, eventItem)) {
      return rows.concat(createRow(eventItem))
    }

    // search fx to give us the col that has no overlap with the current eventItem
    var nonOverlappingCol = lastRow.children.find(function (col) {
      return noOverlap(col, eventItem)
    })

    // if we have a col that has no overlap with the current eventItem, then add the eventItem to the current col
    if (nonOverlappingCol) {
      nonOverlappingCol.end = eventItem.end
      nonOverlappingCol.children.push(eventItem)
      lastRow.end = eventItem.end
      return rows
    }

    // create a new col bc all of our other conditions have not been met
    lastRow.children.push(createCol(eventItem))
    lastRow.end = eventItem.end
    return rows
  }, [])
}






























