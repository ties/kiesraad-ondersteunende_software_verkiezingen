// UDMv4.5 //
/***************************************************************/
var um={'menuClasses':[],'itemClasses':[],'menuCode':[]};
/***************************************************************\

  ULTIMATE DROP DOWN MENU Version 4.5 by Brothercake
  http://www.udm4.com/
  
  This script may not be used or distributed without license

\***************************************************************/


/***************************************************************\
 * CORE CONFIGURATION
\***************************************************************/


//path to images folder 
um.baseSRC = "udm/"

//initialization trigger element ["id"];
um.trigger = "brothercake";


//navbar orientation
um.orientation = [
    "horizontal",   // alignment ["vertical"|"horizontal"|"popup"|"expanding"]
    "left",     // h align ["left"|"right"|"rtl"]
    "top",      // v align ["top"|"bottom"]
    "relative", // positioning ["relative"|"absolute"|"fixed"|"allfixed"]
    "10px",     // x position ["em"|"ex"|"px"|"0"]
    "0",        // y position ["em"|"ex"|"px"|"0"]
    "1000",     // z order ["0" to "10000"] (menu takes 20000 headroom)
    ];
    

//navbar list output
um.list = [
    "flexible", // horizontal overflow ["rigid"|"flexible"]
    "yes",      // -SPARE-
    "no",       // -SPARE-
    ];


//menu behaviors    
um.behaviors = [
    "200",      // open timer ["milliseconds"|"0"]
    "500",      // close timer ["milliseconds"|"never"|"0"]
    "yes",      // reposition menus to stay inside the viewport ["yes"|"no"]
    "default",  // manage windowed controls for win/ie ["default","hide","iframe","none"]
    ];


//reset behaviors
um.reset = [
    "yes",      // reset from document mouse click ["yes"|"no"]
    "yes",      // reset from window resize ["yes"|"no"]
    "yes",      // reset from text resize ["yes"|"no"]
    "no",       // reset after following link ["yes"|"no"]
    ];


//horizontal continuation strip
um.hstrip = [
    "#039",     // background ["color"|"#hex"|"rgb()"|"image.gif"|"none"]
    "no",       // copy item margin-right to margin-bottom ["yes"|"no"]
    ];
    
    
/***************************************************************\
 * MODULE SETTINGS
\***************************************************************/


//keyboard navigation
um.keys = [
    "38",       // up ["n"] ("38" = up arrow key)
    "39",       // right ["n"] ("39" = right arrow key)
    "40",       // down ["n"] ("40" = down arrow key)
    "37",       // left ["n"] ("37" = left arrow key)
    "123",      // hotkey ["n"] ("123" = F12)
    "none",     // hotkey modifier ["none"|"shiftKey"|"ctrlKey"|"altKey"|"metaKey"]
    "27",       // escape ["n"|"none"] ("27" = escape key)
    "document.getElementsByTagName('a')[4]", // exit focus ["js-expression"]
    ];


/***************************************************************\
 * NAVBAR DEFAULT STYLES
\***************************************************************/


//styles which apply to the navbar
um.navbar = [
    "1",        // nav to menu x-offset (+-)["n" pixels]
    "-2",   // nav to menu y-offset (+-)["n" pixels]
    "7.5em",    // width ["em"|"ex"|"px"] (vertical navbar only - horizontal navbar items have "auto" width) ("%" doesn't work right) 
    ];


//styles which apply to each navbar item
um.items = [
    "0",        // margin between items ["n" pixels]
    "2",        // border size ["n" pixels] (single value only)
    "separate", // border collapse ["collapse"|"separate"] (only applies when margin = "0")
    "#039",// border colors ["color"|"#hex"|"rgb()"] (single, double or four values)
    "solid",    // border styles ["solid"|"double"|"dotted"|"dashed"|"groove"|"ridge"|"inset"|"outset"] (single, double or four values; be careful with using "none")
    "#039",// hover/focus border colors ["color"|"#hex"|"rgb()"] (single, double or four values)
    "solid",    // hover/focus border styles ["solid"|"double"|"dotted"|"dashed"|"groove"|"ridge"|"inset"|"outset"] (single, double or four values; be careful with using "none")
    "#039",// visited border colors ["color"|"#hex"|"rgb()"] (single, double or four values)
    "solid",// visited border styles ["solid"|"double"|"dotted"|"dashed"|"groove"|"ridge"|"inset"|"outset"] (single, double or four values; be careful with using "none")
    "5",        // left/right padding ["n" pixels] (single value only)
    "3",        // top/bottom padding ["n" pixels] (single value only)
    "#039",// background ["color"|"#hex"|"rgb()"|"image.gif"]
    "#fff",// hover/focus background ["color"|"#hex"|"rgb()"|"image.gif"]
    "#039",// visited background ["color"|"#hex"|"rgb()"|"image.gif"]
    "90%",      // font size ["em"|"ex"|"%"|"px"|"pt"|"absolute-size"|"relative-size"]
    "verdana,sans-serif",// font family ["font1,font2,font3"] (always end with a generic family name)
    "bold",     // font weight ["normal"|"bold"|"bolder"|"lighter|"100" to "900"]
    "none",     // text decoration ["none"|"underline"|"overline"|"line-through"]
    "left",     // text-align ["left"|"right"|"center"]
    "#fff", // color ["color"|"#hex"|"rgb()"]
    "#039", // hover/focus color ["color"|"#hex"|"rgb()"]
    "#fff", // visited color ["color"|"#hex"|"rgb()"]
    "normal",   // font-style ["normal"|"italic"|"oblique"]
    "normal",   // hover/focus font-style ["normal"|"italic"|"oblique"]
    "normal",   // visited font-style ["normal"|"italic"|"oblique"]
    "",// additional link CSS (careful!)
    "",// additional hover/focus CSS (careful!)
    "",// additional visited CSS (careful!)
    "down-pink.gif",// menu indicator character/image ["text"|"image.gif"|"none"] 
    "down-claret.gif",// menu indicator rollover image ["image.gif"|"none"] (only when using image arrows)
    "10",       // clipping width of indicator image ["n" pixels] (only when using image arrows)
    "...",      // alt text of indicator image ["text"] (only when using image arrows)
    ];


