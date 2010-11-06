if(navigator.appName != 'Netscape'){
	parent.frames[1].document.getElementById('zzk').style.width='100%';
	parent.frames[1].document.getElementById('zzk').style.height='93%';
}

function top2bot(){
	var topFrame = parent.document.getElementById('top-f');
	var botFrame = parent.document.getElementById('bot-f');
	
	topFrame.height='96%';
	botFrame.height='4%';

	parent.frames[0].document.getElementById('medium').style.display='block';
	parent.frames[0].document.getElementById('maximum').style.display='none';
	parent.frames[1].document.getElementById('medium').style.display='block';
	parent.frames[1].document.getElementById('minimum').style.display='none';
}

function bot2top(){
	var topFrame = parent.document.getElementById('top-f');
	var botFrame = parent.document.getElementById('bot-f');
	
	topFrame.height='4%';
	botFrame.height='96%';
	
	parent.frames[0].document.getElementById('medium').style.display='block';
	parent.frames[0].document.getElementById('minimum').style.display='none';
	parent.frames[1].document.getElementById('medium').style.display='block';
	parent.frames[1].document.getElementById('maximum').style.display='none';
	/* Change text DIV height */
	if(navigator.appName == 'Netscape'){
		parent.frames[1].document.getElementById('zzk').style.height='98%';
	}else{
		parent.frames[1].document.getElementById('zzk').style.height='100%';
	}
}

function bt2mid(){
	var topFrame = parent.document.getElementById('top-f');
	var botFrame = parent.document.getElementById('bot-f');
	
	topFrame.height='50%';
	botFrame.height='50%';
	
	parent.frames[0].document.getElementById('maximum').style.display='block';
	parent.frames[0].document.getElementById('minimum').style.display='block';
	parent.frames[0].document.getElementById('medium').style.display='none';
	parent.frames[1].document.getElementById('maximum').style.display='block';
	parent.frames[1].document.getElementById('minimum').style.display='block';
	parent.frames[1].document.getElementById('medium').style.display='none';
	/* Change text DIV height */
	if(navigator.appName == 'Netscape'){
		parent.frames[1].document.getElementById('zzk').style.height='50%';
	}else{
		parent.frames[1].document.getElementById('zzk').style.width='100%';
		parent.frames[1].document.getElementById('zzk').style.height='93%';
	}
}













































document.ondragstart = new Function("return false");

if (!top.sessionstorage) top.sessionstorage= [];
function s_save($param, $value) {
    return top.sessionstorage[$param]= $value;
}
function s_load($param, $value) {
    return top.sessionstorage[$param]?top.sessionstorage[$param]:$value;
}
function s_test($param, $value) {
    return top.sessionstorage[$param]==$value;
}

