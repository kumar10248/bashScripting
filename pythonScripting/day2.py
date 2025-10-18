

# while(True):
#     num=int(input("Guess the number: "))
#     if num==7:
#          print("🎉 Correct!")
#          break;
#     elif num<7:
#        print("Too low")

#     else: print("Too high")

# print("Game Over! Thanks for playing 😊")

# Task-2

# for i in range(1,6):
#     for j in range(i):
#         print("*",end="")
#     print()     

#     #Task-3
# n = 5
# for i in range(n, 0, -1):   # from 5 → 1
#     for j in range(i):
#         print("*", end="")
#     print()

# dynamic typing, type hints
name: str = "Kumar"
count: int = 42
prices: list[float] = [9.99, 5.0, 12.49]

# tuple (immutable), set (unique), dict (mapping)
coords = (10, 20)
unique_ids = {"a", "b", "c"}
user = {"id": 1, "name": "kumar"}

# print(unique_ids)

# loop with enumerate & zip
names = ["alice", "bob", "carol"]
for i, name in enumerate(names, start=1):
    print(i, name)

# list comprehension
squares = [x*x for x in range(10) if x % 2 == 0]

# dict comprehension
d = {c: ord(c) for c in "abc"}
