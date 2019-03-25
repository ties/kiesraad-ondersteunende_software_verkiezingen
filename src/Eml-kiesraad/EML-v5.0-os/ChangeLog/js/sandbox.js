 var current_element= null;
 var sync= false;
 var unideltaOptions= "<p><input type=\"checkbox\" id=\"param-CompressOutput\" onclick=\"javascript:doDeltaCompare();\"  checked=\"checked\" /> Standard Unidelta (uncheck for expanded unidelta)</p>";
 var deltaOptions= "<p><input type=\"checkbox\" id=\"param-FullContext\" onclick=\"javascript:doDeltaCompare();\"  checked=\"checked\" /> Full Context</p>";
 
  function tab_pressed(id, dxp, params) {
    if (current_element != id) {
      var curTab= document.getElementById(current_element);
      var nxtTab= document.getElementById(id);
      var tmp= curTab.className
      curTab.className= nxtTab.className;
      nxtTab.className= tmp;
      current_element= id;
      document.getElementById('dxp').value=dxp;
      document.getElementById('param-options').innerHTML= params;
      document.getElementById('result').innerHTML= "reloading...";
      doDeltaCompare();
    }
  }
  
  function doPageLoad() {
    // is this a sync-box
    sync= document.getElementById("sync").value == "yes";
    
    if (sync) {
      document.getElementById('dxp').value= 'sync/concurrent-edit';
      current_element= 'conc_tab';
    } else {
      document.getElementById('dxp').value= 'core/compare-std';
      current_element= 'html_tab';
    }
    
    doDeltaCompare();
    addKeyListener('doc1');
    addKeyListener('doc2');
    if (sync) {
      addKeyListener('doc3');
    }
  }
  
function addEvent(obj, evType, fn){ 
  if (obj.addEventListener){ 
    obj.addEventListener(evType, fn, false); 
    return true; 
  } else if (obj.attachEvent){ 
    var r = obj.attachEvent("on"+evType, fn); 
    return r; 
  } else { 
    return false; 
  } 
}
addEvent(window, 'load', doPageLoad);

function makeActive(o) {o.innerHTML= "DeltaXML: Pending"; o.style.backgroundColor = "#ff0000"; }
function makeInactive(o) {
  if (o.innerHTML.indexOf("DeltaXML: Error") == -1) {
  o.innerHTML= "DeltaXML: Idle";
  o.style.backgroundColor = "#009966";
  }
}
function makeError(errmsg) {document.getElementById('ajaxStatus').innerHTML= "DeltaXML: Error (" + errmsg + ")";  document.getElementById('ajaxStatus').style.backgroundColor = "#ff0000"; }

function AjaxRequestBegin() {makeActive(document.getElementById('ajaxStatus')); }
function AjaxRequestEnd() {makeInactive(document.getElementById('ajaxStatus')); }
  
function doDeltaCompare() {

  var href= "/live/";
  
  if (sync) {
    href+= "sync";
  } else {
    href+= "core";
  }
  
  var dxp= document.getElementById("dxp");
  href+= "?dxp=" + dxp.value + ".dxp";
  
  var doc1= document.getElementById("doc1");
  href+= "&doc1=" + doc1.value.replace(/\n/g,"%0A").replace(/\#/g,"%35");
    
  var doc2= document.getElementById("doc2");
  href+= "&doc2=" + doc2.value.replace(/\n/g,"%0A").replace(/\#/g,"%35");
  
  if (doc1.value.length > 500) {
    makeError('doc1 too long (>500 characters)');
    return;
  }
  
  if (doc2.value.length > 500) {
    makeError('doc2 too long (>500 characters)');
    return;
  }
  
  if (sync) {
    var doc3= document.getElementById("doc3");
    href+= "&doc3=" + doc3.value.replace(/\n/g,"%0A").replace(/\#/g,"%35");
    
    if (doc3.value.length > 500) {
      makeError('doc3 too long (>500 characters)');
      return;
    }
  }
  
  var elems= document.getElementsByTagName("input");
  
  for(i= 0; i < elems.length; i++) {
    if (elems[i].id.indexOf("param-") == 0) {
      if (elems[i].checked) {
        href+= "&" + elems[i].id + "=true";
      } else if  ((elems[i].value == "yes") || (elems[i].value == "no")) {
        href+= "&" + elems[i].id + "=" + elems[i].value;
      }
    }
  }
  
  href+= "&ajax=yes";
  href= href.replace(/\n/g,"%0A").replace(/\#/g,"%35").replace(/\0xFEFF/g, "");
  
  // This is needed so that sandbox/examples
  href= href.replace(/\</g,"%3C").replace(/\>/g,"%3E").replace(/\"/g,"%22");
  getResponse(document.getElementById("result"), href);
}

function addKeyListener(textarea) {
  nn=(document.layers)?true:false;
  ie=(document.all)?true:false;
  var doc2= document.getElementById(textarea);
  doc2.onkeyup=keyUp;
  if(nn) doc2.captureEvents(Event.KEYUP);
}

function getResponse(target, url) {
  AjaxRequest.get(
  {
    'url':url
    ,'onSuccess':function(req){ target.innerHTML=req.responseText; }
    ,'onError':function(){ target.innerHTML= "<p>There was an unexpected error performing the comparison/synchronisation.</p>"}
  }
  );
}

//KeyPress Event Handler - Preview after Return or . or ]
function keyUp(e)
{ var evt=(e)?e:(window.event)?window.event:null;
  if(evt)
  { var key=(evt.charCode)?evt.charCode: ((evt.keyCode)?evt.keyCode:((evt.which)?evt.which:0));
    //if(key=="13" || key=="32" || key=="46" || key=="62") 
    { 
    doDeltaCompare();
    }
  }
}