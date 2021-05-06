setwd("D:/Mario/Documents/Eye Movements In Programming/AIC/rectangleConstructor")

library(univariateML)
library(tibble)
library(readr)
library(dplyr)
library(ggplot2)

dataFixations <- read_tsv("dataGeneral.tsv")

comparacion_aic <- AIC(
  mlbetapr(dataFixations$x),
  mlexp(dataFixations$x),
  mlinvgamma(dataFixations$x),
  mlgamma(dataFixations$x),
  mllnorm(dataFixations$x),
  mlrayleigh(dataFixations$x),
  mlinvgauss(dataFixations$x),
  mlweibull(dataFixations$x),
  mlinvweibull(dataFixations$x),
  mllgamma(dataFixations$x)
)
comparacion_aic <- comparacion_aic %>% rownames_to_column(var = "Distribution") %>% arrange(AIC)

comparacion_bic <- BIC(
  mlbetapr(dataFixations$x),
  mlexp(dataFixations$x),
  mlinvgamma(dataFixations$x),
  mlgamma(dataFixations$x),
  mllnorm(dataFixations$x),
  mlrayleigh(dataFixations$x),
  mlinvgauss(dataFixations$x),
  mlweibull(dataFixations$x),
  mlinvweibull(dataFixations$x),
  mllgamma(dataFixations$x)
)
comparacion_bic <- comparacion_bic %>% rownames_to_column(var = "Distribution") %>% arrange(BIC)

ggplot(data = dataFixations) +
  geom_histogram(aes(x = x, y =  after_stat(density)),
                 bins = 40,
                 alpha = 0.3, color = "black") +
  geom_rug(aes(x = x)) +
  stat_function(fun = function(.x){dml(x = .x, obj = mlgamma(dataFixations$x))},
                aes(color = "mlgamma"),
                size = 1) +
  stat_function(fun = function(.x){dml(x = .x, obj = mlweibull(dataFixations$x))},
                aes(color = "mlweibull"),
                size = 1) +
  scale_color_manual(breaks = c("mlgamma", "mlweibull"),
                     values = c("mlgamma" = "red", "mlweibull" = "blue")) +
  labs(title = "Distribuciones",
       color = "Distribución") +
  theme_bw() +
  scale_x_continuous(breaks = c(400, 500, 600, 700, 800, 900,1300,1500)) +
  labs(x = 'Fijaciones en X', y = 'Densidad') +
  theme(axis.text=element_text(size=12),
        axis.title=element_text(size=12),
        axis.text.x = element_text(size=10, colour = "black"),
        axis.text.y = element_text(size=10, colour = "black")
  )

  


