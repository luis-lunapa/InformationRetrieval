import random


lines = open("wordsSource.txt").readlines()
#line = lines[0]

#words = line.split()


wordsNumber = random.randint(1,1001)
file = open('documento3.txt', 'w+')

for i in range (wordsNumber):
    myword = random.choice(lines)
    print(myword)
    file.write(myword)