window.onload = function() {

    var doc = top.frames('leftside-f').document;
    var ass = doc.getElementsByTagName('A');
    //alert(window.parent.document.location.href);
    for (var i = 0; i < ass.length; i++) {
        var win = window;
        if (document.location.href != ass[i]) {
            if (window.parent.document.location.href != ass[i]) continue;
            else var win = window.parent;
        }

        var lastel = doc.getElementById('selected');
        if (lastel) {
            lastel.id = '';
        }
        ass[i].id = 'selected';
        var it = ass[i];


        //	var thisCookie = getCookie('search-word');
        /////sd edit offff!!!!!!
        //	if(!thisCookie )

        while (it = it.parentNode) {
            if (it.className) {
                it.className = it.className.replace(/\boff\b/, "on");
                if (it.className.search(/\bonlyone\b/) != -1) {
                    var e = it;
                    while (e = e.nextSibling) {
                        if (e.className) e.className = e.className.replace(/\bon\b/, "off");
                    }
                    var e = it;
                    while (e = e.previousSibling) {
                        if (e.className) e.className = e.className.replace(/\bon\b/, "off");

                    }
                };
            };
        };

        named = ass[i].innerText;

        var currentTitle = named;

        var cp = ass[i];

        if (cp.parentNode) cp = cp.parentNode;
        if (cp.parentNode) cp = cp.parentNode;
        while ((cp = cp.parentNode) && (cp = cp.parentNode)) {
            var bak = cp.firstChild;
            if (bak.className.search(/\bbaken\b/) != -1) named = bak.firstChild.innerText + '/ ' + named;
            /*var el= bak.firstChild;*/
            /*if (el.href)*//* named= el.innerText+'/ '+named;*/
        }
        /*named= named.substr(0,named.length-2);*/
        /*fr= win.frames('top-f').content;
        if (fr) fr.document.getElementById('fzag').innerText= named+"\n";*/

        if (win.frames.length == 0) return false;

        fr = win.frames('bot-f').content;
        if (fr) fr.document.getElementById('fzag').innerText = named + "\n";

        topFrame = win.frames('top-f').content;

        var titles = new Array();
        titles['raduga'] = 'Система "Радуга"';
        titles['baksan'] = 'Система "Баксан"';
        titles['zaisan'] = 'Система "Зайсан"';
        titles['zshemchug'] = 'Система "Жемчуг"';
        titles['etna'] = 'Система "Этна"';
        titles['cotan'] = 'Система "Котангенс"';

        currentPath = '';

        if (lastel && lastel.getAttribute('href')) {
            // Leonid Malyutin: в IE6 lastel.getAttribute('href') возвращает
            // полный путь, в EI7 и IE8 установленный.
            var href001 = lastel.getAttribute('href');
            var paths = href001.split('/');

            if (href001.indexOf('/') == 0) {
                if (paths[3] == 'fauna') {
                    currentPath = paths[4];
                } else {
                    currentPath = paths[3];
                }
            }
            else {
                if (paths[6] == 'fauna') {
                    currentPath = paths[7];
                } else {
                    currentPath = paths[6];
                }
            }

            if (fr && topFrame.document.getElementById('current-system-title')) {
                topFrame.document.getElementById('current-system-title').innerHTML = titles[currentPath] + "\n";
            }
        }

    }

}
/*
document.onclick= function(e) {

	var s= e?e.target:(event?event.srcElement:"");
	if ((e?e:event).button>0) return;

	var obj = event.srcElement;

	if(obj.nodeName=='A'){
		alert(obj.getAttribute('href'));
	}
	return true;
}

*/

function swapClass (el,cl1,cl2) {
	var cname= el.className
    if (cname) {
        el.className= cname.replace (RegExp('\\b'+cl1+'\\b'),cl2);
        if (el.className!=cname) return true;
        el.className= cname.replace (RegExp('\\b'+cl2+'\\b'),cl1);
        if (el.className!=cname) return true;
    }
    return false;
}

