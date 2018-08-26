//+------------------------------------------------------------------+
//|                                            CanvasGlitterBomb.mq4 |
//|                                 Copyright © 2017, Matthew Kastor |
//|                                 https://github.com/matthewkastor |
//+------------------------------------------------------------------+
#property copyright "Matthew Kastor"
#property link      "https://github.com/matthewkastor"
#property strict

#include <Canvas\Canvas.mqh> 
//+------------------------------------------------------------------+ 
//| Script program start function                                    | 
//+------------------------------------------------------------------+ 
void OnStart()
  {
   CCanvas canvas;
   int      Width=RandomNumber(100,800);
   int      Height=RandomNumber(50,150);

   if(!canvas.CreateBitmapLabel(0,0,("CirclesCanvas"+(string)RandomNumber(0,100000)),30,30,Width,Height,COLOR_FORMAT_ARGB_NORMALIZE))
     {
      Print("Error creating canvas: ",GetLastError());
     }

   canvas.Erase(ARGB(0,0,0,0));

   for(int i=0;i<100;i++)
     {
      canvas.FillCircle(RandomNumber(0,Width),RandomNumber(0,Height),RandomNumber(5,5),RandomColor());
     }
   canvas.Update();
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double RandomNumber()
  {
   return (double)MathRand()/(double)32767;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double RandomNumber(double min,double max)
  {
   double range=max-min;
   return min+(RandomNumber()*range);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int RandomNumber(int min,int max)
  {
   return (int)MathFloor(RandomNumber((double)min,(double)max));
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int RandomColor()
  {
   return ARGB((int)MathFloor(RandomNumber(0,255))
               ,(int)MathFloor(RandomNumber(0,255))
               ,(int)MathFloor(RandomNumber(0,255))
               ,(int)MathFloor(RandomNumber(0,255)));
  }
//+------------------------------------------------------------------+
