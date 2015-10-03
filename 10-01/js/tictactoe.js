var sampleGameFacts = [[1, 1], [0, 0], [2, 2], [0, 2], [0, 1], [2, 1], [1, 2], [1, 0], [2, 0]]

var render = function (facts) {
  // clear existing board UI
  [].concat(document.querySelectorAll('td'))
  .forEach(function (el) {
    el.innerHTML = ' '
  })
  // render new board UI from facts
  facts.forEach(function (fact, i) {
    var coord = document.querySelector(
      '[data-coord ="' + fact.join(',') + '"' + ']')
    coord.innerHTML = (i % 2 === 0) ? 'X' : 'O'
  })
  var turnElement = document.querySelector('[data-turn]')
  turnElement.innerText = (facts.length % 2 === 0) ? '1' : '2'

  var winner = getWinner(facts)
  var showWinnerEl = document.querySelector('[data-winner]')
  showWinnerEl.style.visibility = 'hidden'


  if (winner) {
    var whoIsWinnerEl = document.querySelector('[data-winner-player]')
    whoIsWinnerEl.innerText = winner
    showWinnerEl.style.visibility = 'visible'
  }


}

var getWinner = function (facts) {
  return
}

var startGame = function () {
  var facts = []
  render(facts)
  document.addEventListener('click', function (event) {
    var coord = event.getAttribute('data-coord')
    if (!coord) return
    // make it a pair
    // if already exists in the list of facts, early return
    // if not add it to the list of facts and render
  })
}

console.log(getWinner([0, 0]))
console.log(getWinner([0, 0], [0, 1], [1, 0], [0, 2], [2, 0]))


startGame()

// render(sampleGameFacts)
// render([[1, 1], [0, 0], [2, 2], ])
