def single_number(arr):
    x1 = 0
    for i in arr:
        x1 ^= i
    return x1

arr = [1,4,2,1,3,2,3]
print(single_number(arr))
