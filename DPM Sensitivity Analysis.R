# DPM Parameter Sensitivity Analysis

# Change one parameter at a time (OAT) while keeping others unchanged
# Creates YAML input files with varied parameter values

# install.packages("yaml") # for importing YAML files
# install.packages("rstudioapi")

library(yaml)
library(rstudioapi)

file_path <- selectDirectory() # navigate to directory
base_yaml_path <- file.choose() # select file to modify

yaml_data <- yaml.load_file(base_yaml_path)

param_steps <- list(
  part = seq(from = 0, to = 1.1, by = 0.1),
  prolif = seq(from = 0, to = 2, by = 0.1)
  # add more parameters as needed
)

for (param in names(param_steps)) {
  steps <- param_steps[[param]]
  
  for (val in steps) {
    mod_yaml <- yaml_data         
    mod_yaml[[param]] <- val      
    
    filename <- sprintf("%s_%.1f.yaml", param, val)
    full_path <- file.path(file_path, filename)
    
    writeLines(as.yaml(mod_yaml), full_path)
  }
}

