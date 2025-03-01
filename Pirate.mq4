//EA交易     =>  ...\MT4\MQL4\Experts

#property  copyright "Everything is free with us"
#property  link      "https://t.me/zeenotjee"
#property version    "1.20"
#property strict
#property description  "Expert Pirate Intended for trading with MT4 at Forex market,\n it is recommended use currency pairs:\n CHFJPY, EURCHF, EURAUD, USDCHF, USDCAD."
//#property  icon  "PIRATE_02.04.18_bmp\\PIRATE_02.04.18.ico"



//------------------
extern bool DisplayTable=false ;    //DISPLAY_TABLE
extern string оooooooooooooooooo="=== MONEY_MANAGEMENT ==="  ;  
extern bool MoneyManagement=true  ;    //MONEY_MANAGEMENT
extern double Risk=3  ;    //RISK
extern double OriginalLot=0.1  ;    //ORIGINAL_LOT
extern string ооoooooooooooooooo="=== SETTINGS_TRADES ==="  ;  
extern int   CountBuy=1  ;    //ORDERS_BUY
extern int   CountSell=1  ;    //ORDERS_SELL
extern int   TakeProfitClose=5  ;    //TAKE_PROFIT_CLOSE
extern int   StopLoss=35  ;    //STOP_LOSS
extern int   TakeProfit=20  ;    //TAKE_PROFIT
extern int   MaxSpreadOpen=30  ;    //MAX_SPREAD_OPEN
extern string оооooooooooooooooo="=== TRADE_TIME ==="  ;  
extern int   StartHour=0  ;    //START_HOUR
extern int   StopHour=1  ;    //STOP_HOUR
  bool      总_1_bo = false;
  int       总_2_in = 1;
  bool      总_3_bo = true;
  bool      总_4_bo = true;
  bool      总_5_bo = true;
  bool      总_6_bo = true;
  int       总_7_in = 0;
  int       总_8_in = 0;
  int       总_9_in = 1;
  int       总_10_in = 0;
  string    总_11_st = "00:00";
  string    总_12_st = "01:00";
  string    总_13_st = "=== SETTINGS_CLOSE_POSITIONS ===";
  bool      总_14_bo = true;
  bool      总_15_bo = true;
  int       总_16_in = 0;
  int       总_17_in = 15;
  bool      总_18_bo = false;
  bool      总_19_bo = false;
  bool      总_20_bo = true;
  bool      总_21_bo = true;
  bool      总_22_bo = true;
  double    总_23_do = 0.01;
  double    总_24_do = 0.06;
  double    总_25_do = 1.5;
  double    总_26_do = 0.0;
  double    总_27_do = 0.0;
  double    总_28_do = 0.0;
  double    总_29_do = 0.0;
  double    总_30_do = 0.0;
  double    总_31_do = 0.0;
  double    总_32_do = 0.0;
  double    总_33_do = 0.0;
  double    总_34_do = 0.0;
  double    总_35_do = 0.0;
  double    总_36_do = 0.0;
  double    总_37_do = 0.0;
  double    总_38_do = 0.0;
  double    总_39_do = 0.0;
  double    总_40_do = 0.0;
  double    总_41_do = 0.0;
  double    总_42_do = 0.0;
  double    总_43_do = 0.0;
  int       总_44_in = 0;
  int       总_45_in = 0;
  int       总_46_in = 100;
  int       总_47_in = 0;
  int       总_48_in = 0;
  int       总_49_in = 0;
  int       总_50_in = 0;
  int       总_51_in = 0;
  int       总_52_in = 0;
  bool      总_53_bo = false;
  bool      总_54_bo = false;
  bool      总_55_bo = true;
  double    总_56_do = 0.0;
  bool      总_57_bo = false;
  bool      总_58_bo = false;
  int       总_59_in = 0;
  int       总_60_in = 0;
  int       总_61_in_si43[43];
  int       总_62_in_si6[6];
  int       总_63_in_si6[6];
  double    总_64_do = 0.0;
  bool      总_65_bo = false;
  string    总_66_st = "";


 int OnInit()
 {
  datetime  子_2_da;
//----- -----
 bool       临_bo_1;
 bool       临_bo_2;

 if ( TerminalInfoString(13) == "Russian" )
  {
  总_57_bo = true ;
  }
 else
  {
  总_57_bo = false ;
  }
 总_19_bo = false ;
 if ( !(IsTradeAllowed()) )
  {
  if ( StringLen("For work necessary\nTo allow the Expert to trade")  >  0 && 总_20_bo && ( 总_21_bo || 总_66_st != "For work necessary\nTo allow the Expert to trade" ) )
   {
   总_66_st = "For work necessary\nTo allow the Expert to trade" ;
   Print(总_66_st); 
   }
  总_19_bo = true ;
  return(0); 
  }
 if ( !(IsTesting()) )
  {
  if ( IsExpertEnabled() )
   {
   if ( StringLen("Expert will be launched next tick")  >  0 && 总_20_bo && ( 总_21_bo || 总_66_st != "Expert will be launched next tick" ) )
    {
    总_66_st = "Expert will be launched next tick" ;
    Print(总_66_st); 
   }}
  else
   {
   if ( StringLen("Pressed button \"Allow start expert\"")  >  0 && 总_20_bo && ( 总_21_bo || 总_66_st != "Pressed button \"Allow start expert\"" ) )
    {
    总_66_st = "Pressed button \"Allow start expert\"" ;
    Print(总_66_st); 
  }}}
 else
  {
  Comment("https://t.me/free_fx_pro"); 
  }
 if ( !(TerminalInfoInteger(8)) )
  {
  Alert(" Check the terminal settings permit automatic trading!"); 
  }
 if ( !(MQLInfoInteger(4)) )
  {
  Alert(" Automated trading is prohibited in the program properties to ","Pirate.mq4"," ",Symbol()); 
  }
 if ( !(AccountInfoInteger(34)) )
  {
  Alert(" Automated trading is prohibited for the account ",AccountInfoInteger(0)," on the trading server side"); 
  }
 if ( !(AccountInfoInteger(33)) )
  {
  Comment(" Trade banned account ",AccountInfoInteger(0),".\n Perhaps the connection to the trading account produced by the invest password.","\n Check the terminal log, if there is such a record:","\n\'",AccountInfoInteger(0),"\': trading has been disabled - investor mode."); 
  }
 if ( Bars <  100 )
  {
  Print(" bars less than 100"); 
  return(0); 
  }
 if ( 总_19_bo )
  {
  if ( StringLen("Failed to initialize the EA!")  >  0 && 总_20_bo && ( 总_21_bo || 总_66_st != "Failed to initialize the EA!" ) )
   {
   总_66_st = "Failed to initialize the EA!" ;
   Print(总_66_st); 
   }
  return(1); 
  }
 总_47_in = 181818 ;
 总_44_in = SymbolInfoInteger(Symbol(),17) ;
 总_33_do = SymbolInfoDouble(Symbol(),16) ;
 总_34_do = SymbolInfoDouble(Symbol(),35) ;
 总_35_do = SymbolInfoDouble(Symbol(),34) ;
 总_37_do = SymbolInfoDouble(Symbol(),36) ;
 总_40_do = SymbolInfoDouble(Symbol(),26) ;
 if ( ( 总_44_in == 2 || 总_44_in == 4 ) )
  {
  总_33_do = Point() ;
  总_46_in = 10 ;
  }
 if ( ( 总_44_in == 3 || 总_44_in == 5 ) )
  {
  总_33_do = NormalizeDouble(Point() * 10.0,总_44_in) ;
  总_2_in=总_2_in * 10;
  }
 if ( ( 总_44_in == 3 || 总_44_in == 5 ) && ( StringFind(Symbol(),"XAU",0) != -1 || Symbol() == "GOLD" || Symbol() == "GLD" ) )
  {
  总_46_in = 1000 ;
  总_33_do = NormalizeDouble(Point() * 10.0,总_44_in) ;
  }
 if ( ( 总_44_in == 2 || 总_44_in == 4 ) && ( StringFind(Symbol(),"XAU",0) != -1 || Symbol() == "GOLD" || Symbol() == "GLD" ) )
  {
  总_46_in = 1000 ;
  总_33_do = Point() ;
  }
 总_56_do = NormalizeDouble(总_33_do * 2.0,总_44_in) ;
 总_48_in = 5400 ;
 总_49_in = 8700 ;
 总_50_in = 10800 ;
 总_51_in = 12300 ;
 总_52_in = 15000 ;
 总_62_in_si6[1] = 3600;
 总_62_in_si6[2] = 8400;
 总_62_in_si6[3] = 10200;
 总_62_in_si6[4] = 12000;
 总_62_in_si6[5] = 14400;
 总_63_in_si6[1] = 3;
 总_63_in_si6[2] = 0;
 总_63_in_si6[3] = -3;
 总_63_in_si6[4] = -6;
 总_63_in_si6[5] = -15;
 总_53_bo = true ;
 总_54_bo = true ;
 Print("MAGIC_NUMBER = 181818"); 
 Print("TERMINAL_PATH = ",TerminalInfoString(2)); 
 Print("TERMINAL_DATA_PATH = ",TerminalInfoString(3)); 
 Print("TERMINAL_COMMONDATA_PATH = ",TerminalInfoString(4)); 
 if ( ( !(IsTesting()) || IsVisualMode() ) && !(IsOptimization()) )
  {
  临_bo_1 = true;
  }
 else
  {
  临_bo_1 = false;
  }
 if ( 临_bo_1 && TimeCurrent() >  StringToTime("2018.04.02 00:00") )
  {
 // Alert(" Period of usage has expired!"); 
 // Comment("Period of usage has expired!"); 
 // Print("Period of usage has expired!"); 
 // return(0); 
  }
 Comment(""); 
 子_2_da = AccountInfoInteger(0) ;
 if ( ( !(IsTesting()) || IsVisualMode() ) && !(IsOptimization()) )
  {
  临_bo_2 = true;
  }
 else
  {
  临_bo_2 = false;
  }
 if ( 临_bo_2 && 子_2_da != D'2001.09.09 10:00:16' )
  {
 // Alert(" Trading on the account is " + string(子_2_da) + " PROHIBITED "); 
 // Print(" Trading on the account is " + string(子_2_da) + " PROHIBITED "); 
 // Comment(" Trading on the account is " + string(子_2_da) + " PROHIBITED "); 
 // return(0); 
  }
 Comment(""); 
 ObjectDelete("swa"); 
 if ( ( !(IsTesting()) || IsVisualMode() ) && DisplayTable )
  {
  lizong_17(); 
  }
 if ( 总_14_bo )
  {
  PlaySound("\\Sounds\\GOOD.wav"); 
  }
 OnTick(); 
 return(0); 
 }
