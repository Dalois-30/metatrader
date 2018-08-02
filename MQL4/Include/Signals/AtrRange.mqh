//+------------------------------------------------------------------+
//|                                                     AtrRange.mqh |
//|                                 Copyright © 2017, Matthew Kastor |
//|                                 https://github.com/matthewkastor |
//+------------------------------------------------------------------+
#property copyright "Matthew Kastor"
#property link      "https://github.com/matthewkastor"
#property strict

#include <Signals\AtrBase.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class AtrRange : public AtrBase
  {
public:
                     AtrRange(int period,double atrMultiplier,ENUM_TIMEFRAMES timeframe,double skew,int shift=0,double minimumSpreadsTpSl=1,color indicatorColor=clrAquamarine);
   SignalResult     *Analyzer(string symbol,int shift);
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
AtrRange::AtrRange(int period,double atrMultiplier,ENUM_TIMEFRAMES timeframe,double skew,int shift=0,double minimumSpreadsTpSl=1,color indicatorColor=clrAquamarine):AtrBase(period,atrMultiplier,timeframe,skew,shift,minimumSpreadsTpSl,indicatorColor)
  {
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
SignalResult *AtrRange::Analyzer(string symbol,int shift)
  {
   PriceRange pr=this.CalculateRangeByPriceLowHighMidpoint(symbol,shift);

   this.DrawIndicatorRectangle(symbol,shift,pr.high,pr.low);

   MqlTick tick;
   bool gotTick=SymbolInfoTick(symbol,tick);
   double ctr=pr.mid;
   if(gotTick)
     {
      if(tick.bid>=pr.mid)
        {
         ctr=ctr+((pr.high-pr.low)*this._skew);
         this.Signal.isSet=true;
         this.Signal.time=tick.time;
         this.Signal.symbol=symbol;
         this.Signal.orderType=OP_SELL;
         this.Signal.price=tick.bid;
         this.Signal.stopLoss=(tick.ask+MathAbs(pr.high-ctr));
         this.Signal.takeProfit=(tick.ask-MathAbs(pr.low-ctr));
        }
      if(tick.ask<=pr.mid)
        {
         ctr=ctr-((pr.high-pr.low)*this._skew);
         this.Signal.isSet=true;
         this.Signal.orderType=OP_BUY;
         this.Signal.price=tick.ask;
         this.Signal.symbol=symbol;
         this.Signal.time=tick.time;
         this.Signal.stopLoss=(tick.bid-MathAbs(ctr-pr.low));
         this.Signal.takeProfit=(tick.bid+MathAbs(ctr-pr.high));
        }
     }
   return this.Signal;
  }
//+------------------------------------------------------------------+
