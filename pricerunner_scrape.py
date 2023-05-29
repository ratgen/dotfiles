import requests
from bs4 import BeautifulSoup

URL = "https://www.pricerunner.dk/pl/224-3200185584/Tablets/Samsung-Galaxy-Tab-S7-FE-12.4-64GB-Sammenlign-Priser"
page = requests.get(URL)

soup = BeautifulSoup(page.content, "html.parser")

itemprops = soup.find_all(itemprop="offers")

prices = itemprops[0].find_all("span", "pr-rchxz9")

print(prices[0].text)

#print(itemprops)
#print(len(itemprops))