//OnInit <<==--------   --------
 void OnTick()
 {
 string     临_st_1;
 bool       临_bo_2;
 bool       临_bo_3;
 bool       临_bo_4;
 string     临_st_5;
 int        临_in_6;
 int        临_in_7;
 int        临_in_8;
 int        临_in_9;
 int        临_in_10;
 uint       临_ui_11;
 string     临_st_12;
 bool       临_bo_13;
 bool       临_bo_14;
 string     临_st_15;
 int        临_in_16;
 int        临_in_17;
 int        临_in_18;
 int        临_in_19;
 int        临_in_20;
 uint       临_ui_21;
 string     临_st_22;
 int        临_in_23;
 int        临_in_24;
 int        临_in_25;
 int        临_in_26;
 int        临_in_27;
 int        临_in_28;
 double     临_do_29;
 double     临_do_30;
 double     临_do_31;
 double     临_do_32;
 double     临_do_33;
 int        临_in_34;
 string     临_st_35;




 if ( 总_18_bo )
  {
  if ( 总_57_bo )   return;
  临_st_1 = "Critical error! EA STOPPED!";
  if ( StringLen("Critical error! EA STOPPED!")  <= 0 || !(总_20_bo) )   return;
  
  if ( ( !(总_21_bo) && 总_66_st == "Critical error! EA STOPPED!" ) )   return;
  总_66_st = 临_st_1 ;
  Print(总_66_st); 
  return;
  }
 总_45_in = SymbolInfoInteger(Symbol(),18) ;
 if ( ( !(IsTesting()) || IsVisualMode() ) && !(IsOptimization()) )
  {
  临_bo_2 = true;
  }
 else
  {
  临_bo_2 = false;
  }
 if ( 临_bo_2 )
  {
  if ( DisplayTable )
   {
   lizong_17(); 
   }
  lizong_16(); 
  if ( 总_45_in >  MaxSpreadOpen && lizong_12() )
   {
   Print(" The current SPREAD exceeds the allowable value !"); 
   临_bo_3 = false;
   临_bo_4 = false;
   临_st_5 = "Arial";
   临_in_6 = 2;
   临_in_7 = 8;
   临_in_8 = 2;
   临_in_9 = 30;
   临_in_10 = 5;
   临_ui_11 = Yellow;
   临_st_12 = "The current SPREAD exceeds the allowable value !";
   if ( ObjectFind("spr") <  0 )
    {
    ObjectCreate("spr",OBJ_LABEL,0,0,0.0,0,0.0,0,0.0); 
    }
   ObjectSet("spr",OBJPROP_COLOR,临_ui_11); 
   ObjectSet("spr",OBJPROP_XDISTANCE,临_in_10); 
   ObjectSet("spr",OBJPROP_YDISTANCE,临_in_9); 
   ObjectSet("spr",OBJPROP_CORNER,临_in_8); 
   ObjectSet("spr",1011,临_in_6); 
   ObjectSet("spr",OBJPROP_BACK,临_bo_4); 
   ObjectSet("spr",1000,临_bo_3); 
   ObjectSet("spr",17,临_bo_3); 
   ObjectSetText("spr",临_st_12,临_in_7,临_st_5,0xFFFFFFFF); 
   }
  else
   {
   ObjectDelete("spr"); 
   }
  if ( lizong_12() )
   {
   临_bo_13 = false;
   临_bo_14 = false;
   临_st_15 = "Arial";
   临_in_16 = 2;
   临_in_17 = 8;
   临_in_18 = 2;
   临_in_19 = 45;
   临_in_20 = 5;
   临_ui_21 = Aqua;
   临_st_22 = "Trading is permitted !";
   if ( ObjectFind("tim") <  0 )
    {
    ObjectCreate("tim",OBJ_LABEL,0,0,0.0,0,0.0,0,0.0); 
    }
   ObjectSet("tim",OBJPROP_COLOR,临_ui_21); 
   ObjectSet("tim",OBJPROP_XDISTANCE,临_in_20); 
   ObjectSet("tim",OBJPROP_YDISTANCE,临_in_19); 
   ObjectSet("tim",OBJPROP_CORNER,临_in_18); 
   ObjectSet("tim",1011,临_in_16); 
   ObjectSet("tim",OBJPROP_BACK,临_bo_14); 
   ObjectSet("tim",1000,临_bo_13); 
   ObjectSet("tim",17,临_bo_13); 
   ObjectSetText("tim",临_st_22,临_in_17,临_st_15,0xFFFFFFFF); 
   }
  else
   {
   ObjectDelete("tim"); 
   ObjectDelete("Tn"); 
   ObjectDelete("Tc"); 
   }
  临_in_23 = 0;
  临_in_24 = 0;
  for (临_in_25 = 0 ; 临_in_25 < OrdersTotal() ; 临_in_25=临_in_25 + 1)
   {
   if ( !(OrderSelect(临_in_25,SELECT_BY_POS,MODE_TRADES)) || OrderSymbol() != Symbol() || OrderType() > 1 || OrderMagicNumber() != 总_47_in || OrderType() != 临_in_23 )   continue;
   临_in_24=临_in_24 + 1; 
   
   }
  if ( 临_in_24 == 0 )
   {
   ObjectDelete("TpBuy"); 
   ObjectDelete("TakeProfit_Buyn"); 
   }
  临_in_26 = 1;
  临_in_27 = 0;
  for (临_in_28 = 0 ; 临_in_28 < OrdersTotal() ; 临_in_28=临_in_28 + 1)
   {
   if ( !(OrderSelect(临_in_28,SELECT_BY_POS,MODE_TRADES)) || OrderSymbol() != Symbol() || OrderType() > 1 || OrderMagicNumber() != 总_47_in || OrderType() != 临_in_26 )   continue;
   临_in_27=临_in_27 + 1; 
   
   }
  if ( 临_in_27 == 0 )
   {
   ObjectDelete("TpSell"); 
   ObjectDelete("TakeProfit_Selln"); 
  }}
 if ( ( IsTesting() || !(IsVisualMode()) ) && 总_45_in >  MaxSpreadOpen && lizong_12() )
  {
  Print(" The current SPREAD exceeds the allowable value !"); 
  }
 if ( 总_4_bo )
  {
  临_do_29 = 0.0;
  临_do_30 = 0.0;
  临_do_31 = 0.0;
  临_do_32 = NormalizeDouble(总_33_do * (-150.0),总_44_in);
  临_do_33 = NormalizeDouble(TakeProfitClose * 总_33_do,总_44_in);
  for (临_in_34 = OrdersTotal() - 1 ; 临_in_34 >= 0 ; 临_in_34=临_in_34 - 1)
   {
   if ( !(OrderSelect(临_in_34,SELECT_BY_POS,MODE_TRADES)) || OrderSymbol() != Symbol() || OrderType() > 1 || OrderMagicNumber() != 总_47_in )   continue;
   临_do_29 = NormalizeDouble(OrderClosePrice(),总_44_in);
   临_do_30 = NormalizeDouble(OrderOpenPrice(),总_44_in);
   if ( OrderType() == 0 )
    {
    临_do_31 = 临_do_29 - 临_do_30;
    }
   else
    {
    临_do_31 = 临_do_30 - 临_do_29;
    }
   if ( ( ( !(临_do_33>0.0) || !(临_do_31>=临_do_33) ) && (!(临_do_32<0.0) || !(临_do_31<=临_do_32)) ) )   continue;
   lizong_9(); 
   临_st_35 = "WatchLevels  # Close a position";
   if ( StringLen("WatchLevels  # Close a position")  <= 0 || !(总_20_bo) )   continue;
   
   if ( ( !(总_21_bo) && 总_66_st == "WatchLevels  # Close a position" ) )   continue;
   总_66_st = 临_st_35 ;
   Print(总_66_st); 
   
   }
   }
 if ( 总_5_bo )
  {
  lizong_13(); 
  }
 if ( ( ( IsExpertEnabled() && IsTradeAllowed() ) || IsTesting() ) && 总_45_in <= MaxSpreadOpen && lizong_12() )
  {
  lizong_6(StopLoss,TakeProfit); 
  }
 if ( 总_6_bo )
  {
  lizong_14(); 
  }
 if ( !(总_1_bo) || lizong_10() != true )   return;
 lizong_11(); 
 }
//OnTick <<==--------   --------
 void OnDeinit( const int 木_0_in)
 {
 string     临_st_1;
 string     临_st_2;
 int        临_in_3;

 if ( IsTesting() )   return;
 Comment(""); 
 ObjectDelete("Tn"); 
 ObjectDelete("Tc"); 
 ObjectDelete("spr"); 
 ObjectDelete("tim"); 
 ObjectDelete("swa"); 
 ObjectDelete("bal"); 
 ObjectDelete("pr1"); 
 ObjectDelete("pr2"); 
 ObjectDelete("TpBuy"); 
 ObjectDelete("TpSell"); 
 临_st_1 = "ban";
 for (临_in_3 = ObjectsTotal(-1) - 1 ; 临_in_3 >= 0 ; 临_in_3=临_in_3 - 1)
  {
  临_st_2 = ObjectName(临_in_3);
  if ( StringFind(临_st_2,临_st_1,0) == -1 )   continue;
  ObjectDelete(临_st_2); 
  
  }
 if ( !(总_14_bo) )   return;
 PlaySound("\\Sounds\\CASHREG.wav"); 
 }
