///////////////////////

var mineral;
var colors;

selectWindow("test");
run("Grid...", "grid=Circles area=0.4 color=Red bold");
run("To ROI Manager");
roiManager("Select", 0);
roiManager("Split");
roiManager("Delete");
//roiManager("Show All");
roiManager("Remove Slice Info");
roiManager("Remove Frame Info");
//run("Labels...", "color=red font=24 show bold");


function rename_point(){
	//while(selectionType()!=1){};
	
	roiManager("Rename", mineral);
	roiManager("Set Color", colors);
	//roiManager("deselect");
	}


function type_mineral(){
	mineral=getString("Абривиатура минерала:", "pl");
	colors=getString("Цвет минерала:", "red");
}

	
function count_mineral(){
	type_mineral();
	while (!isKeyDown("shift")) {

				if(roiManager("index")!=-1) {
							rename_point();
							wait(100);
			}
	}
}

///////////////////del point by circle out//////////////////////////////

function L(x0,y0,xa,ya){
	l=sqrt((x0-xa)*(x0-xa)+(y0-ya)*(y0-ya));
	return l
}


x0=getHeight()/2;
y0=getWidth()/2;
//makePoint(x0, y0);
x1=getHeight()/2;
y1=0;

d=L(x0,y0,x1,y1);

//print(d);

del_point=0;

cont=roiManager("count")

for (i = 0; i < cont; i++) {
	roiManager("Select", i);
	getSelectionCoordinates(xa, ya);
	
	l=L(x0,y0,xa[0],ya[0]);
	//print(l);
	if(l>d){
		del_point=Array.concat(del_point,i);
	}

}

//Array.print(del_point);

	roiManager("Select", del_point);
	roiManager("Delete");
	
cont=roiManager("count")

i=0;
	do{
		roiManager("Select", i);
		roiManager("rename", "o");
		i=i+1; 
	} while(i<cont);
	
	roiManager("Associate", "false");
	roiManager("Centered", "false");
	roiManager("UseNames", "true");
	
///////////////////body program/////////////////////

var answer=1;

while (answer==1) {
			count_mineral();	
			answer=getBoolean("Продолжить?");
}




