// . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
function ArrayUnique(array) {
	array 	= Array.sort(array);
	array 	= Array.concat(array, 999999);
	uniqueA = newArray();
	i = 0;	
   	while (i<(array.length)-1) {
		if (array[i] == array[(i)+1]) {
			//print("found: "+array[i]);			
		} else {
			splitmin=split(array[i], ":");
			uniqueA = Array.concat(uniqueA, splitmin[1]);
		}
   		i++;
   	}
	return uniqueA;
}


function Arrayfilter(array,minabr) {
	array 	= Array.sort(array);
	array 	= Array.concat(array, 999999);
	mineral = newArray();
	i = 0;	
   	while (i<(array.length)-1) {
   		splitLabel=split(array[i], ":");
		if (splitLabel[1] == minabr) {
			
			mineral = Array.concat(mineral, splitLabel[1]);		
		} else {
			///print()
		}
   		i++;
   	}
	return mineral;
}


Table.open("/tmp/Results.csv");
r=Table.getColumn("Label");

//r=Table.get("Label", 60);
//Array.print(r);
//unique = ArrayUnique(r);
//Array.print(unique);

unique = ArrayUnique(r);
//Array.print(unique);
i=0;
Mi="Modal:";
while (i<(unique.length)) {
   				
mins = Arrayfilter(r,unique[i]);
//Array.print(mins);
//print(mins.length);
//print(r.length);
pr=floor(mins.length/r.length*100);
//print(unique[i]+'-'+pr+"%");
Mi=Mi+'\n '+unique[i]+'-'+pr+"%";

   		i++;
   	}
   	print(Mi);
   	
   	selectWindow("Montage");
	W=getWidth()/2.11;
	h=getHeight()/1.3;
	setForegroundColor(17, 17, 17);
   	makeText(Mi, W, h);
   	//drawString(Mi,  778, 621);