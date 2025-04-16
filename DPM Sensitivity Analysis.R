# DPM Parameter Sensitivity Analysis

# Change one parameter at a time (OAT) while keeping others unchanged
# Creates YAML input files with varied parameter values

# install.packages("yaml") # for importing YAML files
# install.packages("rstudioapi")

library(yaml)
library(rstudioapi)

file_path <- selectDirectory()

base_yaml_path <- file.choose()
yaml_data <- yaml.load_file(base_yaml_path)

param <- "part"

steps <- seq(from = 0, to = 1, by = 0.1)

for (val in steps) {
  yaml_data[[param]] <- val  
  filename <- sprintf("%s_%.1f.yaml", param, val)  
  full_path <- file.path(file_path, filename)
  writeLines(as.yaml(yaml_data), full_path)
}
