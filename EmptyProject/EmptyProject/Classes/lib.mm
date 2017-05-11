//
//  lib.cpp
//  EmptyProject
//
//  Created by HuangMian on 2017/4/19.
//  Copyright © 2017年 HuangMian. All rights reserved.
//

#include "lib.hpp"

#define MAXN 4
char blocks[MAXN][MAXN]={{'.','X','.','.'},
    {'.','.','.','.'},
    {'X','X','.','.'},
    {'.','.','.','.'}};

void printArr(char a[][MAXN],int n){
    for(int i=0;i<n;i++){
        for(int j=0;j<n;j++){
            printf("%c",a[i][j]);
        }
        printf("\n");
    }
    printf("\n");
}

void solove1(int n,int *k,int *max,int *count){

    int canput = 0;
    for(int i=0;i<n;i++){
        for(int j=0;j<n;j++){
            (*count)++;

            if(blocks[i][j]=='.'&&judge(i, j,n)){
                canput = 1;
                (*k)++;
                blocks[i][j] = 'O';
                solove1(n,k,max,count);
                blocks[i][j] = '.';
                (*k)--;
            }
          
        }
    }
 
    if(canput==0){
        printf("#Case:%d\n",*count);
        //printArr(blocks, n);
        if(*k>*max){
            *max=*k;
        }
    }
  
}

void solve2(int T,int *k,int n,int *max,int *count){
    (*count) ++;
  
    if(T >= n*n){
        printf("#Case:%d\n",*count);
        if(*k > *max){
            *max = *k;
        }
        return;
    }
    
    int i = T / n;
    int j = T % n;
    
    if(blocks[i][j]=='.' && judge(i, j,n)){
        blocks[i][j] = 'O';
        (*k)++;
        solve2(T+1,k,n,max,count);
        (*k)--;

        blocks[i][j] = '.';
    }
    
    solve2(T+1,k,n,max,count);
}

int judge(int x,int y,int n){
    int i,j;
    for(i=x;i>=0;i--){
        if(blocks[i][y] =='O'){
            return 0;
        }
        if(blocks[i][y] == 'X'){
            break;
        }
    }
    for(i=x;i<n;i++){
        if(blocks[i][y] =='O'){
            return 0;
        }
        if(blocks[i][y] == 'X'){
            break;
        }
    }
    
    for(j=y;j>=0;j--){
        if(blocks[x][j] =='O'){
            return 0;
        }
        if(blocks[x][j] == 'X'){
            break;
        }
    }
    for(j=y;j<n;j++){
        if(blocks[x][j] =='O'){
            return 0;
        }
        if(blocks[x][j] == 'X'){
            break;
        }
    }
    
    return 1;
}

int a[MAXN][MAXN];

void printArr2(int a[][MAXN],int n){
    for(int i=0;i<n;i++){
        for(int j=0;j<n;j++){
            printf("%d",a[i][j]);
        }
        printf("\n");
    }
    printf("\n");
}

void NQueen(int n,int *k){
    for(int i=0;i<n;i++){
        for(int j=0;j<n;j++){
            a[i][j]=0;
        }
    }
    NQueenSolve(0, n,k);
}
int judgeQuee(int x,int y,int n){
    int i,j;
    for(j=0;j<n;j++){
        if(a[x][j]==1){
            return 0;
        }
    }
    
    for(i=0;i<n;i++){
        if(a[i][y]==1){
            return 0;
        }
    }
    
    for(i=x,j=y;i>=0 && j>=0;i--,j--){
        if(a[i][j]==1){
            return 0;
        }
    }
    for(i=x,j=y;i>=0 && j<n;i--,j++){
        if(a[i][j]==1){
            return 0;
        }
    }
 
    return 1;
}
void NQueenSolve(int row,int n,int *k){
    if(row ==n){
        (*k)++;
        printf("#Case:%d\n",*k);
        printArr2(a, n);
        return;
    }
    for(int col=0;col<n;col++){
        if(a[row][col]==0 && judgeQuee(row, col,n)){
            a[row][col]=1;
            NQueenSolve(row+1,n,k);
            a[row][col]=0;
        }
    }
}




