# Predicting Crime in Chicago

## Overview

This ensemble model attempts to predict, plot and automatically generate a report that predicts crime in Chicago based on a publicly available dataset.
The model use H2O, R and MATLAB. H2O's gradient boost model is used to predict crime location based on time, location and type.
These predictions are then fed back into R, and using ggplot, heat maps of the high risk areas are generate.
The heat maps are then sent back to MATLAB which generates and automated report. 