//OnDeinit <<==--------   --------
 void lizong_6( int 木_0_in,int 木_1_in)
 {
  double    子_1_do;
  double    子_2_do;
  double    子_3_do;
  double    子_4_do;
  double    子_5_do;
  double    子_6_do;
  double    子_7_do;
  double    子_8_do;
//----- -----
 double     临_do_1;
 double     临_do_2;
 string     临_st_3;
 bool       临_bo_4;
 string     临_st_5;
 bool       临_bo_6;
 int        临_in_7;
 bool       临_bo_8;
 int        临_in_9;
 int        临_in_10;
 int        临_in_11;
 int        临_in_12;
 int        临_in_13;
 int        临_in_14;
 datetime   临_da_15;
 bool       临_bo_16;
 bool       临_bo_17;
 bool       临_bo_18;
 int        临_in_19;
 int        临_in_20;
 uint       临_ui_21;
 double     临_do_22;
 int        临_in_23;
 string     临_st_24;
 datetime   临_da_25;
 uint       临_ui_26;
 double     临_do_27;
 int        临_in_28;
 int        临_in_29;
 int        临_in_30;
 int        临_in_31;
 int        临_in_32;
 int        临_in_33;
 datetime   临_da_34;
 bool       临_bo_35;
 bool       临_bo_36;
 bool       临_bo_37;
 int        临_in_38;
 int        临_in_39;
 uint       临_ui_40;
 double     临_do_41;
 int        临_in_42;
 string     临_st_43;
 datetime   临_da_44;
 uint       临_ui_45;
 double     临_do_46;

 子_7_do = MarketInfo(Symbol(),14) ;
 临_do_1 = MathFloor(AccountFreeMargin() * Risk / 100.0 / (总_46_in * 总_40_do) / 总_37_do) * 总_37_do;
 if ( 临_do_1<总_35_do )
  {
  临_do_1 = 总_35_do;
  }
 if ( 临_do_1>总_34_do )
  {
  临_do_1 = 总_34_do;
  }
 if ( !(MoneyManagement) )
  {
  临_do_1 = OriginalLot;
  if ( OriginalLot<总_35_do )
   {
   临_do_1 = 总_35_do;
   }
  if ( 临_do_1>总_34_do )
   {
   临_do_1 = 总_34_do;
  }}
 if ( OriginalLot<总_35_do )
  {
  Print(" Set Minimum lot: " + string(总_35_do)); 
  }
 if ( OriginalLot>总_34_do )
  {
  Print(" Set Maximum lot: " + string(总_34_do)); 
  }
 临_do_2 = NormalizeDouble(临_do_1 / 总_37_do,0) * 总_37_do;
 临_do_2 = MathMax(临_do_2,总_35_do);
 临_do_2 = MathMin(临_do_2,总_34_do);
 子_8_do = 临_do_2 ;
 if ( 总_1_bo && lizong_10() == true )
  {
  子_8_do = lizong_11() ;
  }
 子_1_do = iRSI(NULL,15,6,0,0) ;
 子_2_do = iRSI(NULL,1,20,0,0) ;
 子_3_do = iMA(NULL,15,8,0,MODE_SMA,PRICE_MEDIAN,1) ;
 HideTestIndicators(true); 
 if ( AccountFreeMarginCheck(Symbol(),0,子_8_do)<0.0 )
  {
  临_st_3 = (lizong_10()) ?"Buy":"Sell" ;
  Print("",临_st_3," ",子_8_do," ",Symbol()," ERROR  # ",lizong_20(GetLastError())); 
  临_bo_4 = false;
  }
 else
  {
  临_bo_4 = true;
  }
 if ( !(临_bo_4) )   return;
 
 if ( AccountFreeMarginCheck(Symbol(),1,子_8_do)<0.0 )
  {
  临_st_5 = (lizong_10()) ?"Buy":"Sell" ;
  Print("",临_st_5," ",子_8_do," ",Symbol()," ERROR  # ",lizong_20(GetLastError())); 
  临_bo_6 = false;
  }
 else
  {
  临_bo_6 = true;
  }
 if ( !(临_bo_6) )   return;
 临_in_7 = AccountInfoInteger(47);
 if ( 临_in_7 == 0 )
  {
  临_bo_8 = true;
  }
 else
  {
  临_bo_8 = OrdersTotal()<临_in_7;
  }
 if ( !(临_bo_8) )   return;
 临_in_9 = 0;
 临_in_10 = 0;
 for (临_in_11 = 0 ; 临_in_11 < OrdersTotal() ; 临_in_11=临_in_11 + 1)
  {
  if ( !(OrderSelect(临_in_11,SELECT_BY_POS,MODE_TRADES)) || OrderSymbol() != Symbol() || OrderType() > 1 || OrderMagicNumber() != 总_47_in || OrderType() != 临_in_9 )   continue;
  临_in_10=临_in_10 + 1; 
  
  }
 if ( ( 临_in_10 < CountBuy || CountBuy == -1 ) )
  {
  总_27_do = SymbolInfoDouble(Symbol(),4) ;
  总_26_do = SymbolInfoDouble(Symbol(),1) ;
  if ( 总_53_bo && ( 子_1_do<30.0 || 子_2_do<36.0 ) && 子_3_do>=总_27_do + 总_56_do )
   {
   if ( 木_0_in >  0 && 总_26_do - 木_0_in * 总_33_do<总_26_do - 子_7_do * 总_33_do )
    {
    子_5_do = 总_26_do - 木_0_in * 总_33_do ;
    }
   else
    {
    子_5_do = 总_26_do - 子_7_do * 总_33_do ;
    }
   if ( 木_0_in <= 0 )
    {
    子_5_do = 0.0 ;
    }
   if ( 木_1_in >  0 && 木_1_in * 总_33_do + 总_27_do>子_7_do * 总_33_do + 总_27_do )
    {
    子_6_do = 木_1_in * 总_33_do + 总_27_do ;
    }
   else
    {
    子_6_do = 子_7_do * 总_33_do + 总_27_do ;
    }
   if ( 木_1_in <= 0 )
    {
    子_6_do = 0.0 ;
    }
   if ( !(lizong_18(0,子_5_do,子_6_do)) )
    {
    Print(" The level of StopLoss or TakeProfit is incorrect !"); 
    }
   lizong_7(0,子_8_do,子_5_do,子_6_do,总_47_in); 
   if ( CountBuy )
    {
    临_in_12 = 0;
    临_in_13 = 0;
    for (临_in_14 = 0 ; 临_in_14 < OrdersTotal() ; 临_in_14=临_in_14 + 1)
     {
     if ( !(OrderSelect(临_in_14,SELECT_BY_POS,MODE_TRADES)) || OrderSymbol() != Symbol() || OrderType() > 1 || OrderMagicNumber() != 总_47_in || OrderType() != 临_in_12 )   continue;
     临_in_13=临_in_13 + 1; 
     
     }
    if ( 临_in_13 == 1 )
     {
     子_4_do = NormalizeDouble(TakeProfitClose * 总_33_do + OrderOpenPrice(),总_44_in) ;
     临_da_15 = 0;
     临_bo_16 = true;
     临_bo_17 = false;
     临_bo_18 = false;
     临_in_19 = 1;
     临_in_20 = 2;
     临_ui_21 = DeepSkyBlue;
     临_do_22 = 子_4_do;
     临_in_23 = 0;
     临_st_24 = "TpBuy";
     临_da_25 = 0;
     if ( !(临_do_22) )
      {
      临_do_22 = SymbolInfoDouble(Symbol(),1);
      }
     ResetLastError();
     if ( ObjectCreate(临_da_25,临_st_24,1,临_in_23,0,临_do_22) )
      {
      ObjectSetInteger(临_da_25,临_st_24,OBJPROP_COLOR,临_ui_21); 
      ObjectSetInteger(临_da_25,临_st_24,OBJPROP_STYLE,临_in_20); 
      ObjectSetInteger(临_da_25,临_st_24,OBJPROP_WIDTH,临_in_19); 
      ObjectSetInteger(临_da_25,临_st_24,OBJPROP_BACK,临_bo_18); 
      ObjectSetInteger(临_da_25,临_st_24,OBJPROP_SELECTABLE,临_bo_17); 
      ObjectSetInteger(临_da_25,临_st_24,OBJPROP_SELECTED,临_bo_17); 
      ObjectSetInteger(临_da_25,临_st_24,OBJPROP_HIDDEN,临_bo_16); 
      ObjectSetInteger(临_da_25,临_st_24,OBJPROP_ZORDER,临_da_15); 
      }
     临_ui_26 = DeepSkyBlue;
     临_do_27 = 子_4_do;
     WindowFirstVisibleBar(); 
     if ( ObjectFind(StringConcatenate("TakeProfit_Buy","n")) <  0 )
      {
      ObjectCreate(StringConcatenate("TakeProfit_Buy","n"),OBJ_TEXT,0,0,0.0,0,0.0,0,0.0); 
      }
     ObjectDelete(StringConcatenate("TakeProfit_Buy","n")); 
     ObjectCreate(StringConcatenate("TakeProfit_Buy","n"),OBJ_TEXT,0,Time[30],临_do_27,0,0.0,0,0.0); 
     ObjectSetText(StringConcatenate("TakeProfit_Buy","n"),"TakeProfit_Buy",8,"Arial",0xFFFFFFFF); 
     ObjectSet(StringConcatenate("TakeProfit_Buy","n"),OBJPROP_COLOR,临_ui_26); 
    }}
   总_53_bo = false ;
   总_54_bo = true ;
   return;
  }}
 临_in_28 = 1;
 临_in_29 = 0;
 for (临_in_30 = 0 ; 临_in_30 < OrdersTotal() ; 临_in_30=临_in_30 + 1)
  {
  if ( !(OrderSelect(临_in_30,SELECT_BY_POS,MODE_TRADES)) || OrderSymbol() != Symbol() || OrderType() > 1 || OrderMagicNumber() != 总_47_in || OrderType() != 临_in_28 )   continue;
  临_in_29=临_in_29 + 1; 
  
  }
 if ( ( 临_in_29 < CountSell || CountSell == -1 ) )
  {
  总_27_do = SymbolInfoDouble(Symbol(),4) ;
  总_26_do = SymbolInfoDouble(Symbol(),1) ;
  if ( 总_54_bo && ( 子_1_do>70.0 || 子_2_do>64.0 ) && 子_3_do<=总_26_do - 总_56_do )
   {
   if ( 木_0_in >  0 && 木_0_in * 总_33_do + 总_27_do>子_7_do * 总_33_do + 总_27_do )
    {
    子_5_do = 木_0_in * 总_33_do + 总_27_do ;
    }
   else
    {
    子_5_do = 子_7_do * 总_33_do + 总_27_do ;
    }
   if ( 木_0_in <= 0 )
    {
    子_5_do = 0.0 ;
    }
   if ( 木_1_in >  0 && 总_26_do - 木_1_in * 总_33_do<总_26_do - 子_7_do * 总_33_do )
    {
    子_6_do = 总_26_do - 木_1_in * 总_33_do ;
    }
   else
    {
    子_6_do = 总_26_do - 子_7_do * 总_33_do ;
    }
   if ( 木_1_in <= 0 )
    {
    子_6_do = 0.0 ;
    }
   if ( !(lizong_18(1,子_5_do,子_6_do)) )
    {
    Print(" The level of StopLoss or TakeProfit is incorrect !"); 
    }
   lizong_7(1,子_8_do,子_5_do,子_6_do,总_47_in); 
   if ( CountSell )
    {
    临_in_31 = 1;
    临_in_32 = 0;
    for (临_in_33 = 0 ; 临_in_33 < OrdersTotal() ; 临_in_33=临_in_33 + 1)
     {
     if ( !(OrderSelect(临_in_33,SELECT_BY_POS,MODE_TRADES)) || OrderSymbol() != Symbol() || OrderType() > 1 || OrderMagicNumber() != 总_47_in || OrderType() != 临_in_31 )   continue;
     临_in_32=临_in_32 + 1; 
     
     }
    if ( 临_in_32 == 1 )
     {
     子_4_do = NormalizeDouble(OrderOpenPrice() - TakeProfitClose * 总_33_do,总_44_in) ;
     临_da_34 = 0;
     临_bo_35 = true;
     临_bo_36 = false;
     临_bo_37 = false;
     临_in_38 = 1;
     临_in_39 = 2;
     临_ui_40 = DeepPink;
     临_do_41 = 子_4_do;
     临_in_42 = 0;
     临_st_43 = "TpSell";
     临_da_44 = 0;
     if ( !(临_do_41) )
      {
      临_do_41 = SymbolInfoDouble(Symbol(),1);
      }
     ResetLastError();
     if ( ObjectCreate(临_da_44,临_st_43,1,临_in_42,0,临_do_41) )
      {
      ObjectSetInteger(临_da_44,临_st_43,OBJPROP_COLOR,临_ui_40); 
      ObjectSetInteger(临_da_44,临_st_43,OBJPROP_STYLE,临_in_39); 
      ObjectSetInteger(临_da_44,临_st_43,OBJPROP_WIDTH,临_in_38); 
      ObjectSetInteger(临_da_44,临_st_43,OBJPROP_BACK,临_bo_37); 
      ObjectSetInteger(临_da_44,临_st_43,OBJPROP_SELECTABLE,临_bo_36); 
      ObjectSetInteger(临_da_44,临_st_43,OBJPROP_SELECTED,临_bo_36); 
      ObjectSetInteger(临_da_44,临_st_43,OBJPROP_HIDDEN,临_bo_35); 
      ObjectSetInteger(临_da_44,临_st_43,OBJPROP_ZORDER,临_da_34); 
      }
     临_ui_45 = DeepPink;
     临_do_46 = 子_4_do;
     WindowFirstVisibleBar(); 
     if ( ObjectFind(StringConcatenate("TakeProfit_Sell","n")) <  0 )
      {
      ObjectCreate(StringConcatenate("TakeProfit_Sell","n"),OBJ_TEXT,0,0,0.0,0,0.0,0,0.0); 
      }
     ObjectDelete(StringConcatenate("TakeProfit_Sell","n")); 
     ObjectCreate(StringConcatenate("TakeProfit_Sell","n"),OBJ_TEXT,0,Time[30],临_do_46,0,0.0,0,0.0); 
     ObjectSetText(StringConcatenate("TakeProfit_Sell","n"),"TakeProfit_Sell",8,"Arial",0xFFFFFFFF); 
     ObjectSet(StringConcatenate("TakeProfit_Sell","n"),OBJPROP_COLOR,临_ui_45); 
    }}
   总_54_bo = false ;
   总_53_bo = true ;
   return;
  }}
 if ( !(子_1_do<60.0) || !(子_1_do>40.0) )   return;
 总_54_bo = true ;
 总_53_bo = true ;
 }
