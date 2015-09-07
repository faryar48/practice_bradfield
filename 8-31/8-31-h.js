  $(document).ready(function() {
      // Problem 1 

      // Loop over the first 10 whole numbers, add them together, use a for loop.

      // var count = 0; 
      // for (var i = 1; i <= 10; i++) {
      //   count += i; 
      // };
      // console.log(count); 


      // use a while loop 


      // var count = 0; 
      // var x = 1; 
      // while (x <= 10) {
      //   count += x; 
      //   x += 1; 
      // }

      // console.log(count); 


      // Instead of adding the values together, collect them into an list.

      // var count = []; 
      // for (var i = 1; i <= 10; i++) {
      //   count.push(i); 
      // };
      // console.log(count); 

      // Write a range(start, end) function that returns the list of numbers in that array

      // var rangeFunction = function(start, end) {
      //   // console.log(start, end); 
      //   var count = []; 
      //   rangeLength = end - start; 
      //   // console.log(rangeLength); 
      //   for (var i = start; i <= end; i++) {
      //     count.push(i); 
      //   };
      //   console.log(count); 
      // }

      // rangeFunction(14, 30); 


      // Use the forEach function over that array to sum the numbers in the array 

      // var rangeFunction = function(start, end) {
      //   // console.log(start, end); 
      //   var count = []; 
      //   rangeLength = end - start; 
      //   // console.log(rangeLength); 
      //   for (var i = start; i <= end; i++) {
      //     count.push(i); 
      //   };
      //   console.log("array:", count); 
      //   counter = 0; 
      //   count.forEach(function(num) {
      //     counter += num; 
      //   });  
      //   console.log(counter); 
      // }; 

      // rangeFunction(14, 16); 





      // the method below uses a function instead of forEach 

      // var addArrayItems = function(array) {
      //   var counter = 0; 
      //   var start = array[0]
      //   var end = array[0] + array.length - 1; 
      //   for (var i = start; i <= end; i++) {
      //     counter += i; 
      //   };
      //   console.log("answer:", counter); 
      // }; 


      // var rangeFunction = function(start, end) {
      //   // console.log(start, end); 
      //   var count = []; 
      //   rangeLength = end - start; 
      //   // console.log(rangeLength); 
      //   for (var i = start; i <= end; i++) {
      //     count.push(i); 
      //   };
      //   console.log("array:", count); 
      //   addArrayItems(count);  
      // }; 

      // rangeFunction(14, 16); 





      // Use the reduce function to sum the numbers in the array

      // var sum = function(numbers) {
      //   numbers.reduce(function(memo, num) {
      //     console.log(memo + num); 
      //     return memo + num; 
      //   }, 0); 
      // }; 
      // var range = function(start, end) {
      //   var numbers = []; 
      //   for (var i = start; i <= end; i++) {
      //     numbers.push(i); 
      //   };
      //   console.log(numbers); 
      //   return numbers
      // }; 


      // sum(range(2, 5)) // 14



      // Use the reduce function over an array to filter it to only the even numbers

      var even = function(numbers) {
        return numbers.reduce(function(memo, num) {
          if (num % 2 === 0) {
            // console.log(memo.concat(num)); 
            return memo.concat(num); 
          } else {
            // console.log(memo); 
            return memo; 
          }
        }, []); 
      }; 

      var range = function(start, end) {
        var numbers = []; 
        for (var i = start; i <= end; i++) {
          numbers.push(i); 
        };
        return numbers; 
      }; 

      even(range(2, 9)) // [2, 4, 6, 8]


      // Write a function that joins a list of strings with some delimiter


      var joiner = function (strings, delimiter) {
        return strings.reduce(function(memo, s) {
          return memo + delimiter + s; 
        }); 
      }; 


      myList = ["My", "name", "is", "Faryar"]; 
      myDelimiter = ", "; 
      mySecondDelimiter = " "; 
      joiner(myList, myDelimiter); // "My, name, is, Faryar"
      joiner(myList, mySecondDelimiter); // "My name is Faryar"

      // console.log(joiner(myList, myDelimiter)); 
      // console.log(joiner(myList, mySecondDelimiter)); 



      // Write a function that returns the maximum value in a list

      var max = function(list) {
        return list.reduce(function(max, num) {
          if (num > max) {
            return num; 
          } else {
            return max; 
          }
        }); 
      }; 

      myList = [2, 3, 6, 5, 10, 30, 1]; // 30
      max(myList); 

      console.log(max(myList)); 


      // Write a function that returns the first matching element in a list








  });















