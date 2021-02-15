var d;

function clip(){
		   
	run("Copy");
	newImage("test", "RGB white", d, d, 1);
	run("Paste");
}

function mask(){
	
	setTool("polygon");
	while(selectionType()==-1){}; 

	usl=0;
	
	while(usl<4){
		getSelectionCoordinates(x, y);
		usl=x.length;
		//Array.print(x);
	}

		
	//getSelectionCoordinates(x, y);
	xa=x[0];xb=x[1];xc=x[2];
	ya=y[0];yb=y[1];yc=y[2];
	
	xa2=xa*xa;xb2=xb*xb;xc2=xc*xc;
	ya2=ya*ya;yb2=yb*yb;yc2=yc*yc;
	
	bc=xb2+yb2-xc2-yc2;
	ca=xc2+yc2-xa2-ya2;
	ab=xa2+ya2-xb2-yb2;
	
	dbc=yb-yc;
	dca=yc-ya;
	dab=ya-yb;
	
	x0=-1/2*((ya*bc+yb*ca+yc*ab)/(xa*dbc+xb*dca+xc*dab));
	y0=1/2*((xa*bc+xb*ca+xc*ab)/(xa*dbc+xb*dca+xc*dab));
	l=sqrt((x0-xa)*(x0-xa)+(y0-ya)*(y0-ya));
	d=l*2;

		//print("X0"+x0);
		//print("y0"+y0);
		//selectWindow("Stack");
		makePoint(x0, y0, "small yellow hybrid");
		//roiManager("Add");
		makeOval(x0-d/2, y0-d/2,d,d);
		roiManager("Add");
		roiManager("Select", 0);
		//roiManager("Update");
		roiManager("Remove Slice Info");
		roiManager("Remove Frame Info");
		
	
	
	}
//mask();

function mont(){
	wait(2000);
	dpole=getNumber("diametr pole:", 1);
	
	clip();
	 
	selectWindow("Stack");
	run("Next Slice [>]");
	roiManager("Select", 0);

    clip();

	run("Images to Stack", "name=test");
	run("Make Montage...", "columns=2 rows=1 scale=0.25 increment=0");
	selectWindow("Montage");
	W=getWidth()/2.15;
	//selectWindow("Montage");
	h=getHeight();
		makePoint(W, 40, "small yellow hybrid");
	run("Set Scale...", "distance=&h known=&dpole pixel=1 unit=mm global");
	run("Scale Bar...", "width=0.50 height=15 font=18 color=Black background=None location=[At Selection] bold overlay");
}

var answer;

function redraw(){
	i=1;

do{i=i+1;	answer=getBoolean("Перестроить?");
			if (answer==1) {
			selectWindow("Montage");
			close();
			selectWindow("test");
			close();
			selectWindow("Stack");
			run("Previous Slice [<]");
			roiManager("Select", 0);
			
		mont();
}else{i=i+10;}

} while(i<4);

}

//////////////////////////////////
open();
tt=File.directory;
file=File.name;
ffile=tt+file;
open(ffile);

run("Open Next");
run("Images to Stack", "name=Stack title=[]");

requires("1.30k");
setForegroundColor(255, 255, 255);

mask();
mont();
redraw();
//////////////////////////////////
