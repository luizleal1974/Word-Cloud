# Nuvem de palavras
<p align="justify">Nuvem de palavras (<i>word cloud</i>) é uma representação visual de palavras em que se dá maior destaque às palavras que aparecem com mais frequência. Este repositório fornece códigos de programação em R e Python criar nuvens de palavras.</p>

<p align="justify"><b>É importante destacar que no Python faz-se necessário instalar o módulo wordcloud: <code>pip install wordcloud</code>.</b></p>

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
