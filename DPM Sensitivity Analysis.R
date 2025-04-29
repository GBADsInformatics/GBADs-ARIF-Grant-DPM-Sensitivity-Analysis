# Folder and file generation for DPM parameter sensitivity analysis

# Change one parameter at a time (OAT) while keeping all others unchanged
# Assumes that a given parameter is independent of all others (not realistic 
# in practice)

# Creates YAML input files with varied DPM parameter values for a given initial 
# YAML file

# Files will be named as 'param_name_increment_value.yaml', where 'param_name' 
# is the parameter name as written verbatim in the YAML file, and 'increment' 
# is the value of the parameter. They will then be automatically stored in 
# subfolders with the name of the parameter


# install.packages("yaml") 
# install.packages("rstudioapi")
# install.packages("tools")

library(yaml)
library(rstudioapi)
library(tools)

generate_param_sensitivity_analysis_files <- function(output_dir = NULL, 
                                             base_yaml_path = NULL, 
                                             param_steps) {
  
  if (is.null(output_dir)) {
    output_dir <- selectDirectory()  
  }
  
  if (is.null(base_yaml_path)) {
    base_yaml_path <- file.choose()  
  }
  
  yaml_data <- yaml.load_file(base_yaml_path)
  
  # Extract just the base file name without the extension
  base_name <- file_path_sans_ext(basename(base_yaml_path))
  
  for (param in names(param_steps)) {
    steps <- param_steps[[param]]
    
    param_folder <- file.path(output_dir, param)
    if (!dir.exists(param_folder)) {
      dir.create(param_folder, recursive = TRUE)
    }
    
    for (val in steps) {
      mod_yaml <- yaml_data
      mod_yaml[[param]] <- val
      
      # Include base file name in the generated filename
      filename <- sprintf("%s_%s_%.1f.yaml", base_name, param, val)
      full_path <- file.path(param_folder, filename)
      
      writeLines(yaml::as.yaml(mod_yaml), full_path)
    }
  }
}


# Example

param_steps <- list(
  part = seq(from = 0, to = 1.1, by = 0.1),
  prolif = seq(from = 0, to = 2, by = 0.1),
  Alpha_JF = seq(from = 0, to = 1, by = 0.1),
  Alpha_JM = seq(from = 0, to = 1, by = 0.1),
  Alpha_SubAF = seq(from = 0, to = 1, by = 0.1),
  Alpha_SubAM = seq(from = 0, to = 1, by = 0.1),
  Alpha_AF = seq(from = 0, to = 1, by = 0.1),
  Alpha_AM = seq(from = 0, to = 1, by = 0.1),
  Alpha_Ox = seq(from = 0, to = 1, by = 0.1),
  prpn_lskeepers_purch_feed = seq(from = 0, to = 1, by = 0.1),
  prpn_feed_paid_for = seq(from = 0, to = 1, by = 0.1),
  lab_non_health = seq(from = 0, to = 1, by = 0.1)
)

generate_param_sensitivity_analysis_files(param_steps = param_steps)