//lizong_6 <<==--------   --------
 int lizong_7( int 木_0_in,double 木_1_do,double 木_2_do,double 木_3_do,int 木_4_in)
 {
  string    子_2_st;
  uint      子_3_ui;
  string    子_4_st;
  int       子_5_in;
  double    子_6_do;
  double    子_7_do;
  double    子_8_do;
  int       子_9_in;
  int       子_10_in;
//----- -----
 double     临_do_1;
 string     临_st_2;
 bool       临_bo_3;
 bool       临_bo_4;
 int        临_in_5;
 int        临_in_6;
 bool       临_bo_7;
 int        临_in_8;
 bool       临_bo_9;
 bool       临_bo_10;
 bool       临_bo_11;

 临_do_1 = 木_1_do;
 if ( AccountFreeMarginCheck(Symbol(),木_0_in,木_1_do)<0.0 )
  {
  临_st_2 = (木_0_in == 0) ?"Buy":"Sell" ;
  Print("",临_st_2," ",临_do_1," ",Symbol()," ERROR  # ",lizong_20(GetLastError())); 
  临_bo_3 = false;
  }
 else
  {
  临_bo_3 = true;
  }
 if ( !(临_bo_3) )
  {
  return(0); 
  }
 子_2_st = "Incorrect value of the volume" ;
 if ( 木_1_do<SymbolInfoDouble(Symbol(),34) )
  {
  子_2_st = StringFormat("The volume is less than the minimum SYMBOL_VOLUME_MIN=%.2f",SymbolInfoDouble(Symbol(),34)) ;
  临_bo_4 = false;
  }
 else
  {
  if ( 木_1_do>SymbolInfoDouble(Symbol(),35) )
   {
   子_2_st = StringFormat("The volume is greater than the maximum SYMBOL_VOLUME_MAX=%.2f",SymbolInfoDouble(Symbol(),35)) ;
   临_bo_4 = false;
   }
  else
   {
   if ( MathAbs(int(MathRound(木_1_do / SymbolInfoDouble(Symbol(),36))) * SymbolInfoDouble(Symbol(),36) - 木_1_do)>0.0000001 )
    {
    子_2_st = StringFormat("The volume is not a multiple of the minimum gradation SYMBOL_VOLUME_STEP=%.2f,\n nthe closest to the correct amount %.2f",SymbolInfoDouble(Symbol(),36),int(MathRound(木_1_do / SymbolInfoDouble(Symbol(),36))) * SymbolInfoDouble(Symbol(),36)) ;
    临_bo_4 = false;
    }
   else
    {
    子_2_st = "The correct value of the volume" ;
    临_bo_4 = true;
  }}}
 if ( !(临_bo_4) )
  {
  return(0); 
  }
 子_3_ui = 0 ;
 子_5_in = 0 ;
 子_6_do = 0.0 ;
 子_7_do = 0.0 ;
 子_8_do = 0.0 ;
 for (子_9_in = 1 ; 子_9_in <= 3 ; 子_9_in = 子_9_in + 1)
  {
  if ( !(IsTesting()) && ( !(IsExpertEnabled()) || IsStopped() ) )
   {
   Print("OpenPosition","  # Stopping the function"); 
   break;
   }
  while (!(IsTradeAllowed()))
   {
   Sleep(5000); 
   }
  RefreshRates(); 
  子_7_do = SymbolInfoDouble(Symbol(),4) ;
  子_8_do = SymbolInfoDouble(Symbol(),1) ;
  if ( 木_0_in == 0 )
   {
   子_6_do = 子_7_do ;
   子_3_ui = DarkBlue ;
   子_4_st = string(总_47_in) ;
   }
  else
   {
   子_6_do = 子_8_do ;
   子_3_ui = Maroon ;
   子_4_st = string(总_47_in) ;
   }
  if ( 总_3_bo )
   {
   子_5_in = OrderSend(Symbol(),木_0_in,木_1_do,NormalizeDouble(子_6_do,总_44_in),总_2_in,0.0,0.0,子_4_st,木_4_in,0,子_3_ui) ;
   }
  else
   {
   子_5_in = OrderSend(Symbol(),木_0_in,木_1_do,NormalizeDouble(子_6_do,总_44_in),总_2_in,木_2_do,木_3_do,子_4_st,木_4_in,0,子_3_ui) ;
   }
  if ( 子_5_in >  0 )
   {
   if ( !(总_14_bo) )   break;
   PlaySound("\\Sounds\\Monkey.wav"); 
   break;
   }
  if ( 子_5_in == -1 )
   {
   Print(" ERROR: in OpenPosition()"); 
   Print(" ERROR:   # could not open order"); 
   if ( GetLastError() != 0 )
    {
    Print(" ERROR: code= " + string(GetLastError()) + " - " + lizong_20(GetLastError())); 
   }}
  子_10_in = lizong_19() ;
  if ( 子_10_in == 1 )
   {
   Sleep(5000); 
   RefreshRates(); 
   }
  ResetLastError();
  ResetLastError();
  子_10_in = 0 ;
  if ( 子_7_do==0.0 && 子_8_do==0.0 && StringLen(" Check the market Watch for a symbol " + Symbol())  >  0 && 总_20_bo && ( 总_21_bo || 总_66_st != " Check the market Watch for a symbol " + Symbol() ) )
   {
   总_66_st = " Check the market Watch for a symbol " + Symbol() ;
   Print(总_66_st); 
   }
  Print("OpenPosition","  # ERROR  # ",lizong_20(子_10_in),", ATTEMPT ",子_9_in); 
  Print("OpenPosition","  # Ask=",子_7_do," Bid=",子_8_do," sy=",Symbol()," ll=",木_1_do," op=",lizong_15(木_0_in)," pp=",子_6_do," sl=",木_2_do," tp=",木_3_do," mn=",木_4_in); 
  if ( ( 子_10_in == 2 || 子_10_in == 64 || 子_10_in == 65 || 子_10_in == 133 ) )
   {
   总_18_bo = true ;
   break;
   }
  if ( ( 子_10_in == 4 || 子_10_in == 131 || 子_10_in == 132 ) )
   {
   Sleep(300000); 
   break;
   }
  if ( ( 子_10_in == 128 || 子_10_in == 142 || 子_10_in == 143 ) )
   {
   Sleep(66666); 
   临_in_5 = -1;
   int w1=9;while(w1>8){w1=0;
   for (临_in_6 = 0 ; 临_in_6 < OrdersTotal() ; 临_in_6=临_in_6 + 1)
    {
    if ( !(OrderSelect(临_in_6,SELECT_BY_POS,MODE_TRADES)) || OrderSymbol() != Symbol() || OrderType() > 1 || OrderMagicNumber() != 总_47_in || OrderType() != 临_in_5 )   continue;
    临_bo_7 = true;
    w1=1; break;
    
    }
    if(w1==0)
   临_bo_7 = false;
   }
   if ( 临_bo_7 )
    {
    if ( !(总_14_bo) )   break;
    PlaySound("timeout.wav"); 
    break;
   }}
  if ( 子_10_in == 140 || 子_10_in == 148 || 子_10_in == 4110 || 子_10_in == 4111 )   break;
  if ( 子_10_in == 141 )
   {
   Sleep(100000); 
   }
  if ( 子_10_in == 145 )
   {
   Sleep(17000); 
   }
   if(子_10_in == 146 && IsTradeContextBusy()){
  do
   {
   Sleep(11000); 
   }
   while(IsTradeContextBusy());
   }
  if ( 子_10_in == 135 )   continue;
  Sleep(7700); 
  
  }

  for(;;){
 if ( 总_3_bo && 子_5_in >  0 && ( 木_2_do>0.0 || 木_3_do>0.0 ) && OrderSelect(子_5_in,SELECT_BY_TICKET,MODE_TRADES) )
  {
  if ( OrderSelect(子_5_in,SELECT_BY_TICKET,MODE_TRADES) )
   {
   临_in_8 = OrderType();
   if ( !((临_in_8==0 || 临_in_8==1)) )
    {
    临_bo_9 = MathAbs(OrderOpenPrice() - 木_0_in)>SymbolInfoDouble(OrderSymbol(),16);
    }
   if ( ( 临_bo_9 || MathAbs(OrderStopLoss() - 木_2_do)>SymbolInfoDouble(OrderSymbol(),16) || MathAbs(OrderTakeProfit() - 木_2_do)>木_3_do ) )
    {
    break;
    }
   PrintFormat("Ордер #%d уже имеет уровни Open=%.5f SL=%.5f TP=%.5f",子_5_in,OrderOpenPrice(),OrderStopLoss(),OrderTakeProfit()); 
   }
  临_bo_11 = false;
  break;}
  if ( 临_bo_11 )
   {
   lizong_8(-1.0,木_2_do,木_3_do,Red); 
   if ( StringLen("OpenPosition  # Modify the position by setting SL and TP")  >  0 && 总_20_bo && ( 总_21_bo || 总_66_st != "OpenPosition  # Modify the position by setting SL and TP" ) )
    {
    总_66_st = "OpenPosition  # Modify the position by setting SL and TP" ;
    Print(总_66_st); 
  }}}
 return(子_5_in); 
 }
//lizong_7 <<==--------   --------
 void lizong_8( double 木_0_do,double 木_1_do,double 木_2_do,uint 木_3_ui)
 {
  double    子_1_do;
  double    子_2_do;
  double    子_3_do;
  int       子_4_in;
  bool      子_5_bo;
  int       子_6_in;
//----- -----

 if ( 木_0_do<=0.0 )
  {
  木_0_do = OrderOpenPrice() ;
  }
 if ( 木_1_do<0.0 )
  {
  木_1_do = OrderStopLoss() ;
  }
 if ( 木_2_do<0.0 )
  {
  木_2_do = OrderTakeProfit() ;
  }
 木_0_do = NormalizeDouble(木_0_do,总_44_in) ;
 木_1_do = NormalizeDouble(木_1_do,总_44_in) ;
 木_2_do = NormalizeDouble(木_2_do,总_44_in) ;
 子_1_do = NormalizeDouble(OrderOpenPrice(),总_44_in) ;
 子_2_do = NormalizeDouble(OrderStopLoss(),总_44_in) ;
 子_3_do = NormalizeDouble(OrderTakeProfit(),总_44_in) ;
 if ( ( !(木_0_do!=子_1_do) && !(木_1_do!=子_2_do) && !(木_2_do!=子_3_do) ) )   return;
 for (子_4_in = 1 ; 子_4_in <= 3 ; 子_4_in = 子_4_in + 1)
  {
  if ( ( !(IsTesting()) && (!(IsExpertEnabled()) || IsStopped()) ) )   return;
  
  while (!(IsTradeAllowed()))
   {
   Sleep(5000); 
   }
  RefreshRates(); 
  子_5_bo = OrderModify(OrderTicket(),木_0_do,木_1_do,木_2_do,0,木_3_ui) ;
  ResetLastError();
  ResetLastError();
  子_6_in = 0 ;
  if ( !(子_5_bo) )
   {
   Print(" ERROR: in ModifyOrder()"); 
   Print(" ERROR:   # failed to modify order"); 
   ResetLastError();
   }
  if ( 子_6_in == 130 )
   {
   Print("ModifyOrder","  # SL or TP is very small, check the incoming parameters. !"); 
   return;
   }
  if ( 子_5_bo )
   {
   if ( !(总_14_bo) )   return;
   PlaySound("expert.wav"); 
   return;
   }
  Print("ModifyOrder","  # ERROR  # ",lizong_20(子_6_in),", ATTEMPT ",子_4_in); 
  if ( 总_14_bo )
   {
   PlaySound("timeout.wav"); 
   }
  Sleep(1000); 
  }
 }
//lizong_8 <<==--------   --------
 void lizong_9()
 {
  uint      子_1_ui;
  double    子_2_do;
  double    子_3_do;
  double    子_4_do;
  double    子_5_do;
  int       子_6_in;
  bool      子_7_bo;
  int       子_8_in;
//----- -----

 if ( OrderType() <= 1 )
  {
  for (子_6_in = 1 ; 子_6_in <= 3 ; 子_6_in = 子_6_in + 1)
   {
   if ( ( !(IsTesting()) && (!(IsExpertEnabled()) || IsStopped()) ) )   return;
   
   while (!(IsTradeAllowed()))
    {
    Sleep(5000); 
    }
   RefreshRates(); 
   子_2_do = SymbolInfoDouble(Symbol(),4) ;
   子_3_do = SymbolInfoDouble(Symbol(),1) ;
   if ( OrderType() == 0 )
    {
    子_4_do = 子_3_do ;
    子_1_ui = Gold ;
    }
   else
    {
    子_4_do = 子_2_do ;
    子_1_ui = Gold ;
    }
   子_5_do = OrderLots() ;
   子_7_bo = OrderClose(OrderTicket(),子_5_do,子_4_do,总_2_in,子_1_ui) ;
   子_8_in = lizong_19() ;
   if ( 子_8_in >  1 )
    {
    Print("ClosePosBySelect","  # Requires manual closing of the order №",OrderTicket()); 
    return;
    }
   if ( 子_7_bo )
    {
    if ( !(总_14_bo) )   return;
    PlaySound("\\Sounds\\close.wav"); 
    return;
    }
   ResetLastError();
   ResetLastError();
   子_8_in = 0 ;
   if(1==0) //条件不成立
    {
    do
     {
     Sleep(11000); 
     }
     while(IsTradeContextBusy());
     
     }
   Print("ClosePosBySelect","  # ERROR  # ",lizong_15(OrderType())," ",lizong_20(子_8_in),", ATTEMPT ",子_6_in); 
   Print("ClosePosBySelect","  #",OrderTicket(),"  Ask=",子_2_do,"  Bid=",子_3_do,"  pp=",子_4_do); 
   Print("ClosePosBySelect","  # sy=",OrderSymbol(),"  ll=",子_5_do,"  sl=",OrderStopLoss(),"  tp=",OrderTakeProfit(),"  mn=",OrderMagicNumber()); 
   Sleep(5000); 
   }
  return;
  }
 Print("ClosePosBySelect","  # Incorrect trading operation",lizong_15(OrderType())); 
 }