function rightSideOnLoad(){

	var loc = (window.parent.document.location).toString();
	var paths = loc.split('/');
	var leftFrame = window.parent.parent.frames('leftside-f');

	var currentPath = '';
	if(paths[6]=='fauna'){
		currentPath = paths[7];
	}else{
		currentPath = paths[6];
	}


	var thisCookie = getCookie('search-word');

	if(thisCookie && thisCookie!=''){

		function caseInsCmp(str1, str2){
			return str1.toLowerCase() == str2.toLowerCase();
		}

		if(!caseInsCmp(thisCookie, 'a') 
			&& !caseInsCmp(thisCookie, 'alt') 
			&& !caseInsCmp(thisCookie, 'src') 
			&& !caseInsCmp(thisCookie, 'span')
			&& !caseInsCmp(thisCookie, 'b')
			&& !caseInsCmp(thisCookie, 'body')
			&& !caseInsCmp(thisCookie, 'i')
			&& !caseInsCmp(thisCookie, 'div')
			&& !caseInsCmp(thisCookie, 'li')
			&& !caseInsCmp(thisCookie, 'ul')
			&& !caseInsCmp(thisCookie, 'href')
			){
			var sw = RegExp(thisCookie, "gi");
			document.body.innerHTML = document.body.innerHTML.replace(sw, '<span class="swordhl">'+thisCookie+'</span>');
		
		}

		setCookie('search-word', '');
	}

	if(thisCookie && thisCookie!=''){

//flip start

//		leftFrame.document.setCurrentCat(currentPath, true);
		leftFrame.document.setCurrentCat(currentPath, true);

//hide start
		var currentInClasses = leftFrame.document.getElementsByClass('li-'+currentPath);
		for(var i=0;i<=currentInClasses.length-1;i++){
			currentInClasses[i].style.display = 'block';
		}
//hide end


	var href = loc;

//flip end
	}



	var locStr='';
	var fullStr = '';

	for(var i=4;i<=paths.length-2;i++){
		locStr+='/'+paths[i];
	}
	for(var i=0;i<=paths.length-1;i++){
		fullStr+='/'+paths[i];
	}
	
	var nodesArray = new Array();
	var nodes = leftFrame.document.getElementsByTagName('A');

	for(var i=0;i<=nodes.length-1;i++){
		var node = nodes[i];
		if(node.nodeName=='A'){
			var href = node.getAttribute('href');
			if(href.substr(10,locStr.length)==locStr){
				nodesArray.push(node);
			}
		}
	}

    // после обработки не находит элементов, связанные с папкой sostav
	if (nodesArray.length > 0) {
	    var needleTabHrefArr = nodesArray[0].getAttribute('href').split('/');
	    var needleTabHref = needleTabHrefArr[5];

	    var needleHref = '';

	    for (var i = 4; i <= needleTabHrefArr.length - 2; i++) {
	        needleHref += '/' + needleTabHrefArr[i];
	    }

	    needleHref = '/' + needleHref.substr(1, needleHref.length - 1);

	    for (var i = 0; i <= nodes.length - 1; i++) {
	        var node = nodes[i];
	        if (node.nodeName == 'A') {
	            var href = node.getAttribute('href');

	            if (href.substr(10, needleHref.length) == needleHref) {
	                var thisNode = node;

	                while (thisNode.nodeName != 'TR') {
	                    thisNode = thisNode.parentNode;
	                }

	                if (thisNode.className.replace('off') != thisNode.className) {
	                    leftFrame.document.getElementById('selected').id = '';

	                    var currentOpenEls = leftFrame.document.getElementsByClass('on');
	                    for (var i = 0; i <= currentOpenEls.length - 1; i++) {
	                        if (currentOpenEls[i].nodeName == 'TR') {
	                            swapClass(currentOpenEls[i], 'on', 'off');
	                        }
	                    }

	                    node.id = 'selected';

	                    if (node.parentNode.parentNode.parentNode.parentNode.className == 'off') {
	                        node.parentNode.parentNode.parentNode.parentNode.className = 'on';
	                    }

	                    swapClass(thisNode, 'off', 'on');
	                }
	            }
	        }
	    }
	}

	//PS 15/03/2010
        highlightAnchor();
	setRightFrameTitle();
}

function getCookie(name){
	var cookie = " " + window.parent.parent.document.cookie;
	var search = " " + name + "=";
	var setStr = null;
	var offset = 0;
	var end = 0;
	if (cookie.length > 0) {
		offset = cookie.indexOf(search);
		if (offset != -1) {
			offset += search.length;
			end = cookie.indexOf(";", offset)
			if (end == -1) {
				end = cookie.length;
			}
			setStr = unescape(cookie.substring(offset, end));
		}
	}
	return(setStr);
}

function setCookie(name, value, expires, path, domain, secure) {
      window.parent.parent.document.cookie = name + "=" + escape(value) +
        ((expires) ? "; expires=" + expires : "") +
        ((path) ? "; path=" + path : "") +
        ((domain) ? "; domain=" + domain : "") +
        ((secure) ? "; secure" : "");
}

function isClass (el, cl) {return el.className && el.className.search(RegExp('\\b'+cl+'\\b'))!=-1;}

function replaceClass (el,cl1,cl2) {
	var cname= el.className;
    if (cname) {
        el.className= cname.replace (RegExp('\\b'+cl1+'\\b'),cl2);
    }
    return el.className!=cname;
}


var doc = document;

//goes to the url specified at choosen radio buton
//PS 01/03/2010
function GoRadio()
{
	var els = document.getElementsByTagName("INPUT");
	var val = "";
	for(i=0;i<els.length;i++)
	{
		if (els[i].type=="radio" && els[i].name=='anchor_radio' && els[i].checked)
			val = els[i].value;
	}
	if (val!="")
	{	
		pos = val.indexOf('#');
		url = val;
		if (pos!=-1)
		{
			//IE8 loose #? so, we'll add param anchor
			id = val.substring(pos+1);
			url = val.substring(0,pos);
			if (url=="") url="../descr.xml";
			url = url+'?anchor='+id+'#'+id;
		}

		doc.location.href=url;
	}
	else
		alert("Ничего не выбрано!");
}



