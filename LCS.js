let seq1 = ['A', 'E', 'F', 'B', 'C', 'D', 'A'];
let seq2 = ['A', 'B', 'C', 'B', 'R'];

function LCS(seq1, seq2){
	let m = seq1.length;
	let n = seq2.length;
	let dp =  new Array(m+1);
	for(let i = 0; i < m+1; i++){
		dp[i] = new Array(n+1).fill(0);
	}

	let s = new Array(m+1);
	for(let i = 0; i < m+1; i++){
		s[i] = new Array(n+1).fill('');
	}

	for(let i = 1; i < m+1; i++){
		for(let j = 1; j < n+1; j++){
			let maxValue = Math.max(dp[i-1][j], dp[i][j-1]);
			if(seq1[i-1] == seq2[j-1]) {
				dp[i][j] = maxValue + 1;
			} else {
				dp[i][j] = maxValue;
			}
		}
	}
	return dp[m][n];
}
console.log(LCS(seq1, seq2));
