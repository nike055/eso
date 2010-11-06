document.ondragstart = new Function("return false");

function $(id) {return document.getElementById(id);}

document.onclick= function(e)
{
	var s= (e)?e.target:(event)?event.srcElement:"";
	if ((e?e:event).button>0) return;
	while (s)
	{
		if (s.className&&s.className.search(/\bbaken\b/)!=-1)
		{
			s= s.parentNode;
			while (s)
			{
				if (!s.className)
				{
					s= s.parentNode;
					continue;
				}
				var t= s.className.replace(/\boff\b/,"on");
				if (t==s.className) {t= s.className.replace(/\bon\b/,"off"); opened=false;}
				else 
				{
					if ($('txtSearch')) setTimeout("$('txtSearch').focus()");
				};
				if (t==s.className)
				{
					s= s.parentNode;
					continue;
				}
				s.className= t;
				if (/*true||opened*/s.className.search(/\bonlyone\b/)!=-1)
				{
					var e=s;
					while (e=e.nextSibling)
					{
						if (e.className) e.className= e.className.replace(/\bon\b/,"off");
					}
					var e=s;
					while (e=e.previousSibling)
					{
						if (e.className) e.className= e.className.replace(/\bon\b/,"off");
					}
				}
				break;
				//alert(t);
			}
			break;
		}
		s= s.parentNode;
	}
}

function popupabout (el)
{
	var width= 400;
	var height= 300;
	var left= (screen.width-width)/2;
	var top= (screen.height-height)/2;
	window.showModalDialog('/about.html','about','width='+width+',height='+height+',left='+left+',top='+top+',resizable=no,scrollbars=no,toolbar=no,location=no,directories=no,status=no,statusbar=no,menubar=no,copyhistory=no,modal=yes');
	return false;
}