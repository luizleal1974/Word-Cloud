from os import chdir
from pandas import read_excel
from wordcloud import WordCloud
import matplotlib.pyplot as plt

# Lista de palavras a serem removidas
path = "https://github.com/luizleal1974/Word-Cloud/raw/main/Files/word_list.xlsx"
rm_word_list = read_excel(path).w_list.tolist()

# Dados
path = "https://github.com/luizleal1974/Word-Cloud/raw/main/Files/Dados.xlsx"
dados = read_excel(path)

# Palavras
NOME_COLUNA = 'Resposta'
dados[NOME_COLUNA] = dados[NOME_COLUNA].str.lower()
dados[NOME_COLUNA] = dados[NOME_COLUNA].str.replace(r'[0-9]+', ' ', regex = True)  # REMOVE NUMEROS
dados[NOME_COLUNA] = dados[NOME_COLUNA].str.replace('[\W\d_]+', ' ', regex = True) # REMOVE CARACTERES NAO-ALFABETICOS
words = ' '.join(dados[NOME_COLUNA].tolist())

# Nuvem de palavras
wc = WordCloud(stopwords = rm_word_list,
               background_color = "white",
               max_words = 200,
               width = 7000,
               height = 4000).generate(words)
plt.figure(figsize = (10, 10))
plt.imshow(wc)
plt.axis("off")
plt.show()
plt.savefig("word_cloud.png", dpi = 300)