//lizong_9 <<==--------   --------
 bool lizong_10()
 {
  double    子_2_do;
  double    子_3_do;
//----- -----
 double     临_do_1;
 double     临_do_2;

 总_65_bo = false ;
 子_2_do = 0.0 ;
 临_do_1 = MathFloor(AccountFreeMargin() * Risk / 100.0 / (总_46_in * 总_40_do) / 总_37_do) * 总_37_do;
 if ( 临_do_1<总_35_do )
  {
  临_do_1 = 总_35_do;
  }
 if ( 临_do_1>总_34_do )
  {
  临_do_1 = 总_34_do;
  }
 if ( !(MoneyManagement) )
  {
  临_do_1 = OriginalLot;
  if ( OriginalLot<总_35_do )
   {
   临_do_1 = 总_35_do;
   }
  if ( 临_do_1>总_34_do )
   {
   临_do_1 = 总_34_do;
  }}
 if ( OriginalLot<总_35_do )
  {
  Print(" Set Minimum lot: " + string(总_35_do)); 
  }
 if ( OriginalLot>总_34_do )
  {
  Print(" Set Maximum lot: " + string(总_34_do)); 
  }
 临_do_2 = NormalizeDouble(临_do_1 / 总_37_do,0) * 总_37_do;
 临_do_2 = MathMax(临_do_2,总_35_do);
 临_do_2 = MathMin(临_do_2,总_34_do);
 子_3_do = 临_do_2 ;
 if ( AccountEquity()>总_64_do )
  {
  总_64_do = AccountEquity() ;
  }
 子_2_do = NormalizeDouble((总_64_do - AccountEquity()) / 总_64_do,2) ;
 if ( 子_2_do>=总_23_do )
  {
  子_3_do = NormalizeDouble(子_3_do * 总_25_do,2) ;
  总_65_bo = true ;
  }
 else
  {
  if ( 总_65_bo == true && 子_2_do>=总_24_do )
   {
   子_3_do = NormalizeDouble(子_3_do * 总_25_do,2) ;
   }
  else
   {
   总_65_bo = false ;
  }}
 return(总_65_bo); 
 }
//lizong_10 <<==--------   --------
 double lizong_11()
 {
  double    子_2_do;
  double    子_3_do;
//----- -----
 double     临_do_1;
 double     临_do_2;
 double     临_do_3;

 临_do_1 = MathFloor(AccountFreeMargin() * Risk / 100.0 / (总_46_in * 总_40_do) / 总_37_do) * 总_37_do;
 if ( 临_do_1<总_35_do )
  {
  临_do_1 = 总_35_do;
  }
 if ( 临_do_1>总_34_do )
  {
  临_do_1 = 总_34_do;
  }
 if ( !(MoneyManagement) )
  {
  临_do_1 = OriginalLot;
  if ( OriginalLot<总_35_do )
   {
   临_do_1 = 总_35_do;
   }
  if ( 临_do_1>总_34_do )
   {
   临_do_1 = 总_34_do;
  }}
 if ( OriginalLot<总_35_do )
  {
  Print(" Set Minimum lot: " + string(总_35_do)); 
  }
 if ( OriginalLot>总_34_do )
  {
  Print(" Set Maximum lot: " + string(总_34_do)); 
  }
 临_do_2 = NormalizeDouble(临_do_1 / 总_37_do,0) * 总_37_do;
 临_do_2 = MathMax(临_do_2,总_35_do);
 临_do_2 = MathMin(临_do_2,总_34_do);
 子_3_do = 临_do_2 ;
 if ( AccountEquity()>总_64_do )
  {
  总_64_do = AccountEquity() ;
  }
 子_2_do = NormalizeDouble((总_64_do - AccountEquity()) / 总_64_do,2) ;
 if ( 子_2_do>=总_23_do )
  {
  子_3_do = NormalizeDouble(子_3_do * 总_25_do,2) ;
  总_65_bo = true ;
  }
 else
  {
  if ( 总_65_bo == true && 子_2_do>=总_24_do )
   {
   子_3_do = NormalizeDouble(子_3_do * 总_25_do,2) ;
   }
  else
   {
   总_65_bo = false ;
  }}
 临_do_3 = NormalizeDouble(子_3_do / 总_37_do,0) * 总_37_do;
 临_do_3 = MathMax(临_do_3,总_35_do);
 临_do_3 = MathMin(临_do_3,总_34_do);
 return(临_do_3); 
 }
//lizong_11 <<==--------   --------
 bool lizong_12()
 {
 if ( ( ( DayOfWeek() == 5 && Hour() >= StopHour ) || DayOfWeek() == 0 || DayOfWeek() == 6 ) )
  {
  return(false); 
  }
 if ( DayOfWeek() == 1 && Hour() <  StartHour )
  {
  return(false); 
  }
 if ( StartHour <  StopHour && ( Hour() < StartHour || Hour() >= StopHour ) )
  {
  return(false); 
  }
 if ( StartHour >  StopHour && Hour() <  StartHour && Hour() >= StopHour )
  {
  return(false); 
  }
 if ( Hour() == StopHour - 1 && Minute() >= 59 )
  {
  return(false); 
  }
 return(true); 
 }
//lizong_12 <<==--------   --------
 void lizong_13()
 {
  int       子_1_in;
  int       子_2_in;
  datetime  子_3_da;
  double    子_4_do;
  double    子_5_do;
  double    子_6_do;
//----- -----
 datetime   临_da_1;
 string     临_st_2;

 子_4_do = 0.0 ;
 子_5_do = 0.0 ;
 子_6_do = 0.0 ;
 for (子_1_in = OrdersTotal() - 1 ; 子_1_in >= 0 ; 子_1_in = 子_1_in - 1)
  {
  if ( !(OrderSelect(子_1_in,SELECT_BY_POS,MODE_TRADES)) || OrderSymbol() != Symbol() || OrderType() > 1 || OrderMagicNumber() != 总_47_in )   continue;
  子_3_da = TimeCurrent() - OrderOpenTime();
  临_da_1 = 总_48_in;
  if ( 子_3_da <= 临_da_1 )   continue;
  子_4_do = NormalizeDouble(OrderClosePrice(),总_44_in) ;
  子_5_do = NormalizeDouble(OrderOpenPrice(),总_44_in) ;
  if ( OrderType() == 0 )
   {
   子_6_do = 子_4_do - 子_5_do ;
   }
  else
   {
   子_6_do = 子_5_do - 子_4_do ;
   }
  临_da_1 = 总_49_in;
  if ( 子_3_da <  临_da_1 && 子_6_do>=总_28_do )
   {
   子_2_in = 1 ;
   }
  else
   {
   if ( 子_3_da >  总_49_in && 子_3_da <  总_50_in && 子_6_do>=总_29_do )
    {
    子_2_in = 2 ;
    }
   else
    {
    if ( 子_3_da >  总_50_in && 子_3_da <  总_51_in && 子_6_do>=总_30_do )
     {
     子_2_in = 3 ;
     }
    else
     {
     if ( 子_3_da >  总_51_in && 子_3_da <  总_52_in && 子_6_do>=总_31_do )
      {
      子_2_in = 4 ;
      }
     else
      {
      if ( 子_3_da >  总_52_in && 子_6_do>=总_32_do )
       {
       子_2_in = 5 ;
   }}}}}
  if ( 子_2_in == 0 )   continue;
  lizong_9(); 
  临_st_2 = "NoiseFilter  # Close a position";
  if ( StringLen("NoiseFilter  # Close a position")  <= 0 || !(总_20_bo) )   continue;
  
  if ( ( !(总_21_bo) && 总_66_st == "NoiseFilter  # Close a position" ) )   continue;
  总_66_st = 临_st_2 ;
  Print(总_66_st); 
  
  }
 }
//lizong_13 <<==--------   --------
 void lizong_14()
 {
  datetime  子_1_da;
  datetime  子_2_da;
  double    子_3_do;
  int       子_4_in;
//----- -----
 datetime   临_da_1;
 string     临_st_2;

 子_2_da = 0 ;
 子_3_do = 0.0 ;
 for (子_4_in = 0 ; 子_4_in < OrdersTotal() ; 子_4_in = 子_4_in + 1)
  {
  if ( !(OrderSelect(子_4_in,SELECT_BY_POS,MODE_TRADES)) || OrderSymbol() != Symbol() || OrderMagicNumber() != 总_47_in )   continue;
  子_1_da = TimeCurrent() ;
  子_2_da = OrderOpenTime() ;
  子_3_do = OrderOpenPrice() ;
  if ( OrderType() == 0 )
   {
   RefreshRates(); 
   总_26_do = SymbolInfoDouble(Symbol(),1) ;
   if ( 子_1_da - 子_2_da >  总_62_in_si6[1] && 子_1_da - 子_2_da <= 总_62_in_si6[2] && 总_26_do>总_63_in_si6[1] * 总_33_do + 子_3_do )
    {
    lizong_9(); 
    if ( StringLen("CloseTime  # Closing a position by idle time")  >  0 && 总_20_bo && ( 总_21_bo || 总_66_st != "CloseTime  # Closing a position by idle time" ) )
     {
     总_66_st = "CloseTime  # Closing a position by idle time" ;
     Print(总_66_st); 
    }}
   if ( 子_1_da - 子_2_da >  总_62_in_si6[2] && 子_1_da - 子_2_da <= 总_62_in_si6[3] && 总_26_do>总_63_in_si6[2] * 总_33_do + 子_3_do )
    {
    lizong_9(); 
    if ( StringLen("CloseTime  # Closing a position by idle time")  >  0 && 总_20_bo && ( 总_21_bo || 总_66_st != "CloseTime  # Closing a position by idle time" ) )
     {
     总_66_st = "CloseTime  # Closing a position by idle time" ;
     Print(总_66_st); 
    }}
   if ( 子_1_da - 子_2_da >  总_62_in_si6[3] && 子_1_da - 子_2_da <= 总_62_in_si6[4] && 总_26_do>总_63_in_si6[3] * 总_33_do + 子_3_do )
    {
    lizong_9(); 
    if ( StringLen("CloseTime  # Closing a position by idle time")  >  0 && 总_20_bo && ( 总_21_bo || 总_66_st != "CloseTime  # Closing a position by idle time" ) )
     {
     总_66_st = "CloseTime  # Closing a position by idle time" ;
     Print(总_66_st); 
    }}
   if ( 子_1_da - 子_2_da >  总_62_in_si6[4] && 子_1_da - 子_2_da <= 总_62_in_si6[5] && 总_26_do>总_63_in_si6[4] * 总_33_do + 子_3_do )
    {
    lizong_9(); 
    if ( StringLen("CloseTime  # Closing a position by idle time")  >  0 && 总_20_bo && ( 总_21_bo || 总_66_st != "CloseTime  # Closing a position by idle time" ) )
     {
     总_66_st = "CloseTime  # Closing a position by idle time" ;
     Print(总_66_st); 
    }}
   if ( 子_1_da - 子_2_da >  总_62_in_si6[5] && 总_26_do>总_63_in_si6[5] * 总_33_do + 子_3_do )
    {
    lizong_9(); 
    if ( StringLen("CloseTime  # Closing a position by idle time")  >  0 && 总_20_bo && ( 总_21_bo || 总_66_st != "CloseTime  # Closing a position by idle time" ) )
     {
     总_66_st = "CloseTime  # Closing a position by idle time" ;
     Print(总_66_st); 
   }}}
  if ( OrderType() != 1 )   continue;
  RefreshRates(); 
  总_27_do = SymbolInfoDouble(Symbol(),4) ;
  if ( 子_1_da - 子_2_da >  总_62_in_si6[1] && 子_1_da - 子_2_da <= 总_62_in_si6[2] && 总_27_do<子_3_do - 总_63_in_si6[1] * 总_33_do )
   {
   lizong_9(); 
   if ( StringLen("CloseTime  # Closing a position by idle time")  >  0 && 总_20_bo && ( 总_21_bo || 总_66_st != "CloseTime  # Closing a position by idle time" ) )
    {
    总_66_st = "CloseTime  # Closing a position by idle time" ;
    Print(总_66_st); 
   }}
  if ( 子_1_da - 子_2_da >  总_62_in_si6[2] && 子_1_da - 子_2_da <= 总_62_in_si6[3] && 总_27_do<子_3_do - 总_63_in_si6[2] * 总_33_do )
   {
   lizong_9(); 
   if ( StringLen("CloseTime  # Closing a position by idle time")  >  0 && 总_20_bo && ( 总_21_bo || 总_66_st != "CloseTime  # Closing a position by idle time" ) )
    {
    总_66_st = "CloseTime  # Closing a position by idle time" ;
    Print(总_66_st); 
   }}
  if ( 子_1_da - 子_2_da >  总_62_in_si6[3] && 子_1_da - 子_2_da <= 总_62_in_si6[4] && 总_27_do<子_3_do - 总_63_in_si6[3] * 总_33_do )
   {
   lizong_9(); 
   if ( StringLen("CloseTime  # Closing a position by idle time")  >  0 && 总_20_bo && ( 总_21_bo || 总_66_st != "CloseTime  # Closing a position by idle time" ) )
    {
    总_66_st = "CloseTime  # Closing a position by idle time" ;
    Print(总_66_st); 
   }}
  if ( 子_1_da - 子_2_da >  总_62_in_si6[4] && 子_1_da - 子_2_da <= 总_62_in_si6[5] && 总_27_do<子_3_do - 总_63_in_si6[4] * 总_33_do )
   {
   lizong_9(); 
   if ( StringLen("CloseTime  # Closing a position by idle time")  >  0 && 总_20_bo && ( 总_21_bo || 总_66_st != "CloseTime  # Closing a position by idle time" ) )
    {
    总_66_st = "CloseTime  # Closing a position by idle time" ;
    Print(总_66_st); 
   }}
  临_da_1 = 总_62_in_si6[5];
  if ( 子_1_da - 子_2_da <= 临_da_1 || !(总_27_do<子_3_do - 总_63_in_si6[5] * 总_33_do) )   continue;
  lizong_9(); 
  临_st_2 = "CloseTime  # Closing a position by idle time";
  if ( StringLen("CloseTime  # Closing a position by idle time")  <= 0 || !(总_20_bo) )   continue;
  
  if ( ( !(总_21_bo) && 总_66_st == "CloseTime  # Closing a position by idle time" ) )   continue;
  总_66_st = 临_st_2 ;
  Print(总_66_st); 
  
  }
 }
