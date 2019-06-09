## Atualizar path dos dados
dados<-read.csv("/jesse/gastos-votos-regressao-master/gastos-votos-regressao-master/data/gastos_e_votos.csv")

## Modelo de Regressão linear usando apenas a variavel total despesa
modelo <- lm(votos~total_despesa, data = dados[4:5])
modelo

## Coeficiente de determinacao
rQuadrado <- summary(modelo)$r.squared
rQuadrado

# Gerar grafico
plot(votos~total_despesa, data = dados[4:5])
abline(modelo)

# Qtd de votos caso o total de despesas seja = 2000
predict(modelo, data.frame(total_despesa = 2000))

# Modelo usando o grau de escolaridade
dataSet <- cbind(dados[4],dados[14])

modelo2 <- lm(votos~grau, data = dataSet)
modelo2

rQuadrado2 <- summary(modelo2)$r.squared
rQuadrado2





