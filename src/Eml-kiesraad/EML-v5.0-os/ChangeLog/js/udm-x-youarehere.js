// UDMv4.5 // You Are Here extension v1.13 //
/***************************************************************\

  ULTIMATE DROP DOWN MENU Version 4.5 by Brothercake
  http://www.udm4.com/

\***************************************************************/

/***************************************************************\
 * Set you are here parameters
\***************************************************************/

var youAreHere=[
    "index.html",       // default page name [eg "index.php", "default.html" etc]
    "You are here: ",   // add text to here-page title ["text"|"none"]
    "You're in this branch: ", // add text to here-branch title ["text"|"none"]
    "before",       // where to add title text ["before"|"after"]
    "no",           // open here-branch menus automatically ["yes"|"no"]
    ];

/***************************************************************\
\***************************************************************/









//### REMEMBER TO CHANGE THE REGEX LITERAL
//### "/[a-z]+\:\/\//" to "/[a-z]+\:\/\/"
//### BEFORE CONCATENATING THIS SCRIPT
//### THEN CHANGE IT BACK AFTERWARDS, OBVIOUSLY :)




//global object
var yah=new Object;



//add to title method
yah.addToTitle=function(titleNode,titleText)
{
    //link text value
    yah.iText='';

    //get child nodes
    yah.nodes=titleNode.childNodes;
    yah.nodesLen=yah.nodes.length;

    //for each node
    for(i=0; i<yah.nodesLen; i++)
    {
        //if it's a text node
        if(yah.nodes[i].nodeType==3)
        {
            //store its value and stop
            yah.iText=yah.nodes[i].nodeValue;
            break;
        }
    }

    //compile title attribute from existing title if it has one
    //or link text if it doesn't have a title
    yah.title=(titleNode.title=='') ? yah.iText : titleNode.title;

    //add title text
    yah.title=(youAreHere[3]=='before') ? titleText + yah.title : yah.title + titleText;

    //write the value to title attribute
    titleNode.title=yah.title;
};



//sort matrix numerically by first member
function compareNumbers(a,b)
{
    return b[0]-a[0];
};




//add receiver for navbar initialised event
//so, if there's an existing onload function
if(typeof window.onload=='function')
{
    //store it
    um.yon=onload;
    //setup handler
    window.onload=function()
    {
        //call it
        um.yon();
        //call initialising function
        findHere();
    };
}
//if there's no existing load function
else
{
    //setup handler to call initialising function
    window.onload=findHere;
}




