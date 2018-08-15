//+------------------------------------------------------------------+
//|                                               MonkeySettings.mqh |
//|                                 Copyright © 2017, Matthew Kastor |
//|                                 https://github.com/matthewkastor |
//+------------------------------------------------------------------+
#property copyright "Matthew Kastor"
#property link      "https://github.com/matthewkastor"
#property strict

sinput string MonkeySettings1; // ####
sinput string MonkeySettings2; // #### Signal Settings
sinput string MonkeySettings3; // ####

input int LctPeriod=120; // Period for calculating exits.
input double LctMinimumTpSlDistance=3.0; // Tp/Sl minimum distance, in spreads.
input double LctSkew=0.18; // Skew sl/tp spread
input double LctAtrMultiplier=0.675; // Sl/tp spread width.
input int LctRangePeriod=12; // Range Period
input ENUM_TIMEFRAMES LctIntradayTimeframe=PERIOD_H1; // Intraday Timeframe
input int LctIntradayPeriod=14; // Intraday Period

#include <EA\PortfolioManagerBasedBot\BasicSettings.mqh>
//+------------------------------------------------------------------+
