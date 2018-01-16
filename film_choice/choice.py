import random
import os

list_1 = open("william", 'r')
list_2 = open("copine", 'r')
list_total = []

i = 0
list_total.append(list_1.readline())
while (len(list_total[i]) != 0 ) :
    list_total.append(list_1.readline())
    i = i + 1
i = i + 1
list_total.append(list_2.readline())
while (len(list_total[i]) != 0 ) :
    list_total.append(list_2.readline())
    i = i + 1

num = random.randint(0, i)
while(len(list_total[num]) == 0) :
    num = random.randint(0, 6)
    
print (list_total[num])

os.remove("william")
os.remove("enora")

new_1 = open("william", 'a')
new_2 = open("copine", 'a')

i = 0
while (len(list_total[i]) != 0 ) :
    recup = list_total[i]
    if recup != list_total[num] :
        new_1.write(recup)
    i = i + 1
i = i + 1
while (len(list_total[i]) != 0 ) :
    recup = list_total[i]
    if recup != list_total[num] :
        new_2.write(recup)
    i = i + 1
