f = open("/tmp/unicode.txt", "w")
for i in range(0, 0x10ffff):
    try:
        f.write(chr(i)+"\n")
    except:
        pass
f.close()
