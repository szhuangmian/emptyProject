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

//copyright@ mark allen weiss && July && yansha
//July，yansha、updated，2011.05.08.

//本程序，后经飞羽找出错误，已经修正。
//随机选取枢纽元，寻找最小的第k个数
#include <iostream>
#include <stdlib.h>
using namespace std;

int my_rand(int low, int high)
{
    int size = high - low + 1;
    return  low + rand() % size;
}

//q_select places the kth smallest element in a[k]
int q_select(int a[], int k, int left, int right)
{
    if(k > right || k < left)
    {
        //         cout<<"---------"<<endl;   //为了处理当k大于数组中元素个数的异常情况
        return false;
    }
    
    //真正的三数中值作为枢纽元方法，关键代码就是下述六行
    int midIndex = (left + right) / 2;
    if(a[left] < a[midIndex])
        swap(a[left], a[midIndex]);
    if(a[right] < a[midIndex])
        swap(a[right], a[midIndex]);
    if(a[right] < a[left])
        swap(a[right], a[left]);
    swap(a[left], a[right]);
    
    int pivot = a[right];   //之前是int pivot = right，特此，修正。
    
    
    // 申请两个移动指针并初始化
    int i = left;
    int j = right-1;
    
    // 根据枢纽元素的值对数组进行一次划分
    for (;;)
    {
        while(a[i] < pivot)
            i++;
        while(a[j] > pivot)
            j--;
        //a[i] >= pivot, a[j] <= pivot
        if (i < j)
            swap(a[i], a[j]);   //a[i] <= a[j]
        else
            break;
    }
    swap(a[i], a[right]);
    
    /* 对三种情况进行处理
     1、如果i=k，即返回的主元即为我们要找的第k小的元素，那么直接返回主元a[i]即可;
     2、如果i>k，那么接下来要到低区间A[0....m-1]中寻找，丢掉高区间;
     3、如果i<k，那么接下来要到高区间A[m+1...n-1]中寻找，丢掉低区间。
     */
    if (i == k)
        return true;
    else if (i > k)
        return q_select(a, k, left, i-1);
    else return q_select(a, k, i+1, right);
}

//int main()
//{
//    int i;
//    int a[] = {7, 8, 9, 54, 6, 4, 11, 1, 2, 33};
//    q_select(a, 4, 0, sizeof(a) / sizeof(int) - 1);
//    return 0;
//}