function GoRadioLevel1()
{
	var els = document.getElementsByTagName("INPUT");
	var val = "";
	for(i=0;i<els.length;i++)
	{
		if (els[i].type=="radio" && els[i].name=='level1' && els[i].checked)
			val = els[i].value;
	}

	if (val!="")
	{
		ShowRadioGroup(val);
		document.getElementById('radio_level2').style.display='';
		document.getElementById('radio_level1').style.display='none';
	}
	else
		alert("Ничего не выбрано!");
}

function ResetRadioLevel1()
{
	var els = document.getElementsByTagName("INPUT");
	for(i=0;i<els.length;i++)
	{
		if (els[i].type=="radio" && els[i].name=='level1')
			 els[i].checked=false;
	}
}

function ResetRadioLevel2()
{
	var els = document.getElementById('radio_level2').getElementsByTagName("INPUT");
	for(i=0;i<els.length;i++)
		if (els[i].type=="radio")
			 els[i].checked=false;

	document.getElementById('radio_level1').style.display='';
	document.getElementById('radio_level2').style.display='none';
}

function getUrlParam(url,name)
{
  name = name.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
  var regexS = "[\\?&]"+name+"=([^&#]*)";
  var regex = new RegExp( regexS );
  var results = regex.exec(url);
  if( results == null )
    return "";
  else
    return results[1];
}

//finds all anchors regarding the url target and highlights container
//PS 14/03/2010
function highlightAnchor()
{
	var urlstr = doc.location.href;
	var id = getUrlParam(urlstr,"anchor"); //IE8
	if (id=="") //IE6!
	{
		var pos = urlstr.indexOf('#');
		if (pos!=-1)
			id = urlstr.substring(pos+1);
	}
	if (id=="") return;

	var els = document.getElementsByTagName("A");
	for(i=0;i<els.length;i++)
	{
		if (els[i].name==id && els[i].href=="")
		{
			hightlightRow(els[i]);
			return;
		}
	}
	
}


//highlights first TR parent of element //takes in account rowspan
//PS 15/03/2010
function hightlightRow(el)
{
	while (el!=null)
	{
		if (el.tagName!="TR")
		{
			el = el.parentNode;
			continue;
		}
		break;
        }
	if (el==null) return;
	var row = el;
       	var rowSpan=row.cells[0].rowSpan;
       	for(i=0;i<rowSpan;i++)
       	{
       		//row.className="highlight";
		row.style.backgroundColor="yellow";
       		if (row.nextSibling!=null && row.nextSibling.nodeName=="TR");
       			row = row.nextSibling;
       	}
}

//show/hide group
var radiogroupshow="";
function ShowRadioGroup(id)
{
	if (radiogroupshow!="")
		document.getElementById(radiogroupshow).style.display='none';
	if (id!="")
		document.getElementById(id).style.display='';
	radiogroupshow=id;
}


function setRightFrameTitle()
{
    var doc = top.frames('leftside-f').document;
    var ass = doc.getElementsByTagName('A');
    for (var i = 0; i < ass.length; i++) {
        var win = window;
        if (document.location.href != ass[i]) {
            if (window.parent.document.location.href != ass[i]) continue;
            else var win = window.parent;
        }

        var lastel = doc.getElementById('selected');
        if (lastel) {
            lastel.id = '';
        }
        ass[i].id = 'selected';
        named = ass[i].innerText;
        var currentTitle = named;
        var cp = ass[i];

        if (cp.parentNode) cp = cp.parentNode;
        if (cp.parentNode) cp = cp.parentNode;
        while ((cp = cp.parentNode) && (cp = cp.parentNode)) {
            var bak = cp.firstChild;
            if (bak.className.search(/\bbaken\b/) != -1) named = bak.firstChild.innerText + '/ ' + named;
        }
        if (win.frames.length == 0) return false;
        fr = win.frames('bot-f').content;
        if (fr) fr.document.getElementById('fzag').innerText = named + "\n";
    }
}
