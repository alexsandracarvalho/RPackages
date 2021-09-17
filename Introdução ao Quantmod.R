#Autoras: Alexsandra Carvalho (https://www.linkedin.com/in/alexsandrabispocarvalho/); e
#Jennifer Do É(https://www.linkedin.com/in/jennifer-do-e/)

# Instalando o pacote
install.packages("quantmod")
# Ativando
library(quantmod)

# Criando um vetor aleatório de preços de abertura e fechamento.
abertura <- c(10.3,10.01,9.99,10.01,10.5)   # Criando uma matriz 1x5 de preçoos de abertura.
fechamento <- c(9.9,9.8,10.2,10.5,10.8)     # Criando uma matriz 1x5 de preços de fechamento.

# Para visualização.
abertura
fechamento

Delt(abertura)                   # Calculando a variação percentual dos preços de abertura.
Delt(fechamento)                 # Calculando a variação percentual dos preços de fechamento.

Delt(abertura,type='arithmetic') # Usando a variação padrão.
Delt(abertura,type='log')        # Usando a Variação logarítmica


Delt(abertura,fechamento)        # Calculando a variação percentual entre a abertura e o fechamento do mercado. 

# Como o type não foi informado, o defaut (aritmético) é usado.
# Como k não foi informado, assume-se o default k=0.

# Obtendo dados das ações usando getSymbols
getSymbols(Symbols= 'BBDC3.SA',       # Baixando dados da ação do Banco do Bradesco
           from='2020-01-01',         # Inicio da série em 01/01/2020
           to='2021-01-01',           # Fim da série em 01/01/2021. É possível substituir pela função "sys.date" que retorna o dia atual.
           src = 'yahoo', verbose=F)  # Fonte: Yahoo Finance

# Removendo NA's
na.omit(BBDC3.SA)

# Visualizando os seis primeiros valores
head(BBDC3.SA)

# Visualizando os seis ultimos valores valores
tail(BBDC3.SA)

#Plotando o gráfico da série
plot(BBDC3.SA)

#Retorns Mensais
periodReturn(BBDC3.SA, period='monthly', subset=NULL, type='arithmetic', leading=TRUE) 
#'montly' pode ser substituido por "daily", "weekly", "quarterly" e "yearly"
# type pode ser escolhido entre "arithmetic" e "log"

#Outra forma de calcular:

#Retornos diÃ¡rios
dailyReturn(BBDC3.SA, subset=NULL, type='arithmetic', leading=TRUE)

#Retornos semanais 
weeklyReturn(BBDC3.SA, subset=NULL, type='arithmetic', leading=TRUE)

#Retornos mensais
monthlyReturn(BBDC3.SA, subset=NULL, type='arithmetic', leading=TRUE)

#Retornos trimestrais
quarterlyReturn(BBDC3.SA, subset=NULL, type='arithmetic', leading=TRUE)

#Retornos anual
annualReturn(BBDC3.SA, subset=NULL, type='arithmetic', leading=TRUE)
yearlyReturn(BBDC3.SA, subset=NULL, type='arithmetic', leading=TRUE)

#Retorno em 2020
periodReturn(BBDC3.SA,period='yearly',subset='2020') 

# Salvando o Retorno Anual em um objeto
retorno_diario <- dailyReturn(BBDC3.SA, subset=NULL, type='arithmetic', leading=TRUE)

# Calculando o retorno entre datas específicas
# Criando uma janela com os dados entre datas e salvando em um objeto à parte
r <- window(retorno_diario, start = '2020-01-01',  end= '2020-05-31',)

# Omitindo dados faltantes
na.omit(r)

#Baixando dados de distribuição de dividendos e salvando num objeto
dividendos <- getDividends("BBDC3.SA", from = "2020-01-01", to = Sys.Date(), 
                           env = parent.frame(), src = "yahoo", auto.assign = FALSE,
                           auto.update = FALSE, verbose = FALSE, split.adjust = TRUE,
                           curl.options = list())

# Baixando e salvando dados de desdobramento em um objeto

desdobramentos <- getSplits("BBDC3.SA", from = "2000-01-01", to = Sys.Date(), env = parent.frame(), 
                            src = "yahoo", auto.assign = FALSE, auto.update = FALSE, verbose = FALSE, curl.options = list())

# Após baixar a série, usamos o comando head() para vizualisar os primeiros valores
head(BBDC3.SA) 

#Criando um objeto com os preços ajustados
BBDC3.SA.a <- adjustOHLC(BBDC3.SA)
head(BBDC3.SA.a)













