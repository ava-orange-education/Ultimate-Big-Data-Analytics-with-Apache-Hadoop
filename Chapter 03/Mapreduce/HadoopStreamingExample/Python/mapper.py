import sys

# Input: Lines of text
# Output: Key-value pairs (word, 1) for each word in the input

for line in sys.stdin:
    line = line.strip()
    words = line.split()
    for word in words:
        print(f"{word}\t1")