//lizong_14 <<==--------   --------
 string lizong_15( int 木_0_in)
 {
 string     临_st_1;

 switch(木_0_in)
  {
  case 0 :
  临_st_1 = "Buy";
  return(临_st_1);
  case 1 :
  临_st_1 = "Sell";
  return(临_st_1);
  case 2 :
  临_st_1 = "Buy Limit";
  return(临_st_1);
  case 3 :
  临_st_1 = "Sell Limit";
  return(临_st_1);
  case 4 :
  临_st_1 = "Buy Stop";
  return(临_st_1);
  case 5 :
  临_st_1 = "Sell Stop";
  return(临_st_1);
  }
 临_st_1 = "Unknown Operation";
 return(临_st_1);
 }
//lizong_15 <<==--------   --------
 void lizong_16()
 {
  datetime  子_1_da;
  double    子_2_do;
//----- -----
 datetime   临_da_1;
 double     临_do_2;
 int        临_in_3;
 bool       临_bo_4;
 bool       临_bo_5;
 string     临_st_6;
 int        临_in_7;
 int        临_in_8;
 int        临_in_9;
 int        临_in_10;
 int        临_in_11;
 uint       临_ui_12;
 string     临_st_13;
 bool       临_bo_14;
 bool       临_bo_15;
 string     临_st_16;
 int        临_in_17;
 int        临_in_18;
 int        临_in_19;
 int        临_in_20;
 int        临_in_21;
 double     临_do_22;
 uint       临_ui_23;
 uint       临_ui_24;
 uint       临_ui_25;
 uint       临_ui_26;
 string     临_st_27;

 子_1_da = StringToTime(TimeToString(TimeCurrent(),TIME_DATE)) ;
 临_da_1 = 子_1_da;
 临_do_2 = 0.0;
 for (临_in_3 = 0 ; 临_in_3 < OrdersHistoryTotal() ; 临_in_3=临_in_3 + 1)
  {
  if ( !(OrderSelect(临_in_3,SELECT_BY_POS,MODE_HISTORY)) || OrderSymbol() != Symbol() || OrderType() > 1 || OrderMagicNumber() != 总_47_in || 临_da_1 >= OrderCloseTime() )   continue;
  临_do_2 = OrderProfit() + OrderCommission() + OrderSwap() + 临_do_2;
  
  }
 子_2_do = 临_do_2 ;
 for ( ; (TimeDayOfWeek(子_1_da) < 1 || TimeDayOfWeek(子_1_da) > 5) ; 子_1_da = 子_1_da - 86400)
  {
  }
 临_bo_4 = false;
 临_bo_5 = false;
 临_st_6 = "Arial";
 临_in_7 = 2;
 临_in_8 = 10;
 临_in_9 = 2;
 临_in_10 = 5;
 临_in_11 = 10;
 临_ui_12 = Silver;
 临_st_13 = "Profit for today";
 if ( ObjectFind("pr1") <  0 )
  {
  ObjectCreate("pr1",OBJ_LABEL,0,0,0.0,0,0.0,0,0.0); 
  }
 ObjectSet("pr1",OBJPROP_COLOR,临_ui_12); 
 ObjectSet("pr1",OBJPROP_XDISTANCE,临_in_11); 
 ObjectSet("pr1",OBJPROP_YDISTANCE,临_in_10); 
 ObjectSet("pr1",OBJPROP_CORNER,临_in_9); 
 ObjectSet("pr1",1011,临_in_7); 
 ObjectSet("pr1",OBJPROP_BACK,临_bo_5); 
 ObjectSet("pr1",1000,临_bo_4); 
 ObjectSet("pr1",17,临_bo_4); 
 ObjectSetText("pr1",临_st_13,临_in_8,临_st_6,0xFFFFFFFF); 
 临_bo_14 = false;
 临_bo_15 = false;
 临_st_16 = "Arial";
 临_in_17 = 2;
 临_in_18 = 9;
 临_in_19 = 2;
 临_in_20 = 5;
 临_in_21 = 160;
 临_do_22 = 子_2_do;
 临_ui_23 = 0xFFFFFFFF;
 临_ui_24 = 0xFFFFFFFF;
 临_ui_25 = 0xFFFFFFFF;

    临_ui_23 = White;
    临_ui_24 = Aqua;
    临_ui_25 = Wheat;

 if ( 临_do_22>0.0 )
  {
  临_ui_23 = 临_ui_24;
  }
 if ( 临_do_22<0.0 )
  {
  临_ui_23 = 临_ui_25;
  }
 临_ui_26 = 临_ui_23;
 临_st_27 = DoubleToString(子_2_do,2);
 if ( ObjectFind("pr2") <  0 )
  {
  ObjectCreate("pr2",OBJ_LABEL,0,0,0.0,0,0.0,0,0.0); 
  }
 ObjectSet("pr2",OBJPROP_COLOR,临_ui_26); 
 ObjectSet("pr2",OBJPROP_XDISTANCE,临_in_21); 
 ObjectSet("pr2",OBJPROP_YDISTANCE,临_in_20); 
 ObjectSet("pr2",OBJPROP_CORNER,临_in_19); 
 ObjectSet("pr2",1011,临_in_17); 
 ObjectSet("pr2",OBJPROP_BACK,临_bo_15); 
 ObjectSet("pr2",1000,临_bo_14); 
 ObjectSet("pr2",17,临_bo_14); 
 ObjectSetText("pr2",临_st_27,临_in_18,临_st_16,0xFFFFFFFF); 
 }
