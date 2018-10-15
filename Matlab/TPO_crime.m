%Build Predicted Dataset
%Police Project
%*** MIGHT NEEED TO CHANGE FROM GBM TO PROPHET, since the date number
%will never have been seen by the GBM and give bad results
%*** Update ML model to get better results (Date is still wrong)

clear;
clc;
close;
tic;
n=0;

%Laptop
%PW = 'C:\Users\Jeff\Google Drive\Tailored Process Optimization\TPO\Police_project\Chicago\';
%Dekstop
PW = 'D:\Users\Jeff\Google Drive\Tailored Process Optimization\TPO\Police_project\Chicago\';

%Initalize date and time for the model
date="06/06/2017";
time="18:00";
header=["C1","Date","Primary Type","Latitude","Longitude","Time"]; %Specifiy header for the input file

%initalize predSet - preallocate in future to speed up
predSet=[1,1,1];
predSet=num2cell(predSet);

%Set bounding box for the area of interest
longMin=-88.00000; %Min based on area of interest
longMax=-87.50000; %Max based on area of interest 
latMin=41.60000; %Min based on area of interest
latMax=42.10000; %Max based on area of interest
degDiv=70; %Number of division between min and max of the degrees to create the intervals

longInc=abs(longMax-longMin)/degDiv; %Increment values for long
latInc=abs(latMax-latMin)/degDiv; %Increment values for lat

for i=longMin:longInc:longMax
    for j=latMin:latInc:latMax
        n=n+1;
        %Generate predict input
        inputP=[1, date, 'THEFT', j, i, time]; %1 and Theft are place holders that are needed for input format, but ignored by the prediction
        inputP=[header;inputP]; %Concencate vectors
        inputP=cellstr(inputP); %Convert to cell
        cellwrite([PW,'input.csv'], inputP);
        
        %Run Predict Calc
        % Run h2o R-scripts to extract objective function TPO features -
        % change between systems
        %% Laptop
        %dos('"C:\Program Files\R\R-3.4.0\bin\x64\Rscript" "C:\Users\Jeff\Google Drive\Tailored Process Optimization\TPO\Police_project\Chicago\R_master.r"')
        %% Dekstop
        dos('"C:\Program Files\R\R-3.4.0\bin\x64\Rscript" "D:\Users\Jeff\Google Drive\Tailored Process Optimization\TPO\Police_project\Chicago\R_master.r"')

        %Extract predict Calc
        [Pred_V, A] = read(PW);
        
        %Generate the prediction array
        predSet=[predSet; A, i, j];
        
        clear inputP; %remove inputP so that we dont keep adding onto it, each iteration
    end
end

%Export data to CSV for R pick up
headerB=["Primary Type","Longitude","Latitude"]; %Create header for plotting
headerB=cellstr(headerB);
predSet=[headerB;predSet];
cellwrite([PW 'Predictions\','prediction.csv'], predSet);

%Run R script that filters and Generate plots based on crime
%% Laptop
%dos('"C:\Program Files\R\R-3.4.0\bin\x64\Rscript" "C:\Users\Jeff\Google Drive\Tailored Process Optimization\TPO\Police_project\Chicago\Subsetting_Plotting.r"')
%% Desktop
dos('"C:\Program Files\R\R-3.4.0\bin\x64\Rscript" "D:\Users\Jeff\Google Drive\Tailored Process Optimization\TPO\Police_project\Chicago\Subsetting_Plotting.r"')

%Generate Report
report(PW);

%Convert to PDF
[OK,msg] = doc2pdf([pwd filesep 'CrimeReport.docx'],fullfile(pwd,'CrimeReport.pdf'));
open(fullfile(pwd,'CrimeReport.pdf'));

toc;
