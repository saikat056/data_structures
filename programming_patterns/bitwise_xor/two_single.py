def two_single(arr):
    x1_n_x2 = 0

    for elem in arr:
        x1_n_x2 ^= elem
    
    right_bit = 1
    while (x1_n_x2 & right_bit) == 0:
        right_bit = right_bit << 1

    x1, x2 = 0, 0

    for num in arr:
        if (num & right_bit) == 0:
            x1 ^= num
        else:
            x2 ^= num

    return x1, x2


arr = [1,4,2,1,3,5,6,2,3,5]
print(two_single(arr))
