let prices = [1,5,8,9,10,17,17,20,24,30];
rodCut(prices);
function rodCut(prices){
	prices.unshift(0);
	let n = prices.length;
	let dp = new Array(n).fill(0);
	let s = new Array(n).fill(0);
	for(let i = 1; i <= n; i++){
		let maxValue = -Infinity;
		let optSolution = 0;
		for(let j=0; j < i; j++){
			let currValue = prices[j] + dp[i-j];
			if(currValue > maxValue){
				maxValue = currValue;
				optSolution = j;
			}
		}
		dp[i] = maxValue;
		s[i] = optSolution == 0 ? i : optSolution;
	}
	console.log(dp);
	console.log(s);
	return dp;

}
