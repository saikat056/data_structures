function getBit(num, i){
	return ((num & (1 << i)) == 0) ? 1 : 0;
}

function setBit(num, i){
	return (num | (1 << i));
}

function clearBit(num, i){
	let mask = ~(1 << i);
	return num & mask;
}

function clearBitsMSBthroughI(num, i){
	let mask = (1 << i) - 1;
	return num & mask;
}

function clearBitsIthrough0(num, i){
	let mask = -1 << (i + 1);
	return num & mask;
}

function updateBit(num, i, value){
	num = (num & ~(1 << i));
	let mask = value << i;
	return num | mask;
}
