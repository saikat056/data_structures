let matrices = [[30,35],[35,15],[15,5],[5,10],[10,20],[20,25]];

console.log(matrixMultiply(matrices));
function matrixMultiply(matrices){
	let n = matrices.length;
	let dp = new Array(n);
	for(let i = 0; i < n; i++){
		dp[i] =  new Array(n).fill(0);
	}

	let s  = new Array(n);
	for(let i = 0; i < n; i++){
		s[i] =  new Array(n).fill(0);
	}

	for(let l = 1; l < n; l++){
		for(let i = 0; i + l < n; i++) {
			let minValue = Infinity;
			let localMinIndex = 0;
			for(let j = i; j < i + l; j++){
				let localMin = dp[i][j] + dp[j+1][i+l] + (matrices[i][0]*matrices[j+1][0]*matrices[i+l][1]);
				if(localMin < minValue) {
					minValue = localMin;
					localMinIndex = j;
				}
			}
			dp[i][i+l] = minValue;
			s[i][i+l] = localMinIndex;
		}
	}
	console.log(s);
	return dp[0][n-1];
}
