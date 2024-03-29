#include "../stdaf.hpp"

#define NEW_STR 10 //新しい文字列が読み込まれた
#define SIM 11 //類似した文字列が見つかった
#define NOSIM 12 //類似した文字列が見つからなかった

typedef struct mat{
    int num; //行数を格納する
    string str;
}Mat;

vector<Mat> strMat, didMat; //同じだと判断した文字列を格納

bool strcheck(string str1, string str2)
{
    int cnt = 0;

    if(str1.size() > str2.size())
        str2.resize(str1.size(),' ');
    else
        str1.resize(str2.size(),' ');

    for(size_t i = 0; i < str1.size();i++)
        if(str1[i] != str2[i]){
            //cout << str1[i] << str2[i] << endl;
            cnt++;
        }
            
    if(cnt < 5)
        return true;
    else
        return false;
}

int simcheck(string str)
{
    int cnt = 0;
    
    for(size_t i = 0; i < strMat.size(); i++){
        if (str == strMat[i].str){
            cout << str << " : " << str << endl;
            cnt++;
        } else {
            bool flag = strcheck(str, strMat[i].str);
            if (flag){
                cout << str << " : " << strMat[i].str << endl;
                cnt++;
            }
        }
    }
   
    return cnt;
}

int main(void)
{
    ifstream ifs("program.txt");
    
    if (ifs.fail()){
        std::cerr << "失敗" << std::endl;
        return 1;
    }

    string str;
    int cnt = 0;
    for (int i=1; getline(ifs, str); i++){
        int n = simcheck(str);
        if (n){
            //文字列が存在した
            cnt += n;
        } else {
            strMat.push_back({i, str});
        }
    }

    cout << "Sim : " << cnt << endl;
}