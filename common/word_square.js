/**
 *
 * Leetcode 425
 * Given a set of words (without duplicates), find all word squares you can build from them.

A sequence of words forms a valid word square if the kth row and column read the exact same string, where 0 ≤ k < max(numRows, numColumns).

For example, the word sequence ["ball","area","lead","lady"] forms a word square because each word reads the same both horizontally and vertically.

b a l l
a r e a
l e a d
l a d y

Note:
There are at least 1 and at most 1000 words.
All words will have the exact same length.
Word length is at least 1 and at most 5.
Each word contains only lowercase English alphabet a-z.
 */

/**
 * @param {string[]} words
 * @return {string[][]}
 */
var wordSquares = function(words) {
  let n = words[0].length;
  let mat = new Array(n);
  for(let i = 0; i < n; i++){
    mat[i] = new Array(n);
  }
  let taken = {};
  let result = [];
  let prefixTable = getPrefixTable(words);

  for(let i = 0; i < words.length; i++){
    backTrace(taken, mat, prefixTable, words[i], result, n, 0)
  }
  return result;
};

function backTrace(taken, mat, prefixTable, word, result, n, rc){
    addToMatrix(mat, word, n, rc);
    if(rc == n - 1){
      let arr = [];
      for(let i = 0; i < n; i++){
        arr.push(mat[i].join(""));
      }
      result.push(arr);
      taken[word] = false;
      return;
    }

    let prefix = createPrefixFromMatrix(mat, rc + 1);
    let prefixedWords = prefixTable[prefix];
    if(prefixedWords != null){
      for(let i = 0; i < prefixedWords.length; i++){
        backTrace(taken, mat, prefixTable, prefixedWords[i], result, n, rc + 1);
      }
    }
}

function createPrefixFromMatrix(mat, index){
  let str = "";
  for(let i = 0; i < index; i++){
    str += mat[index][i];
  }
  return str;
}

function addToMatrix(mat, word, n, rc){
  for(let i = 0; i < n; i++){
    mat[rc][i] = word[i];
    mat[i][rc] = word[i];
  }
}

function getPrefixTable(words){
  let prefixTable = {};
  for(let i = 0; i < words.length; i++){
    createPrefixFor(prefixTable, words[i]);
  }
  return prefixTable;
}

function createPrefixFor(prefixTable, word){
  for(let i = 0; i <= word.length; i++){
    let prefix = word.substring(0,i);
    if(prefixTable[prefix] == null){
      prefixTable[prefix] = [];
    }
    prefixTable[prefix].push(word);
  }
}
