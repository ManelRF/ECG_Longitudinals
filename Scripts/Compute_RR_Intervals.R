source(here("Scripts", "Compute_R_Peaks.R"))

# Compute the RR intervals
rr_intervals <- diff(r_peaks$Time)

# Plot the RR intervals
plot(rr_intervals, type="l", col="red", xlab="Beat",
     ylab="RR Interval")
