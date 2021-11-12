var rotateRight = function(nums, k) {
	let n = nums.length;
	let arr =  new Array(n).fill(0);
	for(let i = 0; i < n; i++){
		arr[(i+k)%n] = nums[i];
	}
	for(let i = 0; i < n; i++){
		nums[i] = arr[i];
	}
};
