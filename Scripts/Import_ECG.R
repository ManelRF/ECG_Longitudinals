source(here("Scripts", "Load_Subdirectories.R"))

# Parametres expressed in ECGPCG0003.hea
file_name <- "ECGPCG0003"
signals <- 2           # Number of signals
sf <- 8000             # Sampling Frequency
samples <- 240000      # Number of Samples

# Open ECGPCG0003.dat
file_connection <- file(paste0(file_name, ".dat"), "rb")

# Read the binary data as 16-bit integers
data_16int <- readBin(file_connection, what = "integer", size = 2,
                    signed = TRUE, endian = "little",
                    n = samples * signals)

close(file_connection)

# Transform into a matrix (each column is a signal)
data_matrix <- matrix(data_16int, ncol = signals, byrow = TRUE)

# Time values
time <- seq(0, (samples - 1)) / fs

# Get Signal
ecg_signal <- data_matrix[,1]

# Apply gains and displacements from ECGPCG0003.hea
ecg_mV <- (ecg_signal - (-14265)) / 110554.8863

# Plot ECG
plot(time, ecg_mV, type = "l", xlab = "Time (s)", ylab = "ECG (mV)",
     main = "ECG")