//lizong_16 <<==--------   --------
 void lizong_17()
 {
  double    子_1_do;
  string    子_2_st;
  string    子_3_st;
  int       子_4_in;
//----- -----
 double     临_do_1;
 double     临_do_2;
 int        临_in_3;
 int        临_in_4;
 bool       临_bo_5;
 bool       临_bo_6;
 string     临_st_7;
 int        临_in_8;
 int        临_in_9;
 int        临_in_10;
 int        临_in_11;
 int        临_in_12;
 uint       临_ui_13;
 string     临_st_14;
 bool       临_bo_15;
 bool       临_bo_16;
 string     临_st_17;
 int        临_in_18;
 int        临_in_19;
 int        临_in_20;
 int        临_in_21;
 int        临_in_22;
 uint       临_ui_23;
 string     临_st_24;
 bool       临_bo_25;
 bool       临_bo_26;
 string     临_st_27;
 int        临_in_28;
 int        临_in_29;
 int        临_in_30;
 int        临_in_31;
 int        临_in_32;
 uint       临_ui_33;
 string     临_st_34;

 if ( !(MoneyManagement) )
  {
  子_1_do = OriginalLot ;
  }
 else
  {
  临_do_1 = MathFloor(AccountFreeMargin() * Risk / 100.0 / (总_46_in * 总_40_do) / 总_37_do) * 总_37_do;
  if ( 临_do_1<总_35_do )
   {
   临_do_1 = 总_35_do;
   }
  if ( 临_do_1>总_34_do )
   {
   临_do_1 = 总_34_do;
   }
  if ( !(MoneyManagement) )
   {
   临_do_1 = OriginalLot;
   if ( OriginalLot<总_35_do )
    {
    临_do_1 = 总_35_do;
    }
   if ( 临_do_1>总_34_do )
    {
    临_do_1 = 总_34_do;
   }}
  if ( OriginalLot<总_35_do )
   {
   Print(" Set Minimum lot: " + string(总_35_do)); 
   }
  if ( OriginalLot>总_34_do )
   {
   Print(" Set Maximum lot: " + string(总_34_do)); 
   }
  临_do_2 = NormalizeDouble(临_do_1 / 总_37_do,0) * 总_37_do;
  临_do_2 = MathMax(临_do_2,总_35_do);
  临_do_2 = MathMin(临_do_2,总_34_do);
  子_1_do = 临_do_2 ;
  }
 if ( 总_1_bo && lizong_10() == true )
  {
  子_1_do = lizong_11() ;
  }
 总_42_do = NormalizeDouble(SymbolInfoDouble(Symbol(),38),2) ;
 总_43_do = NormalizeDouble(SymbolInfoDouble(Symbol(),39),2) ;
 总_27_do = SymbolInfoDouble(Symbol(),4) ;
 总_26_do = SymbolInfoDouble(Symbol(),1) ;
 总_45_in = SymbolInfoInteger(Symbol(),18) ;
 if ( 总_15_bo == 0 )
  {
  总_59_in = 总_16_in ;
  总_60_in = TimeCurrent() - 总_16_in * 3600 ;
  }
 else
  {
  临_in_3 = -420;
  临_in_4 = int(TimeToString(TimeGMTOffset(),总_61_in_si43[0]));
  if ( 临_in_4 != 0 )
   {
   临_in_3 = 总_61_in_si43[0];
   }
  if ( 临_in_4 == 2 )
   {
   临_in_3=临_in_3 + 总_61_in_si43[42]; 
   }
  总_60_in = TimeLocal() + 临_in_3 * 60 ;
  总_59_in = (TimeCurrent() - 总_60_in) / 3500 ;
  }
 子_4_in = (TimeLocal() - 总_60_in) / 3500 ;
 if ( 子_4_in >  0 )
  {
  子_2_st = "\n     :: PC      : +" + string(子_4_in);
  }
 else
  {
  子_2_st = "\n     :: PC      : " + string(子_4_in);
  }
 if ( 总_59_in >  0 )
  {
  子_3_st = "\n     :: Broker   : +" + string(总_59_in);
  }
 else
  {
  子_3_st = "\n     :: Broker   : " + string(总_59_in);
  }
 Comment("\n     :: Date: ",Year(),".",Month(),".",Day(),"  :: Day: ",DayOfWeek(),"  :: Time: ",TimeToString(TimeCurrent(),TIME_SECONDS),"\n\n\n    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~","\n     :: Broker    :   ",TerminalCompany(),"\n     :: Ac. Name  :   ",AccountName(),"\n     :: Ac. Number   :   ",AccountNumber(),"\n     :: Ac. Leverage     :   1:",AccountLeverage(),"\n\n    ~~~~~~~~~~~~~~~~","\n     :: Equity  :  ",DoubleToString(AccountEquity(),2),"\n     :: Balans  :  ",DoubleToString(AccountBalance(),2),"\n     :: Currency  :  ",AccountCurrency(),"\n     :: Symbol    :  ",Symbol(),"\n     :: MagicNumber  :  ",181818,"\n    ~~~~~~~~~~~~~~~~","\n     :: Spread  :  ",DoubleToString(总_45_in,0)," pips","\n     :: Swap Long   :  ",DoubleToString(总_42_do,2),"\n     :: Swap Short  :  ",DoubleToString(总_43_do,2),"\n     :: Next Lots     :  ",DoubleToString(子_1_do,2),"\n    ~~~~~~~~~~~~~~~~","\n     :: TimeZone:  ",子_2_st,"\n     :: GMT    :  ",TimeToString(TimeGMT(),TIME_MINUTES),"\n     :: Server  :  ",TimeToString(TimeCurrent(),TIME_MINUTES),子_3_st,"\n    ~~~~~~~~~~~~~~~~"); 
 临_bo_5 = false;
 临_bo_6 = false;
 临_st_7 = "Arial";
 临_in_8 = 0;
 临_in_9 = 14;
 临_in_10 = 0;
 临_in_11 = 40;
 临_in_12 = 18;
 临_ui_13 = Yellow;
 临_st_14 = "   S           P";
 if ( ObjectFind("ban" + Symbol() + "2") <  0 )
  {
  ObjectCreate("ban" + Symbol() + "2",OBJ_LABEL,0,0,0.0,0,0.0,0,0.0); 
  }
 ObjectSet("ban" + Symbol() + "2",OBJPROP_COLOR,临_ui_13); 
 ObjectSet("ban" + Symbol() + "2",OBJPROP_XDISTANCE,临_in_12); 
 ObjectSet("ban" + Symbol() + "2",OBJPROP_YDISTANCE,临_in_11); 
 ObjectSet("ban" + Symbol() + "2",OBJPROP_CORNER,临_in_10); 
 ObjectSet("ban" + Symbol() + "2",1011,临_in_8); 
 ObjectSet("ban" + Symbol() + "2",OBJPROP_BACK,临_bo_6); 
 ObjectSet("ban" + Symbol() + "2",1000,临_bo_5); 
 ObjectSet("ban" + Symbol() + "2",17,临_bo_5); 
 ObjectSetText("ban" + Symbol() + "2",临_st_14,临_in_9,临_st_7,0xFFFFFFFF); 
 临_bo_15 = false;
 临_bo_16 = false;
 临_st_17 = "Arial";
 临_in_18 = 0;
 临_in_19 = 14;
 临_in_20 = 0;
 临_in_21 = 41;
 临_in_22 = 19;
 临_ui_23 = Red;
 临_st_24 = "   S           P";
 if ( ObjectFind("ban" + Symbol() + "3") <  0 )
  {
  ObjectCreate("ban" + Symbol() + "3",OBJ_LABEL,0,0,0.0,0,0.0,0,0.0); 
  }
 ObjectSet("ban" + Symbol() + "3",OBJPROP_COLOR,临_ui_23); 
 ObjectSet("ban" + Symbol() + "3",OBJPROP_XDISTANCE,临_in_22); 
 ObjectSet("ban" + Symbol() + "3",OBJPROP_YDISTANCE,临_in_21); 
 ObjectSet("ban" + Symbol() + "3",OBJPROP_CORNER,临_in_20); 
 ObjectSet("ban" + Symbol() + "3",1011,临_in_18); 
 ObjectSet("ban" + Symbol() + "3",OBJPROP_BACK,临_bo_16); 
 ObjectSet("ban" + Symbol() + "3",1000,临_bo_15); 
 ObjectSet("ban" + Symbol() + "3",17,临_bo_15); 
 ObjectSetText("ban" + Symbol() + "3",临_st_24,临_in_19,临_st_17,0xFFFFFFFF); 
 临_bo_25 = false;
 临_bo_26 = false;
 临_st_27 = "Arial";
 临_in_28 = 0;
 临_in_29 = 12;
 临_in_30 = 0;
 临_in_31 = 42;
 临_in_32 = 17;
 临_ui_33 = DarkBlue;
 临_st_34 = "**   calper     irate EA **";
 if ( ObjectFind("ban" + Symbol() + "1") <  0 )
  {
  ObjectCreate("ban" + Symbol() + "1",OBJ_LABEL,0,0,0.0,0,0.0,0,0.0); 
  }
 ObjectSet("ban" + Symbol() + "1",OBJPROP_COLOR,临_ui_33); 
 ObjectSet("ban" + Symbol() + "1",OBJPROP_XDISTANCE,临_in_32); 
 ObjectSet("ban" + Symbol() + "1",OBJPROP_YDISTANCE,临_in_31); 
 ObjectSet("ban" + Symbol() + "1",OBJPROP_CORNER,临_in_30); 
 ObjectSet("ban" + Symbol() + "1",1011,临_in_28); 
 ObjectSet("ban" + Symbol() + "1",OBJPROP_BACK,临_bo_26); 
 ObjectSet("ban" + Symbol() + "1",1000,临_bo_25); 
 ObjectSet("ban" + Symbol() + "1",17,临_bo_25); 
 ObjectSetText("ban" + Symbol() + "1",临_st_34,临_in_29,临_st_27,0xFFFFFFFF); 
 }
//lizong_17 <<==--------   --------
 bool lizong_18( int 木_0_in,double 木_1_do,double 木_2_do)
 {
  int       子_2_in;
  bool      子_3_bo;
  bool      子_4_bo;
//----- -----

 子_2_in = SymbolInfoInteger(Symbol(),31) ;
 if ( 子_2_in != 0 )
  {
  PrintFormat("SYMBOL_TRADE_STOPS_LEVEL=%d: StopLoss and TakeProfit must be must be not close %d points from the closing price",子_2_in,子_2_in); 
  }
 子_3_bo = false ;
 子_4_bo = false ;
 switch(木_0_in)
  {
  case 0 :
  总_26_do = SymbolInfoDouble(Symbol(),1) ;
  子_3_bo=总_26_do - 木_1_do>子_2_in * 总_33_do;
  if ( !(子_3_bo) )
   {
   PrintFormat("For order %s StopLoss=%.5f must be less than %.5f (Bid=%.5f - SYMBOL_TRADE_STOPS_LEVEL=%d paragraphs\')",EnumToString(ENUM_ORDER_TYPE(木_0_in)),木_1_do,总_26_do - 子_2_in * 总_33_do,总_26_do,子_2_in); 
   }
  子_4_bo=木_2_do - 总_26_do>子_2_in * 总_33_do;
  if ( !(子_4_bo) )
   {
   PrintFormat("For order %s TakeProfit=%.5f must be greater than %.5f (Bid=%.5f + SYMBOL_TRADE_STOPS_LEVEL=%d paragraphs\')",EnumToString(ENUM_ORDER_TYPE(木_0_in)),木_2_do,子_2_in * 总_33_do + 总_26_do,总_26_do,子_2_in); 
   }
  return(子_3_bo && 子_4_bo); 
  case 1 :
  总_27_do = SymbolInfoDouble(Symbol(),4) ;
  子_3_bo=木_1_do - 总_27_do>子_2_in * 总_33_do;
  if ( !(子_3_bo) )
   {
   PrintFormat("For order %s StopLoss=%.5f must be greater than %.5f  (Ask=%.5f + SYMBOL_TRADE_STOPS_LEVEL=%d paragraphs\')",EnumToString(ENUM_ORDER_TYPE(木_0_in)),木_1_do,子_2_in * 总_33_do + 总_27_do,总_27_do,子_2_in); 
   }
  子_4_bo=总_27_do - 木_2_do>子_2_in * 总_33_do;
  if ( !(子_4_bo) )
   {
   PrintFormat("For order %s TakeProfit=%.5f must be less than %.5f  (Ask=%.5f - SYMBOL_TRADE_STOPS_LEVEL=%d paragraphs\')",EnumToString(ENUM_ORDER_TYPE(木_0_in)),木_2_do,总_27_do - 子_2_in * 总_33_do,总_27_do,子_2_in); 
   }
  return(子_4_bo && 子_3_bo); 
  }
 return(false); 
 }
//lizong_18 <<==--------   --------
 int lizong_19()
 {
  int       子_2_in;
  bool      子_3_bo;
  int       子_4_in;
//----- -----

 子_2_in = GetLastError() ;
 switch(子_2_in)
  {
  case 0 :
  return(0); 
  case 2 :
  Print(" System failure. Restart computer/check the server"); 
  总_55_bo = false ;
  return(3); 
  case 3 :
  Print(" Error in logic of the expert"); 
  总_55_bo = false ;
  return(3); 
  case 4 :
  Print(" Trade server is busy. Waiting for 2 minutes"); 
  Sleep(120000); 
  return(2); 
  case 6 :
  子_3_bo = false ;
  子_4_in = 0 ;
  Print(" Disconnect "); 
  Sleep(10000); 
  Print(" The connection is not restored, it took ",子_4_in * 10,"  seconds\'"); 
  子_3_bo = IsConnected() ;
  if ( 子_3_bo )
   {
   Print(" The connection was restored"); 
   return(2); 
   }
  子_4_in = 子_4_in + 1;

  总_55_bo = false ;
  Print(" Connection issues"); 
  return(3); 
  case 8 :
  Print(" Frequent queries"); 
  总_55_bo = false ;
  return(3); 
  case 64 :
  Print(" Account is blocked !"); 
  总_55_bo = false ;
  return(3); 
  case 65 :
  Print(" Incorrect account number ???"); 
  总_55_bo = false ;
  return(3); 
  case 128 :
  Print(" Expired expectations of the transaction"); 
  return(2); 
  case 129 :
  Print(" The wrong price"); 
  return(1); 
  case 130 :
  Print(" Wrong stop"); 
  return(1); 
  case 131 :
  Print(" Incorrectly calculated the amount of the transaction"); 
  总_55_bo = false ;
  return(3); 
  case 132 :
  Print(" The market is closed"); 
  总_55_bo = false ;
  return(2); 
  case 134 :
  Print(" Not enough margin for the operation"); 
  总_55_bo = false ;
  return(2); 
  case 135 :
  Print(" The prices have changed"); 
  return(1); 
  case 136 :
  Print(" Prices do not !"); 
  return(2); 
  case 138 :
  Print(" Re-quoting again !"); 
  return(1); 
  case 139 :
  Print(" The order is in processing. Software glitch"); 
  return(2); 
  case 141 :
  Print(" Too many requests"); 
  总_55_bo = false ;
  return(2); 
  case 148 :
  Print(" Too much transaction volume"); 
  总_55_bo = false ;
  return(2); 
  }
 return(0); 
 }
