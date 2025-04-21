# DPM Parameter Sensitivity Analysis

# Change one parameter at a time (OAT) while keeping all others unchanged
# Assumes that a given parameter is independent of all others (not realistic 
# in practice)

# Creates YAML input files with varied DPM parameter values

# Files will be named as 'param_name_increment.yaml', where 'param_name' is 
# the parameter name as written verbatim in the YAML file, and 'increment' 
# is the value of the parameter


# install.packages("yaml") 
# install.packages("rstudioapi")

library(yaml)
library(rstudioapi)

file_path <- selectDirectory() # navigate to directory
base_yaml_path <- file.choose() # select file to modify

yaml_data <- yaml.load_file(base_yaml_path)

param_steps <- list(
  # Parturition and prolificacy (litter size)
  part = seq(from = 0, to = 1.1, by = 0.1),
  prolif = seq(from = 0, to = 2, by = 0.1),
  
  # Mortality
  Alpha_JF = seq(from = 0, to = 1, by = 0.1),
  Alpha_JM = seq(from = 0, to = 1, by = 0.1),
  Alpha_SubAF = seq(from = 0, to = 1, by = 0.1),
  Alpha_SubAM = seq(from = 0, to = 1, by = 0.1),
  Alpha_AF = seq(from = 0, to = 1, by = 0.1),
  Alpha_AM = seq(from = 0, to = 1, by = 0.1),
  Alpha_Ox = seq(from = 0, to = 1, by = 0.1),
  
  # Feed
  prpn_lskeepers_purch_feed = seq(from = 0, to = 1, by = 0.1),
  prpn_feed_paid_for = seq(from = 0, to = 1, by = 0.1),
  
  # Labour
  lab_non_health = seq(from = 0, to = 1, by = 0.1),
  
  # add more parameters as needed 
  
  # Milk Yield
  # Lactation duration
  # Liveweight
  # Financial value
  
  
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

