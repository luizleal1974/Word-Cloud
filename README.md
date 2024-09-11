# Nuvem de palavras

<p align="justify">Nuvem de palavras (<i>word cloud</i>) é uma representação visual de palavras em que se dá maior destaque às palavras que aparecem com mais frequência. Este repositório fornece códigos de programação em R e Python criar nuvens de palavras. <b>É importante destacar que no Python faz-se necessário instalar o módulo wordcloud: <code>pip install wordcloud</code>.</b></p>

```{r}
# Run this code in R prompt
library(reticulate)
py_install("wordcloud")
```

</br>



# 1. R

<p align="justify">O arquivo <a target='_blank' rel='noopener noreferrer' href='https://github.com/luizleal1974/Word-Cloud/blob/main/Files/word_cloud.R'><code>word_cloud.R</code></a> fornece três modos distintos de construção de uma nuvem de palavras (Figura 1).</p>

```{r}
# Figura 1
path = "https://github.com/luizleal1974/Word-Cloud/raw/main/Files/word_cloud.R"
setwd("F:")
devtools::source_url(path)
```

<p align="center"><img src="/Files/word_cloud_R.png" alt="Drawing"/></p>

<div align="center">Figura 1. Nuvem de palavras no R.</div>


</br>




# 2. Python

### 2.1 Nuvem de palavras

<p align="justify">O arquivo <a target='_blank' rel='noopener noreferrer' href='https://github.com/luizleal1974/Word-Cloud/blob/main/Files/word_cloud.py'><code>word_cloud.py</code></a> contém uma sugestão de código de programação para a construção de uma nuvem de palavras (Figura 2).</p>

<p align="center"><img src="/Files/word_cloud_Python.png" alt="Drawing" height="250" width="450"/></p>

<div align="center">Figura 2. Nuvem de palavras no Python.</div>



</br>

### 2.2 Manipulação de string

<p align="justify">O arquivo <a target='_blank' rel='noopener noreferrer' href='https://github.com/luizleal1974/Word-Cloud/blob/main/Files/word_cloud.py'><code>word_cloud.py</code></a> e o código abaixo fornecem diferentes modos de manipulação de string utilizando-se a linguagem de programação Python.</p>

```{python}
from re import sub

string = "Luiz 0123456789 Henrique!@#$%&*(){}[] da/\?;:<>,.!-=+| Conceição Leal"
string
sub('[^a-zA-Z]+' , ' ' , string) # REMOVE CARACTERES NAO-ALFABETICOS (INCLUINDO LETRAS ACENTUADAS)
sub('[\W\d_]+'   , ' ' , string) # REMOVE CARACTERES NAO-ALFABETICOS
sub(r'[0-9]+'    , ' ' , string) # REMOVE NUMEROS

string = "\n Luiz \n Henrique da\n  Conceição\n Leal\nEstatística"
string
print(string)
string = string.replace('\n', ' ')
string
print(string)
```

```{python}
from pandas import DataFrame, to_numeric
from statistics import mean

dados = DataFrame(data = {'Grupo': ["A", "B", "C"], 'Valor': ["3,5", "4,79", "5"]})
dados
dados['Valor'] = dados['Valor'].str.replace(',' , '.') # Substituir separador decimal: ',' por '.'
dados['Valor'] = to_numeric(dados['Valor'])            # Equivalente ao 'as.numeric' do R
dados
mean(dados['Valor'])

dfr = DataFrame(data = {'3,4': ["A"], '7,82': ["B"], '6': ["C"], '2,857': ["D"]})
dfr
valores = dfr.columns.to_list()
valores
valores = to_numeric([w.replace(',' , '.') for w in valores])
valores
mean(valores)
```
Nota: A linha de comando <code>[w.replace(',' , '.') for w in valores]</code> substitui <code>','</code> por <code>'.'</code> na lista <code>valores</code>.

</br>

