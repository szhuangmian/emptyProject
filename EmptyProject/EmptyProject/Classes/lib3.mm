//
//  lib3.cpp
//  EmptyProject
//
//  Created by HuangMian on 2017/4/27.
//  Copyright © 2017年 HuangMian. All rights reserved.
//

#include "lib3.hpp"
//#include <map>
//#include <queue>
//#include <vector>
//#include <stack>
#include "stdio.h"
#include <string>
//#include <set>

using namespace std;


//#define MAX 150

char ans[150];
char b[150];
char c[150];

void twobigMul(char a[],char b[]){
    memset(c, '0',sizeof(&c));
    int i=0;
    int j=0;

    for(i=0;i<strlen(a);i++){
        int great = 0;
        for (j=0; j<strlen(b); j++) {
            int a1 = (a[i] - '0') ;
            int b1 = (b[j]- '0');
            int ab = a1 * b1;
            int c1 = (c[i+j]- '0');
            int result = ( ab+c1 +great);
            int left = result % 10;
            great =result/ 10;
            c[i+j] =  left +'0';
        }
        c[i+j] = great + '0';
    }
    c[i+j] = '\0';
    memset(ans,'0', sizeof(&ans));
    strcpy(ans, c);
}

void test(){
    int i=0;
    int n =3;
    char one[150]="9";
    i=0;
    int j = (int)strlen(one)-1;
    while (i<=j) {
        char t = one[i];
        one[i++] =one[j];
        one[j--] = t;
    }
    
    strcpy(ans, "1");

    twobigMul(ans, one);
    n--;
    for(int i=0;i<n;i++){
        twobigMul(ans, one);
    }

}

int pn(int n){
    if(n==100){
        return n;
    }
    return n+pn(n+1);
}

void pnn(){
   int n = pn(1);
    printf("n n %d",n);
}




