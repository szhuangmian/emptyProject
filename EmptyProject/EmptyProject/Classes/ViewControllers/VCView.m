//
//  VCView.m
//  EmptyProject
//
//  Created by HuangMian on 2017/5/31.
//  Copyright © 2017年 HuangMian. All rights reserved.
//

#import "VCView.h"

@interface VCView(){
    
    CGPoint firstPoint;
    NSMutableArray *touchPoints;
    CGFloat row;
    CGFloat colum;
    CGFloat factor;
    CGFloat chessWidth;
    CGFloat chessHeight;
    CGFloat screenWidth;
    CGFloat screenHeight;
    int clickX;
    int clickY;
}

@end

@implementation VCView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
      CGContextRef context = UIGraphicsGetCurrentContext();
      CGContextTranslateCTM(context, 0, rect.size.height);
      CGContextScaleCTM(context, 1, -1);
      CGContextSetFillColorWithColor(context, [[UIColor blueColor] CGColor]);
      CGContextAddRect(context, self.bounds);
      CGContextFillPath(context);
//
//    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
//    CGContextSetLineWidth(context, 0.5);
//    for(NSMutableArray* lines in touchPoints){
//        
//        for(int j=0;j<[lines count]-1;j++){
//            CGPoint firstPoint = [[lines objectAtIndex:j] CGPointValue];
//            CGPoint secondPoint = [[lines objectAtIndex:j+1] CGPointValue];
//            CGContextMoveToPoint(context, firstPoint.x, firstPoint.y);
//            CGContextAddLineToPoint(context, secondPoint.x, secondPoint.y);
//        }
//    }
//    CGContextStrokePath(context);
//    
//    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 100, 100)];
//    [[UIColor yellowColor] setFill];
//    [path fill];
    
 
    
    CGFloat leftX = (screenWidth - chessWidth) / 2.0;
    CGFloat letfY =  (screenHeight - chessHeight) / 2.0;
    
    CGContextAddRect(context, CGRectMake(leftX, letfY, chessWidth, chessHeight));
    CGContextSetLineWidth(context, 2);
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextStrokePath(context);
    
    for(int i=1;i<row;i++){
        CGContextMoveToPoint(context, leftX,letfY + i * factor);
        CGContextAddLineToPoint(context, leftX + chessWidth, letfY + i *factor);
        CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
        CGContextStrokePath(context);
    }
    
    for(int i=1;i<colum;i++){
        CGContextMoveToPoint(context, leftX + i * factor, letfY);
        CGContextAddLineToPoint(context, leftX + i * factor, letfY + chessHeight);
        CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
        CGContextStrokePath(context);
    }
    
    clickX = (firstPoint.y - letfY) / factor;
    clickY = (firstPoint.x - leftX) / factor;
    
    NSLog(@"click row %d colum %d",clickX,clickY);
    CGContextScaleCTM(context, 1, -1);
    CGContextTranslateCTM(context, 0, -screenHeight);
    CGContextAddRect(context, CGRectMake(leftX + clickY * factor, letfY + clickX * factor, factor, factor));
    CGContextSetFillColorWithColor(context, [UIColor yellowColor].CGColor);
    CGContextFillPath(context);

}

-(id)init{
    self = [super init];
    if(self){
        [self initData];
    }
    return self;
}
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        
        [self initData];
    }
    return  self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        
        [self initData];
    }
    return  self;
}

-(void)initData{
    touchPoints = [NSMutableArray array];
    row = 9;
    colum = 9;
   
    screenWidth = self.frame.size.width;
    screenHeight = self.frame.size.height;
    
    factor = (screenHeight - 10 * 2) / row > (screenWidth - 10 * 2) / colum?(screenWidth - 10 * 2) / colum:(screenHeight - 10 * 2) / row;
    chessWidth = colum * factor;
    chessHeight = row * factor;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    debug(@"touchesBegan");
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    firstPoint = touchPoint;
    //[touchPoints removeAllObjects];
    NSMutableArray *pointArray = [NSMutableArray array];
    //[touchPoints addObject:pointArray];
    [self setNeedsDisplay];

}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    debug(@"touchesMoved");
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    //[touchPoints addObject:[NSValue valueWithCGPoint:touchPoint]];
    //NSMutableArray *array = [touchPoints lastObject];
    //[array addObject:[NSValue valueWithCGPoint:touchPoint]];
    //[self setNeedsDisplay];
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    debug(@"touchesCancelled");
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    //[touchPoints addObject:[NSValue valueWithCGPoint:touchPoint]];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    debug(@"touchesEnded");
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    //[touchPoints addObject:[NSValue valueWithCGPoint:touchPoint]];
}

-(void)touchesEstimatedPropertiesUpdated:(NSSet<UITouch *> *)touches{
    debug(@"touchesEstimatedPropertiesUpdated");

}
@end
