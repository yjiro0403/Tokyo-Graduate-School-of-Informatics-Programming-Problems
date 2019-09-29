import std.stdio, std.algorithm, std.conv, std.experimental.logger;
import std.string, std.array;
import std.random;
import std.datatime, core.thread;

const int RP = 9; //9kai nyuryoku
const int maruwin = 10;
const int batuwin = 11;

char[3][] field = ["---",
                  "---",
                  "---"];

int judge() {
    foreach (int i; 0..2) {
        if (field[i] == "ooo")
            return maruwin;
        if (field[0][i] == 'o' && field[1][i] == 'o'  && field[2][i] == 'o'){
            return maruwin;
        } else if (field[i] == "xxx" ||
               (field[0][i] == 'x' && field[1][i] == 'x' && field[2][i] == 'x')){
            return batuwin;
        }
    }

    return 0;
}

void main()
{
    int i = 0;
    int judge_flag;
    auto r = Random(unprediotableSeed);
    
    while (i < 9) {
        int[2] push = [uniform(0, 3, r),uniform(0, 3, r)];
        while (field[push[0]][push[1]] != '-')
            push = [uniform(0, 3, r),uniform(0, 3, r)];
        
        stderr.write(push[0]);
        stderr.writeln(push[1]);
        
        if (field[push[0]][push[1]] != '-'){
            stderr.writeln("can not put");
            } else if (i % 2 == 0){
                field[push[0]][push[1]] = 'o';
                i++;
            } else {
                field[push[0]][push[1]] = 'x';
                i++;
            }
        
        foreach(int j;0..field.length)
            stderr.writeln(field[j]);

        if ((judge_flag = judge()) != 0)
            i = 10;

        Thread.sleep(dur!("seconds")(5));
    }
    
    if (judge_flag == 0)
        writeln("dlow");
    else if (judge_flag == maruwin)
        writeln("maru WIN");
    else
        writeln("batu WIN");
}