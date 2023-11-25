def count_chars(s):
    l = [0,0]
    count = 0
    for c in s:
        count+=1
        if c == '\n':
            l.append(count)
    return l        