/***************************************************************\
 * MENU DEFAULT STYLES
\***************************************************************/


//styles which apply to each menu
um.menus = [
    "-25",      // menu to menu x-offset (+-)["n" pixels]
    "18",       // menu to menu y-offset (+-)["n" pixels]
    "1",        // border size ["n" pixels] (single value only) 
    "#000",// border colors ["color"|"#hex"|"rgb()"] (single, double or four values)
    "solid",    // border styles ["solid"|"double"|"dotted"|"dashed"|"groove"|"ridge"|"inset"|"outset"] (single, double or four values; be careful with using "none")
    "9em",  // width ["em"|"ex"|"px"]
    "0",        // padding ["n" pixels] (single value only) 
    "white",    // background ["color"|"#hex"|"rgb()"|"image.gif"]
    "",     // additional menu CSS (careful!) (you can use a transition here but *not* a static filter)
    "none",// shadow background ["color"|"#hex"|"rgb()"|"image.gif"|"none"]
    "0px",      // shadow offset (+-)["em"|"ex"|"px"|"%"|"0"]
    "",// additional shadow layer CSS (if you use a Microsoft.Shadow filter here then Win/IE5.5+ will do that *instead* of default shadow)
    ];


//styles which apply to each menu item
um.menuItems = [
    "2",        // margin around items ["n" pixels] (single value only; margins are like table cellspacing)
    "1",        // border size ["n" pixels] (single value only)
    "separate", // border collapse ["collapse"|"separate"] (only applies when margin = "0")
    "#039", // border colors ["color"|"#hex"|"rgb()"] (single, double or four values)
    "solid",    // border styles ["solid"|"double"|"dotted"|"dashed"|"groove"|"ridge"|"inset"|"outset"] (single, double or four values; be careful with using "none")
    "#039",     // hover/focus border colors ["color"|"#hex"|"rgb()"] (single, double or four values)
    "solid",    // hover/focus border styles ["solid"|"double"|"dotted"|"dashed"|"groove"|"ridge"|"inset"|"outset"] (single, double or four values; be careful with using "none")
    "#039", // visited border colors ["color"|"#hex"|"rgb()"] (single, double or four values)
    "solid",    // visited border styles ["solid"|"double"|"dotted"|"dashed"|"groove"|"ridge"|"inset"|"outset"] (single, double or four values; be careful with using "none")
    "6",        // left/right padding ["n" pixels] (single value only) 
    "3",        // top/bottom padding ["n" pixels] (single value only) 
    "#039", // background ["color"|"#hex"|"rgb()"|"image.gif"]
    "#fff", // hover/focus background ["color"|"#hex"|"rgb()"|"image.gif"]
    "#039", // visited background ["color"|"#hex"|"rgb()"|"image.gif"]
    "75%",      // font size ["em"|"ex"|"%"|"px"|"pt"|"absolute-size"|"relative-size"]
    "verdana,sans-serif",// font family ["font1,font2,font3"] (always end with a generic family name)
    "normal",   // font weight ["normal"|"bold"|"bolder"|"lighter|"100" to "900"]
    "none",     // text decoration ["none"|"underline"|"overline"|"line-through"]
    "left",     // text-align ["left"|"right"|"center"]
    "#fff",     // color ["color"|"#hex"|"rgb()"]
    "#039",     // hover/focus color ["color"|"#hex"|"rgb()"]
    "#fff",     // visited color ["color"|"#hex"|"rgb()"]
    "normal",   // font-style ["normal"|"italic"|"oblique"]
    "normal",   // hover/focus font-style ["normal"|"italic"|"oblique"]
    "normal",   // visited font-style ["normal"|"italic"|"oblique"]
    "",     // additional link CSS (careful!)
    "",     // additional hover/focus CSS (careful!)
    "",     // additional visited CSS (careful!)
    "right-pink.gif",// menu indicator character/image ["text"|"image.gif"|"none"] 
    "right-claret.gif",// menu indicator rollover image ["image.gif"|"none"] (only when using image arrows)
    "10",       // clipping width of indicator image ["n" pixels] (only when using image arrows)
    "..",       // alt text of indicator image ["text"] (only when using image arrows)
    ];


/***************************************************************\
 * MENU CLASSES
\***************************************************************/





/***************************************************************\
 * DYNAMIC MENUS
\***************************************************************/




    
/***************************************************************\
\***************************************************************/

