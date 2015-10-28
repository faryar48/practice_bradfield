var fs = require('fs')
global.Promise = require('bluebird')

var readFile = function (fileName) {
  return new Promise(function (resolve, reject) {
    fs.readFile(fileName, function (err, fileContents) {
      if (err) { return reject(err) }
      resolve(fileContents)
    })
  })
}

var readContainedFile = function (containerFileName) {
  return readFile(containerFileName)
  .then(function (fileContents) {
    var fileNameToRead = fileContents.toString().trim() + '.txt'
    return readFile(fileNameToRead)
  })
  .then(function (fileContents) {
    return fileContents.toString().trim()
  })
}

readContainedFile('container.txt')
.then(function (contents) {
  console.log(contents)
})

// .catch(function (err) {
//   console.log(err)
// })

// var contents
// var contentsPromise = readFile('container.txt')
// contentsPromise.then(function (fileContents) {
//   console.log(fileContents.toString().trim())
// })

// console.log(contentsPromise)
// setTimeout(function () {
//   console.log(contentsPromise)
// }, 1000)
