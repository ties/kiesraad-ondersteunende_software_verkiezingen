        function fold(obj) {
          //switch anchor text between '+' and '-'
          obj.innerHTML= (obj.innerHTML == '-') ? '+' : '-';
          //switch anchor title between 'expand' and 'collapse'
          obj.title= (obj.title == 'collapse') ? 'expand' : 'collapse';
  
          //the next two lines get all 'span' siblings of the a tag that was 
          //clicked and then pick the first one. This is the one whose children
          //must be hidden. We also don't select text nodes this way.
          var siblings= obj.parentNode.getElementsByTagName('span');
          var tmp= siblings[0];
          
          //go through all children of the node selected and test their className
          //if 'expanded' or 'collapsed', switch, otherwise ignore it
          for (i=0; i != tmp.childNodes.length; i++)
          {
            var name= new String(tmp.childNodes[i].className);
            if (name == 'expanded' || name == 'collapsed') {
              tmp.childNodes[i].className = (tmp.childNodes[i].className == 'expanded') ? 'collapsed' : 'expanded';
            } else {
              //no change to the name if it isn't one of 'expanded' or 'collapsed'
            }
          }
        }
        function foldall(obj) {
          var collapse= (obj.innerHTML == 'Collapse all');
          //switch text between 'collapse all' and 'expand all'
          obj.innerHTML= collapse ? 'Expand all' : 'Collapse all';
          
          //now get all anchor tags and fold them
          var anchors= document.getElementsByTagName("a");
          for (i=0; i != anchors.length; i++) {
            if (anchors[i].className == 'fold') {
              anchors[i].innerHTML= collapse ? '+' : '-';
              anchors[i].title= collapse? 'expand' : 'collapse';
              var siblings= anchors[i].parentNode.getElementsByTagName('span');
              var span= siblings[0];
              
              for (j=0; j != span.childNodes.length; j++){
                var name= new String(span.childNodes[j].className);
                if (name == 'expanded' || name == 'collapsed') {
                  if(span.childNodes[j].id == 'content-span') {
                    span.childNodes[j].className= collapse ? 'collapsed' : 'expanded';
                  } else {
                    span.childNodes[j].className= collapse ? 'expanded' : 'collapsed';
                  }
                } else {
                  //no change
                }
              }
            }
          }
        }