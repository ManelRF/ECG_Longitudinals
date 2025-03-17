source(here("Scripts", "Compute_RR_Intervals"))

# Compute IQR and quartiles
iqr <- IQR(rr_intervals)
q1 <- quantile(rr_intervals, 0.25)
q3 <- quantile(rr_intervals, 0.75)

# Compute limits to find outliers
lower_limit <- q1 - 1.5 * iqr
upper_limit <- q3 + 1.5 * iqr

# Identify outliers
outliers <- which(rr_intervals < lower_limit | rr_intervals > upper_limit)

# Plot outliers
plot(rr_intervals, type="l", col="blue", xlab="Latido", ylab="Intervalo RR (s)")
points(outliers, rr_intervals[outliers], col="red", pch=19)
