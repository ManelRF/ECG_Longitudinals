source(here("Scripts", "Import_ECG.R"))

library(RHRV)

hrv.data <- CreateHRVData()

# Find the times of each beat (R peaks)
hrv.data <- LoadBeatWFDB(hrv.data, RecordName = "ECGPCG0003",
                         RecordPath = data_dir, annotator = "dat")

r_peaks <- hrv.data$Beat

row.names(r_peaks) <- row.names(hrv.data$Beat)
