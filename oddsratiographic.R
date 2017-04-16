
library(ggplot2)

# Create labels
boxLabels = c("age", "bw", "ht", "mocab", "adspeedm", "dcspeedm", "morse", "sex")

# Enter summary data. boxOdds are the odds ratios (calculated elsewhere), boxCILow is the lower bound of the CI, boxCIHigh is the upper bound.

df <- data.frame(
  yAxis <- length(boxLabels):1,
  boxOdds <- c(1.1,1.3,2.22,0.81,2.98,1.9783,1.9005,2.5812),
  boxCILow <- c(1.21,1.31,2.222,2.81,0.98,2.783,0.9005,2.12),
  boxCIHigh <- c(3.1,3.3,3.22,5.81,1.98,1.783,1.005,2.42)
)

# Plot
p <- ggplot(df, aes(x = boxOdds, y = yAxis))
p + geom_vline(aes(xintercept = 1), size = .25, linetype = "dashed") +
  geom_errorbarh(aes(xmax = boxCIHigh, xmin = boxCILow), size = .5, height = .2, color = "gray50") +
  geom_point(shape=15, size = 3.5, color = "orange") +
  theme_bw() +
  theme(panel.grid.minor = element_blank()) +
  scale_y_continuous(breaks = yAxis, labels = boxLabels) +
  scale_x_continuous(breaks = seq(0,7,1) ) +
  coord_trans(x = "log10") +
  ylab("") +
  xlab("Odds ratio (log scale)") +
  annotate(geom = "text", y =1.1, x = 3.5, label ="Model p < 0.001\nPseudo R^2 = 0.10", size = 3.5, hjust = 0) + ggtitle("Intention to remove box turtles from the road")
