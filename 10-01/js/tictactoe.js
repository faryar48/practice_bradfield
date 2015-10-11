
var render = function (facts) {
  // clear existing board UI
  [].concat(document.querySelectorAll('td'))
  .forEach(function (el) {
    el.innerHTML = ' '
  })

  // render new board UI from facts
  facts.forEach(function (fact, i) {
    var coord = document.querySelector('[data-coord ="' + fact.join(',') + '"' + ']')
    if (!coord.innerHTML) {
      coord.innerHTML = (i % 2 === 0) ? 'X' : 'O'
    }
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

if (!Array.prototype.last) {
    Array.prototype.last = function () {
        return this[this.length - 1]
    }
};

var playerAt = function (facts, coord) {
  var winner = ((facts.indexOf(coord)) % 2 === 0) ? '1' : '2'
  return winner
}

var getWinner = function (facts) {
  if (facts.length < 5) return
  var lastMove = facts.last()
  var sameCol = []
  var sameRow = []
  var sameDiagOne = []
  var sameDiagTwo = []

  var diagOne = [[0, 0], [1, 1], [2, 2]]
  var diagTwo = [[0, 2], [1, 1], [2, 0]]

  facts.forEach(function (fact) {
    if (fact[0] === lastMove[0]) {
      sameCol.push(fact)
    }
    if (fact[1] === lastMove[1]) {
      sameRow.push(fact)
    }
    diagOne.forEach(function (coord) {
      if (fact[0] === coord[0] && fact[1] === coord[1]) {
        sameDiagOne.push(fact)
      }
    })
    diagTwo.forEach(function (coord) {
      if (fact[0] === coord[0] && fact[1] === coord[1]) {
        sameDiagTwo.push(fact)
      }
    })
  })

  var winningCoordinates = []
  winningCoordinates = winningCoordinates.concat([sameRow]).concat([sameCol]).concat([sameDiagOne]).concat([sameDiagTwo])

  var winner = ''
  winningCoordinates.forEach(function (winCoords) {
    if (winCoords.length === 3 && winCoords.every(coord => (playerAt(facts, coord) === '1'))) {
      winner = '1'
    }
    if (winCoords.length === 3 && winCoords.every(coord => (playerAt(facts, coord) === '2'))) {
      winner = '2'
    }
  })

  return winner
}

var notIn = function (facts, targetFact) {
  return !facts.find(function (fact) {
    return (JSON.stringify(fact) === JSON.stringify(targetFact))
  })
}

var startGame = function () {
  var facts = []
  render(facts)
  document.addEventListener('click', function (event) {
    var coord = event.target.getAttribute('data-coord')
    if (!coord) return
    var firstValue = parseInt(coord[0], 10)
    var secondValue = parseInt(coord[2], 10)
    var fact = [firstValue, secondValue]
    if (facts.indexOf(fact) > -1) {
      return
    } else {
      if (notIn(facts, fact)) {
        facts.push(fact)
      }
      render(facts)
    }
  })
}

startGame()

