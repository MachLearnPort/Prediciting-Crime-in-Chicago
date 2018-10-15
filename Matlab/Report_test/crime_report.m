%Crime_report_Generator
clear;
close;
clc;

import mlreportgen.dom.*;
type = 'docx';

% Create a document TitleAuthor that uses the template mytemplate.
rpt = Document('CrimeReport',type,'crimetemplate3');
open(rpt);

% Create a loop to cycle through the holes.
% Append content to each hole.
while(~strcmp(rpt.CurrentHoleId,'#end#'))
    switch(rpt.CurrentHoleId)
        case 'ArsonMap'
            imageObj = Image('C:\Users\Jeff\Google Drive\Tailored Process Optimization\TPO\Police_project\Chicago\Heat_maps\Arson_.png');
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'AssaultMap'
            imageObj = Image('C:\Users\Jeff\Google Drive\Tailored Process Optimization\TPO\Police_project\Chicago\Heat_maps\Assault_.png');
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'BatteryMap'
            imageObj = Image('C:\Users\Jeff\Google Drive\Tailored Process Optimization\TPO\Police_project\Chicago\Heat_maps\Battery_.png');
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'BurglaryMap'
            imageObj = Image('C:\Users\Jeff\Google Drive\Tailored Process Optimization\TPO\Police_project\Chicago\Heat_maps\Burglary_.png');
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'CriminalDamageMap'
            imageObj = Image('C:\Users\Jeff\Google Drive\Tailored Process Optimization\TPO\Police_project\Chicago\Heat_maps\Criminal_Damage_.png');
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'CriminalSexualAssaultMap'
            imageObj = Image('C:\Users\Jeff\Google Drive\Tailored Process Optimization\TPO\Police_project\Chicago\Heat_maps\Criminal_Sexual_Assault_.png');
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'CriminalTrespassMap'
            imageObj = Image('C:\Users\Jeff\Google Drive\Tailored Process Optimization\TPO\Police_project\Chicago\Heat_maps\Criminal_Trespass_.png');
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'DeceptivePracticeMap'
            imageObj = Image('C:\Users\Jeff\Google Drive\Tailored Process Optimization\TPO\Police_project\Chicago\Heat_maps\Deceptive_Practice_.png');
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'GamblingMap'
            imageObj = Image('C:\Users\Jeff\Google Drive\Tailored Process Optimization\TPO\Police_project\Chicago\Heat_maps\Gambling_.png');
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'HomicideMap'
            imageObj = Image('C:\Users\Jeff\Google Drive\Tailored Process Optimization\TPO\Police_project\Chicago\Heat_maps\Homicide_.png');
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'InterferenceWithPublicOfficerMap'
            imageObj = Image('C:\Users\Jeff\Google Drive\Tailored Process Optimization\TPO\Police_project\Chicago\Heat_maps\Interference_With_Public_Officer_.png');
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'IntimidationMap'
            imageObj = Image('C:\Users\Jeff\Google Drive\Tailored Process Optimization\TPO\Police_project\Chicago\Heat_maps\Intimidation_.png');
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'KidnappingMap'
            imageObj = Image('C:\Users\Jeff\Google Drive\Tailored Process Optimization\TPO\Police_project\Chicago\Heat_maps\Kidnapping_.png');
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'LiqourLawViolationMap'
            imageObj = Image('C:\Users\Jeff\Google Drive\Tailored Process Optimization\TPO\Police_project\Chicago\Heat_maps\Liqour_Law_Violation_.png');
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'MotorVechicleTheftMap'
            imageObj = Image('C:\Users\Jeff\Google Drive\Tailored Process Optimization\TPO\Police_project\Chicago\Heat_maps\Motor_Vechicle_Theft_.png');
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'NarcoticsMap'
            imageObj = Image('C:\Users\Jeff\Google Drive\Tailored Process Optimization\TPO\Police_project\Chicago\Heat_maps\Narcotics_.png');
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'Non-CriminalMap'
            imageObj = Image('C:\Users\Jeff\Google Drive\Tailored Process Optimization\TPO\Police_project\Chicago\Heat_maps\Non-Criminal_.png');
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'ObscenityMap'
            imageObj = Image('C:\Users\Jeff\Google Drive\Tailored Process Optimization\TPO\Police_project\Chicago\Heat_maps\Obscenity_.png');
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'OffenseInvolvingChildernMap'
            imageObj = Image('C:\Users\Jeff\Google Drive\Tailored Process Optimization\TPO\Police_project\Chicago\Heat_maps\Offense_Involving_Children_.png');
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'OtherOffenseMap'
            imageObj = Image('C:\Users\Jeff\Google Drive\Tailored Process Optimization\TPO\Police_project\Chicago\Heat_maps\Other_Offense_.png');
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'ProstitutionMap'
            imageObj = Image('C:\Users\Jeff\Google Drive\Tailored Process Optimization\TPO\Police_project\Chicago\Heat_maps\Prostitution_.png');
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'PublicPeaceViolationsMap'
            imageObj = Image('C:\Users\Jeff\Google Drive\Tailored Process Optimization\TPO\Police_project\Chicago\Heat_maps\Public_Peace_Violations_.png');
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'PublicIndecencyMap'
            imageObj = Image('C:\Users\Jeff\Google Drive\Tailored Process Optimization\TPO\Police_project\Chicago\Heat_maps\Public_Indecency_.png');
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'RobberyMap'
            imageObj = Image('C:\Users\Jeff\Google Drive\Tailored Process Optimization\TPO\Police_project\Chicago\Heat_maps\Robbery_.png');
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'SexualOffenseMap'
            imageObj = Image('C:\Users\Jeff\Google Drive\Tailored Process Optimization\TPO\Police_project\Chicago\Heat_maps\Sexual_Offense_.png');
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'StalkingMap'
            imageObj = Image('C:\Users\Jeff\Google Drive\Tailored Process Optimization\TPO\Police_project\Chicago\Heat_maps\Stalking_.png');
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'TheftMap'
            imageObj = Image('C:\Users\Jeff\Google Drive\Tailored Process Optimization\TPO\Police_project\Chicago\Heat_maps\Theft_.png');
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'WeaponsViolationMap'
            imageObj = Image('C:\Users\Jeff\Google Drive\Tailored Process Optimization\TPO\Police_project\Chicago\Heat_maps\Weapons_Violation_.png');
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
            
    end
    
    moveToNextHole(rpt);
end

% Generate and view the report.
close(rpt);
rptview(rpt.OutputPath)