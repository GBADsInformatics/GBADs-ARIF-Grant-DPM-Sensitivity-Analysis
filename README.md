# GBADs-ARIF-Grant-DPM-Sensitivity-Analysis #

<img src= "https://github.com/GBADsInformatics/GBADsDPM.R/blob/main/img/GBADs.png" width="150">

This repository will house data/code/documentation for the DPM sensitivity analysis.

## DPM Parameter Sensitivity Analysis.R script ##

### Usage ###

Can be used with either version 4 or version 7.2 (**recommended**) of the Dynamic Population Model (DPM)

Generates required folders and files for DPM parameter sensitivity analysis

Changes one parameter at a time (OAT) while keeping all others unchanged

Assumes that a given parameter is independent of all others (not realistic in practice)

For parameters defined by distributions (e.g., rpert), the analysis requires these to be point estimates

Creates YAML input files with varied DPM parameter values for a given initial YAML file

Users will be prompted to navigate to the required folders containing the YAML files to be analyzed

Files will be named as 'param_name_increment_value.yaml', where 'param_name' is the parameter name as written verbatim in the YAML file, and 'increment' 
is the value of the parameter. They will then be automatically stored within subfolders with the name of the parameter

### Example ###

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
    lab_non_health = seq(from = 0, to = 1, by = 0.1,
    lac_duration = seq(from = 0, to = 400, by = 50))
    )

    generate_param_sensitivity_analysis_files(param_steps = param_steps)

The `from` and `to` arguments to `seq()` for each model parameter can be thought of as being minimum and maximum values, whereas the `by` argument represents an amount by which the parameter value is incremented. For model parameters that are proportions, `from = 0` and `to = 1`. The `by` argument has been set to `by = 0.1` by default, but can be changed to reflect a finer increment (*e.g.*, 0.01) or a coarser increment (*e.g.*, 0.5).
