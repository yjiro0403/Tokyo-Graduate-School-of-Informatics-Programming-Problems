import std.stdio, std.algorithm, std.string, std.array, std.conv;

string uniq_chr(string str){
    auto buf=str;

    foreach(int i;0..buf.length-1){
        int j=i+1;
        while(j<buf.length){
            if(buf[i] == buf[j]){
                auto buf2 = buf[0..j]~buf[j+1..buf.length];
                buf = buf2;
            }else{ j++; }
        }
    }
    return buf;
}

void main()
{
    int[char] valstate;
    string valist;
    string arr = readln().dup.chomp;
    int counter;
    bool none_flag=false;

    writeln(arr);
    
    //syokika
    //get all val
    valist = uniq_chr(arr.removechars("+&"));
    string[] forms = arr.idup.split('+');
    
    foreach(char c; valist) {
	valstate[c] = 0;	
    }
    /*
    {
	write(valstate.values.all!"a & 1");
    }*/
    
    //calc t or f
    while (!valstate.values.all!"a & 1") {
	
	foreach(c; forms) {
	    string[] buf = c.split('&');
	    //writeln(buf);
	    
	    {//check function   
	    bool flag = true;
	    foreach(line; buf){
		if (valstate[line.to!char] == 0)
		    flag = false;
	    }
		if (flag) {
		    writeln(valstate);
		    none_flag = true;
		}
	    }
	    
	}
	//writeln(valstate);

	//modify values
	counter++;
	int k=counter;
	int i;
	while(k){
	    valstate[valist[i]] = k % 2;
	    k /= 2;
	    i++;
	}
    }

    //do for last loop
    	foreach(c; forms) {
	    string[] buf = c.split('&');
	    //writeln(buf);
	    
	    {//check function   
		bool flag = true;
		foreach(line; buf){
		    if (valstate[line.to!char] == 0)
			flag = false;
		}
		if (flag) {
		    writeln(valstate);
		    none_flag = true;
		}
	    }
	    
	}

    if(!none_flag)
	writeln("none");
}