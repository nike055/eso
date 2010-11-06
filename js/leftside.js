var  usualColor= "#1b68af";
var  selectedColor = "#2A7409";

function expandOrCollapse(number, id) {

   if (number==1 || number==2 || number==3) {
		var it = jQuery("#"+id);
		var next = it.next('div');
		var img = it.find('img');
		if (number==2) next = next.next('div'); 
		if (number==3) next = next.next('div'); 
		
		var prev_selected_id = $('div.div_current_item').attr('name');
		
		
		
		if (prev_selected_id!=it.attr('id')) {
			//alert(prev_selected_id +"-"+it.attr('id'));
			jQuery("#"+prev_selected_id).css('color',"#1b68af");
			$('div.div_current_item').attr('name', it.attr('id'));
			
			//alert(jQuery("#"+prev_selected_id).css('id'));
			
		}
		
		if (next.is(':visible')) {
			next.hide();
			if (number==1) {
				img.attr('src','img/leftmenu/lmenu-off-m.gif');
				it.css('background-image', 'url(img/leftmenu/lmenu-offcaps.gif)');
				it.css('background-repeat', 'repeat-x'); 
			}
			if (number==2) {
				it.css('background-image', 'url(img/leftmenu/lmenu-close.gif)');
				it.css('background-repeat', 'no-repeat'); 
			}
		} else {
			next.show();
			
			if (number==1) {
				img.attr('src','img/leftmenu/lmenu-on-m.gif');
				it.css('background-image', 'url(img/leftmenu/lmenu-oncaps.gif)');
				it.css('background-repeat', 'repeat-x'); 
				it.css('color',"#2A7409");
				//openURLByIdLevel2or3(it.attr('id'));
			}
			if (number==2) {
				//fillChildLinks(next);
				it.css('background-image', 'url(img/leftmenu/lmenu-open.gif)');
				it.css('background-repeat', 'no-repeat'); 
				openURLById(it.attr('id'));
				it.css('color',"#2A7409");
			}			
			if (number==3) {
				//fillChildLinks(next);
				openURLById(it.attr('id'));
				it.css('color',"#2A7409");
			}					
		}
	}
}
var prefix="catalog";
var postfix="rightside.xml";
function openURLById(id) {
	var it = jQuery("#"+id);
	//alert(it.css('color'));
	var next = it.next('div');
	var url = prefix+"/"+next.text()+"/"+postfix;
	//alert(url);
	top.frames['rightside-f'].location.href = url; 
	it.css('color',"#2A7409");
}

function openURLByIdLevel2or3(id) {
	var link = jQuery("#"+id).find('div');
	var url = prefix+"/"+link.text()+"/"+postfix;
	//alert(url);
	top.frames['rightside-f'].location.href = url; 
}

/*
function fillChildLinks(el) {
	var lst = el.children('div').children('div');
	alert(lst.length);
	for (i=0; i<lst.length; i=i+2) {
	  lst[i];
	}
	//if (level==1) lst.css('color', 'red');
	//if (level==2) lst.css('color', 'green');
}
*/