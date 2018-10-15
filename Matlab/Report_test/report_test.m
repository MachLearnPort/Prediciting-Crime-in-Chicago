clear;
clc;
close;

import mlreportgen.dom.*;

type = 'docx';

% Create a template object
t = Template('mytemplate',type);

% Add a title hole to the template and apply the Title style
hole = append(t,TemplateHole('TITLE'));
hole.Description = ('Title Description');
hole.DefaultHoleStyleName = 'Title';

% Add a paragraph with boilerplate text and apply the Subtitle format
% Position the paragraph and preserve white space in the text 
p = Paragraph('Author: ');
p.StyleName = 'Subtitle';
p.Style = {OuterMargin('0','0','1in','1in')};
p.WhiteSpace = 'preserve';

% Append an inline hole to paragraph  
hole = append(p,TemplateHole('AUTHOR'));
append(t,p);

close(t);

% Create a document TitleAuthor that uses the template mytemplate.
rpt = Document('TitleAuthor',type,'crimetest');
open(rpt);

% Create a loop to cycle through the holes. 
% Append content to each hole.
while(~strcmp(rpt.CurrentHoleId,'#end#'))
    switch(rpt.CurrentHoleId)
        case 'TITLE'
            append(rpt,Paragraph('This Is My Title'));
        case 'AUTHOR'
            append(rpt,'My Name');
    end
    
    moveToNextHole(rpt);
end

% Generate and view the report.
close(rpt);
rptview(rpt.OutputPath)