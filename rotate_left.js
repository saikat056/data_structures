var rotateLeft = function(nums, k) {
  let n = nums.length;
  k = k % n;
  let arr =  new Array(n).fill(0);
  for(let i = 0; i < n; i++){
    arr[(i-k+n)%n] = nums[i];
  }
  for(let i = 0; i < n; i++){
    nums[i] = arr[i];
  }
};

let arr = [1,2,3,4,5,6];
rotateLeft(arr, 20);
console.log(arr);
