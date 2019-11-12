var minmaxGasDist = function(stations, K) {
	let n = stations.length - 1;
	let count = new Array(n).fill(1);
	let deltas = new Array(n).fill(0);

	for(let i = 0; i < n; i++){
		deltas[i] = stations[i+1] - stations[i];
	}

	for(let i = 0; i < K; i++){
		let best = 0;
		for(let j = 0; j < n; j++){
			if((deltas[j] / count[j]) > (deltas[best] / count[best])){
				best = j;
			}
		}
		count[best]++;
	}

	let maxDistance = -Infinity;
	for(let i = 0; i < n; i++){
		maxDistance = Math.max(maxDistance, deltas[i] / count[i]);
	}

	return maxDistance;
};
