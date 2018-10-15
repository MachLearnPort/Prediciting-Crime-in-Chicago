# TPO R script for HR_Project
# By: Jeff Schwartzentruber
# Date: April 29th 2017

#laptop
#PW <- "C:\\Users\\Jeff\\Google Drive\\Tailored Process Optimization\\TPO\\Police_project\\Chicago\\"
#Desktop
PW <- "D:\\Users\\Jeff\\Google Drive\\Tailored Process Optimization\\TPO\\Police_project\\Chicago\\"


library(h2o) #Import h2o library (must be installed prior)
localH2O = h2o.init(ip = "localhost", port = 54321, startH2O = TRUE,min_mem_size = "3g") #Initalize h2o instance
setwd = PW # set working directory where file repo is
input <- h2o.importFile(path = paste(PW, "input.csv", sep=""), destination_frame = "input") #Load generated predict input.csv file, must be an h2o frame

## Crime Model - GMB
modelPath_A = paste(PW, "Model_Exports\\gbm-d910a86a-ff4e-4dc1-9001-4c2d3516e124", sep="") # Location of the exported model from flow
model_A <- h2o.loadModel(modelPath_A) #Load exported model
pred_A_h2o <- h2o.predict(model_A, input) #Predict with input.csv with generated model
pred_A=as.data.frame(pred_A_h2o) #convert h2o from to r frame
write.table(as.matrix(pred_A), file=paste(PW,"Predictions\\pred.csv", sep=""), row.names=FALSE, sep=",")


h2o.shutdown(prompt = TRUE)  #Turn to TRUE for paralle computing
