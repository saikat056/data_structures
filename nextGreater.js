function nextGreater(num){
	let bitCount = 0;
	let c1 = 0;
	let n = num;
	while((n > 0) && (n % 2 == 0)){
		n = n >> 1;
		bitCount++;
	}

	while((n > 0) && (n % 2 != 0)){
		n = n >> 1;
		c1++;
		bitCount++;
	}

	num |= 1 << bitCount;
	let mask = (1 << bitCount) - 1;
	num &= ~mask;
	num |= (1 << (c1 - 1)) - 1;

	return num;
}
