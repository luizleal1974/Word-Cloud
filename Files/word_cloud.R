library(xlsx)
library(wordcloud)
library(wordcloud2)
library(wesanderson)
library(ggwordcloud)

# Lista de palavras a serem removidas
arquivo = tempfile(fileext = ".xlsx")
path = "https://github.com/luizleal1974/Word-Cloud/raw/main/Files/word_list.xlsx"
download.file(path, destfile = arquivo, mode = 'wb')
rm_word_list = read.xlsx(arquivo, sheetIndex = 1, encoding = "UTF-8")$w_list

# Dados
arquivo = tempfile(fileext = ".xlsx")
path = "https://github.com/luizleal1974/Word-Cloud/raw/main/Files/Dados.xlsx"
download.file(path, destfile = arquivo, mode = 'wb')
dados = read.xlsx(arquivo, sheetIndex = 1, encoding = "UTF-8")

# Palavras
words = dados[,2]
words = tolower(x = words)
words = unlist(strsplit(x = words, split = " "))
words =  sub(pattern = "[”]"           , replacement = ""  , x = words)
words =  sub(pattern = "[“]"           , replacement = ""  , x = words)
words =  sub(pattern = "[’]"           , replacement = ""  , x = words)
words = gsub(pattern = '[[:punct:] ]+' , replacement = ' ' , x = words) # REMOVE PONTUACAO
words = gsub(pattern = "\n"            , replacement = ""  , x = words)
words = gsub(pattern = '[[:digit:]]+'  , replacement = ""  , x = words) # REMOVE NUMEROS
words = gsub(pattern = '[^[:alnum:] ]' , replacement = ''  , x = words) # REMOVE CARACTERES ESPECIAIS
words = trimws(x = words)
words = unlist(strsplit(x = words, split = ' '))

# Word frequency
word_freq = sort(table(words[which(words %in% rm_word_list == FALSE)]), decreasing = TRUE)
dfr = as.data.frame(word_freq)
colnames(dfr) = c("word", "freq")
rownames(dfr) = names(word_freq)
dfr = dfr[-which(dfr$freq < 2),] # OPCIONAL: REMOVER PALAVRAS COM BAIXA FREQUENCIA
head(dfr)



# === Nuvem de palavras (imagem) === #
set.seed(22)
par(mar = c(1, 1, 1, 1))
wordcloud(words = dfr$word,
          freq = dfr$freq,
          scale = c(4, 0.1),
          max.words = 200, 
          random.order = TRUE,
          color = wes_palette("Darjeeling1")
          )
title(main = "Nuvem de palavras (word cloud)")



# === Nuvem de palavras (HTML) === #
wc = wordcloud2(dfr,
                size = 0.9,
                shape = 'circle',
                color = 'random-dark')
htmlwidgets::saveWidget(widget = wc, file = "word_cloud.html")



# === Nuvem de palavras (imagem) === #
dfr = dfr[-which(dfr$freq < 4),] # SUGESTAO: REMOVER PALAVRAS COM BAIXA FREQUENCIA
set.seed(22)
p = ggplot(data = dfr, mapping = aes(label = word,
                                 size = freq,
                                 color = factor(sample.int(n = 10, size = nrow(dfr), replace = TRUE))
                                 )
       ) +
geom_text_wordcloud() +
scale_size_area(max_size = 25) +
theme_minimal() +
ggtitle("Nuvem de palavras (word cloud)") +
theme(plot.title = element_text(hjust = 0.5))
ggsave(filename = "word_cloud.png", dpi = 300, width = 15, height = 10)
