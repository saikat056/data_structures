function knapSackDiscrete(W, P, K){
	let n = W.length;
	let dp = new Array(n+1);
	for(let i = 0; i < n+1; i++){
		dp[i] = new Array(K+1).fill(0);
	}

	for(let i = 1; i < n+1; i++){
		for(let j = 1; j < K+1; j++){
			let b = -Infinity;
			if(j - W[i-1] >= 0) {
				b = dp[i-1][j - W[i-1]] + P[i-1];
			}
			dp[i][j] = Math.max(dp[i-1][j], b);

		}
	}

	console.log(dp);
	return dp[n][K];
}

let P = [1,2,5,6];
let W = [2,2,1,5];
let K = 8;
console.log(knapSackDiscrete(W, P, K));
