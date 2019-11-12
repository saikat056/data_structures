function knapSackContinuous(W, P, K){
	let n  = W.length;
	let ratios = [];

	for(let  i = 0; i < n; i++){
		ratios.push([P[i] / W[i], i]);
	}
	ratios = ratios.sort((a,b) => a[0] - b[0]);

	let profit = 0;
	let weight = K;
	let j = ratios.length - 1;
	while((j >= 0) && (weight > 0)){
		let index = ratios[j][1];
		if(weight > W[index]){
			profit += W[index]*(ratios[j][0]);
			weight -= W[index];
		} else {
			let remain = weight;
			profit += remain * (ratios[j][0]);
			weight -= remain;
		}
		j--;
	}
	return profit;
}

let P = [1,2,3,4];
let W = [2,3,4,5];
let K = 8;
console.log(knapSackContinuous(W, P, K));
