#include "../stdaf.hpp"

typedef struct mat{
    int num; //行数を格納する
    string str;
}Mat;

vector<Mat> strMat, didMat; //同じだと判断した文字列を格納

int simcheck(string str)
{
    for (size_t i = 0; i < strMat.size(); i++)
        if (str ==  strMat[i].str)
            return strMat[i].num;

    return 0;
}

int main(void)
{
    ifstream ifs("program.txt");
    
    if (ifs.fail()){
        std::cerr << "失敗" << std::endl;
        return 1;
    }

    string str;
    for (int i=1; getline(ifs, str); i++){
        int num = simcheck(str);
        if (num){
            //文字列が存在した
            didMat.push_back({num, str});
        } else
            strMat.push_back({i, str});
    }

    //sort
    for (size_t j = 0; j < didMat.size()-1; j++)
        for(size_t k = didMat.size()-1; k > j; k--)
            if (didMat[k-1].num > didMat[k].num){
                Mat temp = didMat[k-1];
                didMat[k-1] = didMat[k];
                didMat[k] = temp;
            }

    for (size_t j = 0; j < didMat.size(); j++)
        cout << didMat[j].str << endl;

    cout << "Match : " << didMat.size() << endl;
}