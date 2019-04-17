# import libraries
import urllib2
from bs4 import BeautifulSoup

quote_page = ‘http://www.studentenwerk-giessen.de/Mensen_und_Cafeterien/Speisepl%E4ne/Mensa_Fulda.html'

page = urllib2.urlopen(quote_page)

soup = BeautifulSoup(page, 'html.parser')

# Take out the <div> of name and get its value
name_box = soup.find(‘h1’, attrs={‘class’: ‘name’})

name = name_box.text.strip() # strip() is used to remove starting and trailing
print name
