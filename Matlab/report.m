function [] = report(PW);
% clear;
% close;
% clc;

%***NOTE: Clear rpt varibale if windows word permission popup occurs

PW=[PW,'Heat_maps\']; %Changed to include heat map directory

import mlreportgen.dom.*;
type = 'docx';

% Create a document TitleAuthor that uses the template mytemplate.
rpt = Document('CrimeReport',type,'crimetemplate');
open(rpt);

% Create a loop to cycle through the holes.
% Append content to each hole.
while(~strcmp(rpt.CurrentHoleId,'#end#'))
    switch(rpt.CurrentHoleId)
        case 'ArsonMap'
            imageObj = Image([PW,'Arson_.png']);
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'AssaultMap'
            imageObj = Image([PW,'Assault_.png']);
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'BatteryMap'
            imageObj = Image([PW,'Battery_.png']);
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'BurglaryMap'
            imageObj = Image([PW,'Burglary_.png']);
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'CriminalDamageMap'
            imageObj = Image([PW,'Criminal_Damage_.png']);
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'CriminalSexualAssaultMap'
            imageObj = Image([PW,'Criminal_Sexual_Assault_.png']);
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'CriminalTrespassMap'
            imageObj = Image([PW,'Criminal_Trespass_.png']);
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'DeceptivePracticeMap'
            imageObj = Image([PW,'Deceptive_Practice_.png']);
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'GamblingMap'
            imageObj = Image([PW,'Gambling_.png']);
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'HomicideMap'
            imageObj = Image([PW,'Homicide_.png']);
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'InterferenceWithPublicOfficerMap'
            imageObj = Image([PW,'Interference_With_Public_Officer_.png']);
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'IntimidationMap'
            imageObj = Image([PW,'Intimidation_.png']);
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'KidnappingMap'
            imageObj = Image([PW,'Kidnapping_.png']);
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'LiqourLawViolationMap'
            imageObj = Image([PW,'Liqour_Law_Violation_.png']);
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'MotorVechicleTheftMap'
            imageObj = Image([PW,'Motor_Vechicle_Theft_.png']);
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'NarcoticsMap'
            imageObj = Image([PW,'Narcotics_.png']);
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'Non-CriminalMap'
            imageObj = Image([PW,'Non-Criminal_.png']);
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'ObscenityMap'
            imageObj = Image([PW,'Obscenity_.png']);
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'OffenseInvolvingChildernMap'
            imageObj = Image([PW,'Offense_Involving_Children_.png']);
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'OtherOffenseMap'
            imageObj = Image([PW,'Other_Offense_.png']);
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'ProstitutionMap'
            imageObj = Image([PW,'Prostitution_.png']);
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'PublicPeaceViolationsMap'
            imageObj = Image([PW,'Public_Peace_Violations_.png']);
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'PublicIndecencyMap'
            imageObj = Image([PW,'Public_Indecency_.png']);
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'RobberyMap'
            imageObj = Image([PW,'Robbery_.png']);
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'SexualOffenseMap'
            imageObj = Image([PW,'Sexual_Offense_.png']);
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'StalkingMap'
            imageObj = Image([PW,'Stalking_.png']);
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'TheftMap'
            imageObj = Image([PW,'Theft_.png']);
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
        case 'WeaponsViolationMap'
            imageObj = Image([PW,'Weapons_Violation_.png']);
            imageObj.Style = {ScaleToFit};
            append(rpt,imageObj);
            
    end
    
    moveToNextHole(rpt);
end

% Generate and view the report.
close(rpt);
%rptview(rpt.OutputPath)
end