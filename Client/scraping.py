# -*- coding: utf-8 -*-

from lxml import html
import requests
from random import shuffle
from re import search

print(" ")
print("***** INSTRUCCIONES PARA REALIZAR UN POEMA DADAÍSTA *****")
print("*****     (Sin necesidad de periódicos o tijeras)   *****")
print(" ")
url = raw_input("Introduzca el URL del artículo seleccionado: ")
page = requests.get(url)
tree = html.fromstring(page.content)

texto = tree.xpath('//*[@class="entry-content"]/p/text()')
text = []
for line in texto:
	aux = line.split()
	for word in aux:
		word = word.encode('utf8')
		objMatch = search(r'[\wÁÉÍÓÚÑáéíóúñ]+',word)
		if objMatch != None:
			text += [objMatch.group()]
shuffle(text)
shuffle(text)
f = open('prueba', 'w')
for word in text:
	f.write(word)
	f.write("\n")
