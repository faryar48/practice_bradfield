// "width: 600px; height: 120px; top: 30px; left: 0px"

// <div class="box event" style="width: 600px; height: 120px; top: 30px; left: 0px"></div>

var positionedEvent = {
  'width': 600,
  'height': 120,
  'top': 30,
  'left': 0,
}

var positionedEventList = [
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
    'top': 560,
    'left': 300,
  },
  {
    'width': 300,
    'height': 50,
    'top': 610,
    'left': 0,
  },
]

var creatEventElement = function (positionedEvent) {
  var eventStyles = createEventStyles(positionedEvent)
  return '<div class="box event" style=" ' + eventStyles + '"></div>'
}

var createEventStyles = function (positionedEvent) {
  return Object.keys(positionedEvent).map(function (key) {
    return key + ': ' + positionedEvent[key] + 'px'
  }).join('; ')
}

var createDayBox = function (positionedEventList, height, width) {
  return '<div class="box" style="width: ' + width + 'px; ' + 'height: ' + height + 'px; ' + 'position: relative"' + '>' +
    positionedEventList.map(creatEventElement).join('')
   + '</div>'
}

var layoutDay = function (events) {
  document.querySelector('main').innerHTML = (createDayBox(positionedEventList, 720, 600))
}



layoutDay()
console.log(createDayBox(positionedEventList, 720, 600))

<div class="box" style="width: 600px; height: 720px; position: relative">
  <div class="box event" style=" width: 600px; height: 120px; top: 30px; left: 0px"></div>
  <div class="box event" style=" width: 300px; height: 60px; top: 540px; left: 0px"></div><div class="box event" style=" width: 300px; height: 60px; top: 560px; left: 300px"></div>
  <div class="box event" style=" width: 300px; height: 50px; top: 610px; left: 0px"></div>
</div>