//lizong_19 <<==--------   --------
 string lizong_20( int 木_0_in)
 {
  string    子_1_st;
//----- -----

 switch(木_0_in)
  {
  case 0 :
  子_1_st = " No error" ;
     break;
  case 1 :
  子_1_st = " No error, trade conditions not changed" ;
     break;
  case 2 :
  子_1_st = " Common error" ;
     break;
  case 3 :
  子_1_st = " Invalid trade parameters" ;
     break;
  case 4 :
  子_1_st = " Trade server is busy" ;
     break;
  case 5 :
  子_1_st = " Old version of the client terminal" ;
     break;
  case 6 :
  子_1_st = " No connection with trade server" ;
     break;
  case 7 :
  子_1_st = " Not enough rights" ;
     break;
  case 8 :
  子_1_st = " Too frequent requests" ;
     break;
  case 9 :
  子_1_st = " Malfunctional trade operation (never returned error)" ;
     break;
  case 64 :
  子_1_st = " Account disabled" ;
     break;
  case 65 :
  子_1_st = " Invalid account" ;
     break;
  case 128 :
  子_1_st = " Trade timeout" ;
     break;
  case 129 :
  子_1_st = " Invalid price" ;
     break;
  case 130 :
  子_1_st = " Invalid stops" ;
     break;
  case 131 :
  子_1_st = " Invalid trade volume" ;
     break;
  case 132 :
  子_1_st = " Market is closed" ;
     break;
  case 133 :
  子_1_st = " Trade is disabled" ;
     break;
  case 134 :
  子_1_st = " Not enough money" ;
     break;
  case 135 :
  子_1_st = " Price changed" ;
     break;
  case 136 :
  子_1_st = " Off quotes" ;
     break;
  case 137 :
  子_1_st = " Broker is busy (never returned error)" ;
     break;
  case 138 :
  子_1_st = " Requote" ;
     break;
  case 139 :
  子_1_st = " Order is locked" ;
     break;
  case 140 :
  子_1_st = " Long positions only allowed" ;
     break;
  case 141 :
  子_1_st = " Too many requests" ;
     break;
  case 145 :
  子_1_st = " Modification denied because order is too close to market" ;
     break;
  case 146 :
  子_1_st = " Trade context is busy" ;
     break;
  case 147 :
  子_1_st = " Expirations are denied by broker" ;
     break;
  case 148 :
  子_1_st = " Amount of open and pending orders has reached the limit" ;
     break;
  case 149 :
  子_1_st = " Hedging is prohibited" ;
     break;
  case 150 :
  子_1_st = " Prohibited by FIFO rules" ;
     break;
  case 4000 :
  子_1_st = " No error (never generated code)" ;
     break;
  case 4001 :
  子_1_st = " Wrong function pointer" ;
     break;
  case 4002 :
  子_1_st = " Array index is out of range" ;
     break;
  case 4003 :
  子_1_st = " No memory for function call stack" ;
     break;
  case 4004 :
  子_1_st = " Recursive stack overflow" ;
     break;
  case 4005 :
  子_1_st = " Not enough stack for parameter" ;
     break;
  case 4006 :
  子_1_st = " No memory for parameter string" ;
     break;
  case 4007 :
  子_1_st = " No memory for temp string" ;
     break;
  case 4008 :
  子_1_st = " Non-initialized string" ;
     break;
  case 4009 :
  子_1_st = " Non-initialized string in array" ;
     break;
  case 4010 :
  子_1_st = " No memory for array\' string" ;
     break;
  case 4011 :
  子_1_st = " Too long string" ;
     break;
  case 4012 :
  子_1_st = " Remainder from zero divide" ;
     break;
  case 4013 :
  子_1_st = " Zero divide" ;
     break;
  case 4014 :
  子_1_st = " Unknown command" ;
     break;
  case 4015 :
  子_1_st = " Wrong jump (never generated error)" ;
     break;
  case 4016 :
  子_1_st = " Non-initialized array" ;
     break;
  case 4017 :
  子_1_st = " Dll calls are not allowed" ;
     break;
  case 4018 :
  子_1_st = " Cannot load library" ;
     break;
  case 4019 :
  子_1_st = " Cannot call function" ;
     break;
  case 4020 :
  子_1_st = " Expert function calls are not allowed" ;
     break;
  case 4021 :
  子_1_st = " Not enough memory for temp string returned from function" ;
     break;
  case 4022 :
  子_1_st = " System is busy (never generated error)" ;
     break;
  case 4023 :
  子_1_st = " Dll-function call critical error" ;
     break;
  case 4024 :
  子_1_st = " Internal error" ;
     break;
  case 4025 :
  子_1_st = " Out of memory" ;
     break;
  case 4026 :
  子_1_st = " Invalid pointer" ;
     break;
  case 4027 :
  子_1_st = " Too many formatters in the format function" ;
     break;
  case 4028 :
  子_1_st = " Parameters count is more than formatters count" ;
     break;
  case 4029 :
  子_1_st = " Invalid array" ;
     break;
  case 4030 :
  子_1_st = " No reply from chart" ;
     break;
  case 4050 :
  子_1_st = " Invalid function parameters count" ;
     break;
  case 4051 :
  子_1_st = " Invalid function parameter value" ;
     break;
  case 4052 :
  子_1_st = " String function internal error" ;
     break;
  case 4053 :
  子_1_st = " Some array error" ;
     break;
  case 4054 :
  子_1_st = " Incorrect series array usage" ;
     break;
  case 4055 :
  子_1_st = " Custom indicator error" ;
     break;
  case 4056 :
  子_1_st = " Arrays are incompatible" ;
     break;
  case 4057 :
  子_1_st = " Global variables processing error" ;
     break;
  case 4058 :
  子_1_st = " Global variable not found" ;
     break;
  case 4059 :
  子_1_st = " Function is not allowed in testing mode" ;
     break;
  case 4060 :
  子_1_st = " Function is not confirmed" ;
     break;
  case 4061 :
  子_1_st = " Send mail error" ;
     break;
  case 4062 :
  子_1_st = " String parameter expected" ;
     break;
  case 4063 :
  子_1_st = " Integer parameter expected" ;
     break;
  case 4064 :
  子_1_st = " Double parameter expected" ;
     break;
  case 4065 :
  子_1_st = " Array as parameter expected" ;
     break;
  case 4066 :
  子_1_st = " Requested history data is in update state" ;
     break;
  case 4067 :
  子_1_st = " Internal trade error" ;
     break;
  case 4068 :
  子_1_st = " Resource not found" ;
     break;
  case 4069 :
  子_1_st = " Resource not supported" ;
     break;
  case 4070 :
  子_1_st = " Duplicate resource" ;
     break;
  case 4071 :
  子_1_st = " Cannot initialize custom indicator" ;
     break;
  case 4072 :
  子_1_st = " Cannot load custom indicator" ;
     break;
  case 4073 :
  子_1_st = " No history data" ;
     break;
  case 4074 :
  子_1_st = " Not enough memory for history data" ;
     break;
  case 4075 :
  子_1_st = " Not enough memory for indicator" ;
     break;
  case 4099 :
  子_1_st = " End of file" ;
     break;
  case 4100 :
  子_1_st = " Some file error" ;
     break;
  case 4101 :
  子_1_st = " Wrong file name" ;
     break;
  case 4102 :
  子_1_st = " Too many opened files" ;
     break;
  case 4103 :
  子_1_st = " Cannot open file" ;
     break;
  case 4104 :
  子_1_st = " Incompatible access to a file" ;
     break;
  case 4105 :
  子_1_st = " No order selected" ;
     break;
  case 4106 :
  子_1_st = " Unknown symbol" ;
     break;
  case 4107 :
  子_1_st = " Invalid price parameter for trade function" ;
     break;
  case 4108 :
  子_1_st = " Invalid ticket" ;
     break;
  case 4109 :
  子_1_st = " Trade is not allowed in the expert properties" ;
     break;
  case 4110 :
  子_1_st = " Longs are not allowed in the expert properties" ;
     break;
  case 4111 :
  子_1_st = " Shorts are not allowed in the expert properties" ;
     break;
  case 4200 :
  子_1_st = " Object already exists" ;
     break;
  case 4201 :
  子_1_st = " Unknown object property" ;
     break;
  case 4202 :
  子_1_st = " Object does not exist" ;
     break;
  case 4203 :
  子_1_st = " Unknown object type" ;
     break;
  case 4204 :
  子_1_st = " No object name" ;
     break;
  case 4205 :
  子_1_st = " Object coordinates error" ;
     break;
  case 4206 :
  子_1_st = " No specified subwindow" ;
     break;
  case 4207 :
  子_1_st = " Graphical object error" ;
     break;
  case 4210 :
  子_1_st = " Unknown chart property" ;
     break;
  case 4211 :
  子_1_st = " Chart not found" ;
     break;
  case 4212 :
  子_1_st = " Chart subwindow not found" ;
     break;
  case 4213 :
  子_1_st = " Chart indicator not found" ;
     break;
  case 4220 :
  子_1_st = " Symbol select error" ;
     break;
  case 4250 :
  子_1_st = " Notification error" ;
     break;
  case 4251 :
  子_1_st = " Notification parameter error" ;
     break;
  case 4252 :
  子_1_st = " Notifications disabled" ;
     break;
  case 4253 :
  子_1_st = " Notification send too frequent" ;
     break;
  case 4260 :
  子_1_st = " Ftp server is not specified" ;
     break;
  case 4261 :
  子_1_st = " Ftp login is not specified" ;
     break;
  case 4262 :
  子_1_st = " Ftp connect failed" ;
     break;
  case 4263 :
  子_1_st = " Ftp connect closed" ;
     break;
  case 4264 :
  子_1_st = " Ftp change path error" ;
     break;
  case 4265 :
  子_1_st = " Ftp file error" ;
     break;
  case 4266 :
  子_1_st = " Ftp error" ;
     break;
  case 5001 :
  子_1_st = " Too many opened files" ;
     break;
  case 5002 :
  子_1_st = " Wrong file name" ;
     break;
  case 5003 :
  子_1_st = " Too long file name" ;
     break;
  case 5004 :
  子_1_st = " Cannot open file" ;
     break;
  case 5005 :
  子_1_st = " Text file buffer allocation error" ;
     break;
  case 5006 :
  子_1_st = " Cannot delete file" ;
     break;
  case 5007 :
  子_1_st = " Invalid file handle (file closed or was not opened)" ;
     break;
  case 5008 :
  子_1_st = " Wrong file handle (handle index is out of handle table)" ;
     break;
  case 5009 :
  子_1_st = " File must be opened with FILE_WRITE flag" ;
     break;
  case 5010 :
  子_1_st = " File must be opened with FILE_READ flag" ;
     break;
  case 5011 :
  子_1_st = " File must be opened with FILE_BIN flag" ;
     break;
  case 5012 :
  子_1_st = " File must be opened with FILE_TXT flag" ;
     break;
  case 5013 :
  子_1_st = " File must be opened with FILE_TXT or FILE_CSV flag" ;
     break;
  case 5014 :
  子_1_st = " File must be opened with FILE_CSV flag" ;
     break;
  case 5015 :
  子_1_st = " File read error" ;
     break;
  case 5016 :
  子_1_st = " File write error" ;
     break;
  case 5017 :
  子_1_st = " String size must be specified for binary file" ;
     break;
  case 5018 :
  子_1_st = " Incompatible file (for string arrays-TXT, for others-BIN)" ;
     break;
  case 5019 :
  子_1_st = " File is directory, not file" ;
     break;
  case 5020 :
  子_1_st = " File does not exist" ;
     break;
  case 5021 :
  子_1_st = " File cannot be rewritten" ;
     break;
  case 5022 :
  子_1_st = " Wrong directory name" ;
     break;
  case 5023 :
  子_1_st = " Directory does not exist" ;
     break;
  case 5024 :
  子_1_st = " Specified file is not directory" ;
     break;
  case 5025 :
  子_1_st = " Cannot delete directory" ;
     break;
  case 5026 :
  子_1_st = " Cannot clean directory" ;
     break;
  case 5027 :
  子_1_st = " Array resize error" ;
     break;
  case 5028 :
  子_1_st = " String resize error" ;
     break;
  case 5029 :
  子_1_st = " Structure contains strings or dynamic arrays" ;
     break;
  default :
  子_1_st = " Unknown error" ;
  }
 return(子_1_st);
 }
//<<==lizong_20 <<==

