function bulk_rename(projectdir,filetype)
%Function for bulk renaming files into the YYYYMMDD format from a range of
%prior formats.
%
%INPUTS:
%projectdir = location of the files
%filetype = origin of the files, two sources currently supported are
%                 'GEE'  - Files downloaded from Google Earth Engine
%                 'EOB'  - Files downloaded from Sentinel EO-Browser
%
% There are no outputs, running this function simply renames the files in
% their folder. Note that you should ONLY have the images in the folder,
% any other (e.g. text files, etc) will also be renamed which may cause
% problems. I recommend putting files in a new, empty folder to run this.
%
%EXAMPLE USAGE:
% bulk_rename('C:\Users\gmaxv\Documents\test_glacier','GEE')
%
%Max Van Wyk de Vries, Feb 2021 @ University of Minnesota

%Check inputs
if strcmpi(filetype,'GEE') || strcmpi(filetype,'EOB')
    %Good inputs!
else
    help bulk_rename
    error('The filetype option must currently be either GEE or EOB - please change your inputs. See help above for more details')
end

%Read the file names from given folder
dinfo = dir( fullfile(projectdir) );

%Read the file extension
[~,~,ext] = fileparts(strcat(projectdir,dinfo.name));

oldnames = {dinfo.name};

%For each file, rename it to YYYYMMDD based on existing name data
for K = 3 : length(oldnames)
    if strcmpi(filetype,'GEE')
        temp = char(oldnames(K));
        year = temp(1:4); %Note how this extracts part of the string. If you want to create your own custom version, follow this logic.
        month = temp(5:6);
        day = temp(7:8);
    elseif strcmpi(filetype,'EOB')
        [year,month] = strtok(oldnames(K),'-');
        [month,day] = strtok(month,'-');
        day = strtok(day,'-');
        day = strtok(day,' ');
    end
    this_name = oldnames{K};
    new_name = char(strcat(year,month,day,ext));
    
    %Finally, re-save it with the new name
    movefile( fullfile(projectdir, this_name), fullfile(projectdir, new_name) );
end