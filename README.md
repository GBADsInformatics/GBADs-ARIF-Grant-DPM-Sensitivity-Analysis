# GBADs-ARIF-Grant-DPM-Sensitivity-Analysis

This repository will house data/code/documentation for the DPM sensitivity analysis.

# DPM Parameter Sensitivity Analysis.R script

Change one parameter at a time (OAT) while keeping all others unchanged
Assumes that a given parameter is independent of all others (not realistic in practice)

Creates YAML input files with varied DPM parameter values for a given initial YAML file

Files will be named as 'param_name_increment_value.yaml', where 'param_name' is the parameter name as written verbatim in the YAML file, and 'increment' is the value of the parameter

