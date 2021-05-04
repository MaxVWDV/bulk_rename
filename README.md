# bulk_rename
Brief MATLAB function for automatically renaming satellite images to YYYYMMDD from a range of
prior formats. Intended for pre-procession prior to using GIV.

INPUTS:
projectdir = location of the files
filetype = origin of the files, two sources currently supported are
                'GEE'  - Files downloaded from Google Earth Engine
                'EOB'  - Files downloaded from Sentinel EO-Browser

There are no outputs, running this function simply renames the files in
their folder. Note that you should ONLY have the images in the folder,
any other (e.g. text files, etc) will also be renamed which may cause
problems. I recommend putting files in a new, empty folder to run this.

EXAMPLE USAGE:
bulk_rename('C:\Users\gmaxv\Documents\test_glacier','GEE')

Max Van Wyk de Vries, Feb 2021 @ University of Minnesota
