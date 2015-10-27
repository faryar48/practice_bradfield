var fs = require('fs')
var readContainedFile = function (containerFileName, callback) {
  fs.readFile(containerFileName, function (err, fileContent) {
    if (err) { return callback(err) }
    var fileNameToRead = fileContent.toString().trim() + '.txt'
    fs.readFile(fileNameToRead, function (err, fileContent) {
      if (err) { return callback(err) }
      callback(null, fileContent.toString().trim())
    })
  })
}

// console.log('before read call')
// fs.readFile('container.txt', function (err, fileContent) {
//   if (err) { throw err }
//   console.log(fileContent.toString())
//   console.log('after call back call')
// })
// console.log('after read call')

readContainedFile('container.txt', function (err, contents) {
  if (err) { throw err }
  console.log(contents)
})

