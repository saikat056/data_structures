var rotate = function(matrix) {
	let n = matrix.length;
	for(let i = 0; i < n; i++){
		for(let j = i; j < n - i - 1; j++){
			let temp1 =  matrix[j][n-1-i];
			matrix[j][n-1-i] = matrix[i][j];
			let temp2 = matrix[n-1-i][n-1-j];
			matrix[n-1-i][n-1-j] = temp1;
			temp1 = matrix[n-1-j][i];
			matrix[n-1-j][i] = temp2;
			matrix[i][j] = temp1;
		}
	}
};
