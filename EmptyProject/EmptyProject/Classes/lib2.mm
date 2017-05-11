//
//  lib2.cpp
//  EmptyProject
//
//  Created by HuangMian on 2017/4/19.
//  Copyright © 2017年 HuangMian. All rights reserved.
//

#include "lib2.hpp"

#define X_SIZE 5
#define Y_SIZE 5

/////////////////////////////////////////深度////////////////////////////////////////////////////
int dir[][2] = {{1,0},{-1,0},{0,1},{0,-1}};
int matrix[X_SIZE][Y_SIZE] =
   {0,1,1,1,1,
    0,0,0,0,0,
    0,0,1,1,0,
    1,0,0,0,0,
    0,1,1,0,0};
int used[X_SIZE][Y_SIZE] = {0};

void dfs(int x,int y)
{
    if(x == X_SIZE - 1 && y == Y_SIZE - 1)
    {
        matrix[x][y] = 8;

        for(int i=0; i<X_SIZE; i++){
            for(int j=0; j<Y_SIZE; j++){
             
                printf("%d",matrix[i][j]);
                    
            }
            printf("\n");
        }
        printf("--------------\n");
        matrix[x][y] = 0;

        return ;
    }
    
    if(matrix[x][y] == 0 && x >=0 && x < X_SIZE
       && y >=0 && y < Y_SIZE ){
        
        // 这一条件是为了避免当 matrix[X_SIZE-1][Y_SIZE-1] = 0 时输出两次！是否还有其他解决方法呢？知道的同学请回复
        //            if(x+dir[k][0] == X_SIZE-1 && y+dir[k][1] == Y_SIZE){
        //
        //            }
        //            else
        //            {
        matrix[x][y] = 8;

        for(int k=0; k<4; k++)
        {
            
            dfs(x+dir[k][0],y+dir[k][1]);
        }
        matrix[x][y] = 0;

    }
}
