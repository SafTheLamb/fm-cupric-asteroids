import sys
import os

rename_count = 0

directory = sys.argv[1]
fromstr = sys.argv[2]
tostr = sys.argv[3]

for root, dirs, files in os.walk(sys.argv[1]):
  for filename in files:
    if filename.find(fromstr) != -1:
      newname = filename.replace(fromstr, tostr)
      os.rename(os.path.join(root, filename), os.path.join(root, newname))
      rename_count += 1

print(f"{rename_count} files renamed in directory {directory}, replacing {fromstr} with {tostr}")