//navbar initialised receiver function
function findHere()
{
    //don't continue if the tree doesn't exist
    var tree=document.getElementById('udm');
    if(!tree){return false;}

    //store document address
    //normalize difference between http/https
    //by removing the 's' if it's present
    yah.uri=top.document.location.href.replace('https://','http://');

    //remove default page name
    yah.uri=yah.uri.replace(youAreHere[0],'');

    //escape commas, otherwise IE doesn't do a proper URI comparision on them
    yah.uri=yah.uri.replace(/,/g,'%2C');

    //create an array of possible matches
    yah.matches=[];

    //get array of navbar links
    yah.links=tree.getElementsByTagName('a');
    yah.linksLen=yah.links.length;

    //for each link
    for(var i=0; i<yah.linksLen; i++)
    {
        //store href of this link
        //normalize difference between http/https
        yah.href=yah.links[i].href.replace('https://','http://');

        //we need the href to be qualified for comparison with page URI
        //so if it has a value but isn't a live address (x://)
        //and it isn't a processed nohref link (a javascript:void URI)
        //reset possible matches array and stop
        //which effectively abandons the whole script
        //this is here to catch Safari 1.0 and 1.1
        //in which the href property doesn't come back qualified -
        //it comes back as the literal attribute value
        if(yah.href&&yah.href!=um.jv&&!/[a-z]+\:\/\//.test(yah.href))
        {
            yah.matches=[];
            break;
        }

        //remove default page name
        yah.href=yah.href.replace(youAreHere[0],'');

        //escape commas, otherwise IE doesn't do proper URI comparision on them
        yah.href=yah.href.replace(/,/g,'%2C');

        //alert('link href=' + yah.href + '\npage href=' + yah.uri
        //  + '\n\n' + (yah.href!=''&&yah.href!=um.jv&&yah.uri.indexOf(yah.href)!=-1));

        //if the address isn't empty
        //and it isn't a processed nohref link (a javascript:void URI)
        //and contains the href of this link
        if(yah.href!=''&&yah.href!=um.jv&&yah.uri.indexOf(yah.href)!=-1)
        {
            //store this link object
            yah.matches[yah.matches.length]=yah.links[i];
        }
    }

    //number of matches
    yah.matchesLen=yah.matches.length;

    //don't continue if there are no matches
    if(yah.matchesLen < 1) { return false; }

    //create an array of match probabilities
    yah.probs=[];

    //for each match
    for(i=0; i<yah.matchesLen; i++)
    {
        //get link href characters
        //normalize difference between http/https
        yah.href=yah.matches[i].href.replace('https://','http://');
        yah.hrefLen=yah.href.length;

        //initially zero probability
        //store object as well so we have it at the other end
        yah.probs[i]=[0,yah.href];

        //for each character
        for(var j=0; j<yah.hrefLen; j++)
        {
            //if this character is the same as
            //the same character in the uri
            if(yah.href.charAt(j)==yah.uri.charAt(j))
            {
                //add one to probability
                yah.probs[i][0]++;
            }
        }
    }

    //sort the probabilites matrix numerically from item [0]
    yah.probs.sort(compareNumbers);

    //so .. the href we want is now at index [0][1]
    yah.href=yah.probs[0][1];

    //for each link again
    for(i=0; i<yah.linksLen; i++)
    {
        //normalize difference between http/https
        yah.linkref=yah.links[i].href.replace('https://','http://');

        //if the hrefs are the same
        if(yah.linkref==yah.href)
        {
            //if add to title is not "none"
            if(youAreHere[1]!='none')
            {
                //add to title
                yah.addToTitle(yah.links[i],youAreHere[1]);
            }

            //apply here class
            applyHereClass(yah.links[i]);
        }
    }

    return true;
};


//apply here class to link and ancestors
function applyHereClass(link)
{
    //increase z-order to bring each highlighted link above the previous
    //this allows for simulated border-collapse using negative top margin
    link.style.zIndex=um.e[6]+=2;

    //store classname, converting null reference for kde's benefit
    yah.cname=um.es(link.className);

    //O7 requires that we check for existing class name before setting it
    //maybe it doesn't allow class=" something"
    (yah.cname=='')?link.className='udmY':link.className+=' udmY';

    //if add to branch title is not "none"
    if(youAreHere[2]!='none')
    {
        //if this link doesn't already have here-page title text
        if(link.title.indexOf(youAreHere[1])==-1)
        {
            //add to here-branch title
            yah.addToTitle(link,youAreHere[2]);
        }
    }

    //store parent LI's parent UL classname, converting null reference for kde's benefit
    yah.ppc=um.es(um.gp(link).parentNode.className);

    //is this link in the main navbar
    yah.isNav=yah.ppc=='udm';


    //if auto-open is set and this is a menu link
    if(youAreHere[4]=='yes'&&!yah.isNav)
    {
        //get the parent menu of this link
        yah.pm=um.gp(link).parentNode;

        //reset offleft positioning properties
        yah.pm.style.height='auto';
        yah.pm.style.overflow='visible';
        yah.pm.style.left='auto';
        yah.pm.style.top='0';
        //if this is an expanding menu
        if(um.ep)
        {
            //set the menu position to relative
            //yah.pm.style.position='relative';
            yah.pm.style.position='static';
        }

        //display this menu
        um.xd(yah.pm);

        //compensate for arrow insertion
        //not for mac/ie5 or when menu arrows are not in use
        if(!um.mie&&um.e[89]!='none')
        {

            //store length of child nodes collection
            um.kl=yah.pm.childNodes.length;

            //for each child node
            i=0;
            do
            {
                //store reference to node
                um.tn=yah.pm.childNodes.item(i);

                //get node name (converted for O7 in XHTML mode)
                um.nn=um.vn(um.tn.nodeName).toLowerCase();

                //if this is a list item
                if(um.nn=='li')
                {
                    //get arrow object
                    um.ar=um.n.ga(um.gc(um.tn));

                    //if arrow exists
                    if(um.ar!=null)
                    {
                        //apply arrow padding
                        um.n.wp(um.ar,um.tn,um.e[70],0,0);
                    }
                }
                i++;
            }
            while(i<um.kl);
        }

        //create shadow layer
        um.sh=null;
        if(!um.ns&&um.e[58]!='none')
        {
            um.n.hl(yah.pm);
            //show shadow
            um.xd(um.sh);
        }

        //create iframe layer to cover windowed objects for win/ie5.5+
        //if that functionality is in use
        if(um.wie55&&(um.e[13]=='default'||um.e[13]=='iframe'))
        {
            um.n.il(yah.pm);
        }

        //if select-element hiding is being used
        if(um.hz)
        {
            //hide selects
            um.n.ts('hidden');
        }

        //show menu
        um.xv(yah.pm);
    }


    //look for an arrow object, but nor for mac/ie5
    //or if arrow function doesn't exist, which will happen when using a server-side config with no arrows
    yah.arrow=(!um.mie&&typeof um.n.ga=='function')?um.n.ga(link):null;

    //if there is one
    if(yah.arrow!=null)
    {
        //convert reference for safari or konqueror,
        //because its arrow is an image inside a span, not just an image
        if(um.s||um.k){yah.arrow=yah.arrow.firstChild;}

        //if this is an image arrow
        if((yah.isNav&&um.ni)||(!yah.isNav&&um.mi))
        {
            //store parent item classname, converting null reference for kde's benefit
            yah.pic=um.es(um.gp(link).className);

            //get rollover or rollout arrow image value //ad-hoc if a class applies else default
            //and change arrow image src with it
            yah.arrow.src=um.baseSRC+((yah.isNav)?um.e[46]:(typeof um.w[yah.pic]!=um.un)?um.w[yah.pic][24]:um.e[90]);
        }
    }

    //if parent is not the main navbar
    if(!yah.isNav)
    {
        //set link object to ancestor
        yah.link=um.gc(um.gp(link).parentNode.parentNode);

        //recur
        applyHereClass(yah.link);
    }
};

