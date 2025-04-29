# GBADs-ARIF-Grant-DPM-Sensitivity-Analysis #

<img src= "https://github.com/GBADsInformatics/GBADsDPM.R/blob/main/img/GBADs.png" width="150">

This repository will house data/code/documentation for the DPM sensitivity analysis.

## DPM Parameter Sensitivity Analysis.R script ##

### Usage ###

Can be used with either version 4 or version 7.2 of the Dynamic Population Model (DPM)

Folder and file generation for DPM parameter sensitivity analysis

Change one parameter at a time (OAT) while keeping all others unchanged

Assumes that a given parameter is independent of all others (not realistic in practice)

Creates YAML input files with varied DPM parameter values for a given initial YAML file

Users will be prompted to navigate to the required folders containing the YAML files to be analyzed.

Files will be named as 'param_name_increment_value.yaml', where 'param_name' is the parameter name as written verbatim in the YAML file, and 'increment' 
is the value of the parameter. They will then be automatically stored within subfolders with the name of the parameter

### Example ###

    param_steps <- list(
      part = seq(from = 0, to = 1.1, by = 0.1),
      prolif = seq(from = 0, to = 2, by = 0.1),
      Alpha_Ox = seq(from = 0, to = 1, by = 0.1),
      prpn_lskeepers_purch_feed = seq(from = 0, to = 1, by = 0.1),
      prpn_feed_paid_for = seq(from = 0, to = 1, by = 0.1),
      lab_non_health = seq(from = 0, to = 1, by = 0.1)
    )

    generate_param_sensitivity_analysis_files(param_steps = param_steps)


