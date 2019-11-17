/**
 * @param {string} beginWord
 * @param {string} endWord
 * @param {string[]} wordList
 * @return {string[][]}
 */
var findLadders = function(beginWord, endWord, wordList) {
	return findLadder(beginWord, endWord, createHash(wordList));
};

function findLadder(beginWord, endWord, wordhash){
	let result = [];
	let visited = {};
	recurseFind(beginWord, endWord, wordhash, result, visited, [beginWord]);
	return result;
}

function copyArray(arr){
	let result = [];
	for(let i  = 0; i < arr.length; i++){
		result.push(arr[i]);
	}
	return result;
}

function recurseFind(beginWord, endWord, wordhash, result, visited, pathSoFar){
	if(beginWord == endWord){
		let path = copyArray(pathSoFar);
		if(result.length == 0){
			result.push(path);
		} else {
			if(result[0].length > path.length){
				result.length = 0;
				result.push(path);
			} else if(result[0].length == path.length){
				result.push(path);
			}
		}
		return;
	}

	for(let i = 0; i < beginWord.length; i++){
		let word = beginWord.substring(0, i) + '*' + beginWord.substring(i+1);
		if(wordhash[word] != null){
			let transformedWords = wordhash[word];
			for(let j = 0; j < transformedWords.length; j++){
				let newWord = transformedWords[j];
				if(visited[newWord] != true){
					visited[newWord] = true;
					pathSoFar.push(newWord);
					recurseFind(newWord, endWord, wordhash, result, visited, pathSoFar);
					pathSoFar.pop();
					visited[newWord] = false;
				}
			}
		}
	}
}


function createHash(wordList){
	let hash = {};
	for(let i = 0; i < wordList.length; i++){
		for(let j = 0; j < wordList[i].length; j++){
			let word = wordList[i].substring(0,j) + '*' + wordList[i].substring(j+1);
			if(hash[word] == null){
				hash[word] = [];
			}
			hash[word].push(wordList[i]);
		}
	}
	return hash;
}
