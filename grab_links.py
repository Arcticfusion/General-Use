#!/bin/python3

import re, sys

all_links = []

for line in sys.stdin:
    links = re.findall(r'href="[^"]*"', line)
    for l in links:
        s = re.compile("href=\"([^\"]*)\"")
        h = s.search(l)
        all_links.append(h.group(1))


for link in all_links:
    print(link)
