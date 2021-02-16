// make directory for project

var home_directory;
var new_directory;

thin_section_name=getString("Name thin section", "1");
home_directory=getDirectory("Choose a Directory");
make_directory=home_directory+thin_section_name;
File.makeDirectory(make_directory);
selectWindow("Montage.tif");
save(make_directory+"/"+thin_section_name+".png");
save(make_directory+"/"+thin_section_name+".tif");
selectWindow("Stack");
save(make_directory+"/"+thin_section_name+".gif");

roiManager("Select", 0);
run("Select All");
roiManager("Save", make_directory+"/"+thin_section_name+".zip");

roiManager("Select", 0);
run("Select All");
roiManager("multi-measure append");
saveAs("Results", make_directory+"/"+thin_section_name+".csv");
