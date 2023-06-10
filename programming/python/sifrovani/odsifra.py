num = "109775241507337514"
c_nums = ['0','1','2','3','4','5','6','7','8','9']

posun = 1;
sol=""

for char in num:
    index = c_nums.index(char) - posun
    if(index <= len(c_nums)):
        index = index % len(c_nums)
    sol += c_nums[index]
    posun = posun + 1

print(sol)
