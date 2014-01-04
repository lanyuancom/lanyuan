function openwinx(url,name,w,h)
{
    window.open(url,name,"top=100,left=400,width=" + w + ",height=" + h + ",toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no,status=no");
}

function Dialog(url,name,w,h)
{
	return showModalDialog(url, name, 'dialogWidth:'+w+'px; dialogHeight:'+h+'px; help: no; scroll: yes; status: no');
}

function redirect(url)
{
	if(url.lastIndexOf('/.') > 0)
	{
		url = url.replace(/\/(\.[a-zA-Z]+)([0-9]+)$/g, "/$2$1");
	}
	else if(url.match(/\/([a-z]+).html([0-9]+)$/)) {
		url = url.replace(/\/([a-z]+).html([0-9]+)$/, "/$1-$2.html");
	}
	else if(url.match(/-.html([0-9]+)$/)) {
		url = url.replace(/-.html([0-9]+)$/, "-$1.html");
	}

	if(url.indexOf('://') == -1 && url.substr(0, 1) != '/' && url.substr(0, 1) != '?') url = $('base').attr('href')+url;
	location.href = url;
}

//添加收藏夹
function myAddPanel(title,url)
{
    if ((typeof window.sidebar == 'object') && (typeof window.sidebar.addPanel == 'function'))
    {
        window.sidebar.addPanel(title,url,"");
    }
    else
    {
        window.external.AddFavorite(url,title);
    }
}
function confirmurl(url,message)
{
	if(confirm(message)) redirect(url);
}

function confirmform(form,message)
{
	if(confirm(message)) form.submit();
}

function getcookie(name)
{
    name = cookie_pre+name;
	var arg = name + "=";
	var alen = arg.length;
	var clen = document.cookie.length;
	var i = 0;
	while(i < clen)
	{
		var j = i + alen;
		if(document.cookie.substring(i, j) == arg) return getcookieval(j);
		i = document.cookie.indexOf(" ", i) + 1;
		if(i == 0) break;
	}
	return null;
}

function setcookie(name, value, days)
{
    name = cookie_pre+name;
	var argc = setcookie.arguments.length;
	var argv = setcookie.arguments;
	var secure = (argc > 5) ? argv[5] : false;
	var expire = new Date();
	if(days==null || days==0) days=1;
	expire.setTime(expire.getTime() + 3600000*24*days);
	document.cookie = name + "=" + escape(value) + ("; path=" + cookie_path) + ((cookie_domain == '') ? "" : ("; domain=" + cookie_domain)) + ((secure == true) ? "; secure" : "") + ";expires="+expire.toGMTString();
}

function delcookie(name)
{
    var exp = new Date();
	exp.setTime (exp.getTime() - 1);
	var cval = getcookie(name);
    name = cookie_pre+name;
	document.cookie = name+"="+cval+";expires="+exp.toGMTString();
}

function getcookieval(offset)
{
	var endstr = document.cookie.indexOf (";", offset);
	if(endstr == -1)
	endstr = document.cookie.length;
	return unescape(document.cookie.substring(offset, endstr));
}

function checkall(fieldid)
{
	if(fieldid==null)
	{
		if($('#checkbox').attr('checked')==false)
		{
			$('input[type=checkbox]').attr('checked',true);
		}
		else
		{
			$('input[type=checkbox]').attr('checked',false);
		}
	}
	else
	{
		var fieldids = '#'+fieldid;
		var inputfieldids = 'input[boxid='+fieldid+']';
		if($(fieldids).attr('checked')==false)
		{
			$(inputfieldids).attr('checked',true);
		}
		else
		{
			$(inputfieldids).attr('checked',false);
		}
	}
}

function checkradio(radio)
{
	var result = false;
	for(var i=0; i<radio.length; i++)
	{
		if(radio[i].checked)
		{
			result = true;
			break;
		}
	}
    return result;
}

function checkselect(select)
{
	var result = false;
	for(var i=0;i<select.length;i++)
	{
		if(select[i].selected && select[i].value!='' && select[i].value!=0)
		{
			result = true;
			break;
		}
	}
    return result;
}

var flag=false;
function setpicWH(ImgD,w,h)
{
	var image=new Image();
	image.src=ImgD.src;
	if(image.width>0 && image.height>0)
	{
		flag=true;
		if(image.width/image.height>= w/h)
		{
			if(image.width>w)
			{
				ImgD.width=w;
				ImgD.height=(image.height*w)/image.width;
				ImgD.style.display="block";
			}else{
				ImgD.width=image.width;
				ImgD.height=image.height;
				ImgD.style.display="block";
			}
		}else{
			if(image.height>h)
			{
				ImgD.height=h;
				ImgD.width=(image.width*h)/image.height;
				ImgD.style.display="block";
			}else{
				ImgD.width=image.width;
				ImgD.height=image.height;
				ImgD.style.display="block";
			}
		}
	}
}

var Browser = new Object();
Browser.isMozilla = (typeof document.implementation != 'undefined') && (typeof document.implementation.createDocument != 'undefined') && (typeof HTMLDocument!='undefined');
Browser.isIE = window.ActiveXObject ? true : false;
Browser.isFirefox = (navigator.userAgent.toLowerCase().indexOf("firefox")!=-1);
Browser.isSafari = (navigator.userAgent.toLowerCase().indexOf("safari")!=-1);
Browser.isOpera = (navigator.userAgent.toLowerCase().indexOf("opera")!=-1);

var Common = new Object();
Common.htmlEncode = function(str)
{
	return str.replace(/&/g, '&amp;').replace(/"/g, '&quot;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
}

Common.trim = function(str)
{
	return str.replace(/(^\s*)|(\s*$)/g, "");
}

Common.strlen = function (str)
{
	if(Browser.isFirefox)
	{
		Charset = document.characterSet;
	}
	else
	{
		Charset = document.charset;
	}
	if(Charset.toLowerCase() == 'utf-8')
	{
		return str.replace(/[\u4e00-\u9fa5]/g, "***").length;
	}
	else
	{
		return str.replace(/[^\x00-\xff]/g, "**").length;
	}
}

Common.isdate = function (str)
{
   var result=str.match(/^(\d{4})(-|\/)(\d{1,2})\2(\d{1,2})$/);
   if(result==null) return false;
   var d=new Date(result[1], result[3]-1, result[4]);
   return (d.getFullYear()==result[1] && d.getMonth()+1==result[3] && d.getDate()==result[4]);
}

Common.isnumber = function(val)
{
    var reg = /[\d|\.|,]+/;
    return reg.test(val);
}

Common.isalphanumber = function (str)
{
	var result=str.match(/^[a-zA-Z0-9]+$/);
	if(result==null) return false;
	return true;
}

Common.isint = function(val)
{
    var reg = /\d+/;
    return reg.test(val);
}

Common.isemail = function(email)
{
    var reg = /([\w|_|\.|\+]+)@([-|\w]+)\.([A-Za-z]{2,4})/;
    return reg.test( email );
}

Common.fixeventargs = function(e)
{
    var evt = (typeof e == "undefined") ? window.event : e;
    return evt;
}

Common.srcelement = function(e)
{
    if (typeof e == "undefined") e = window.event;
    var src = document.all ? e.srcElement : e.target;
    return src;
}

Common.isdatetime = function(val)
{
	var result=str.match(/^(\d{4})(-|\/)(\d{1,2})\2(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/);
	if(result==null) return false;
	var d= new Date(result[1], result[3]-1, result[4], result[5], result[6], result[7]);
	return (d.getFullYear()==result[1]&&(d.getMonth()+1)==result[3]&&d.getDate()==result[4]&&d.getHours()==result[5]&&d.getMinutes()==result[6]&&d.getSeconds()==result[7]);
}

var FileNum = 1;
function AddInputFile(Field)
{
    FileNum++;
	var fileTag = "<div id='file_"+FileNum+"'><input type='file' name='"+Field+"["+FileNum+"]' size='20' onchange='javascript:AddInputFile(\""+Field+"\")'> <input type='text' name='"+Field+"_description["+FileNum+"]' size='20' title='名称'> <input type='button' value='删除' name='Del' onClick='DelInputFile("+FileNum+");'></div>";
	var fileObj = document.createElement("div");
	fileObj.id = 'file_'+FileNum;
	fileObj.innerHTML = fileTag;
	document.getElementById("file_div").appendChild(fileObj);
}

function DelInputFile(FileNum)
{
    var DelObj = document.getElementById("file_"+FileNum);
    document.getElementById("file_div").removeChild(DelObj);
}

function FilePreview(Url, IsShow)
{
	Obj = document.getElementById('FilePreview');
	if(IsShow)
	{
		Obj.style.left = event.clientX+80;
		Obj.style.top = event.clientY+20;
		Obj.innerHTML = "<img src='"+Url+"'>";
		Obj.style.display = 'block';
	}
	else
	{
		Obj.style.display = 'none';
	}
}

function setEditorSize(editorID,flag)
{
	var minHeight = 400;
	var step = 150;
	var e=$('#'+editorID);
	var h =parseInt(e.height());
	if(!flag && h<minHeight)
	{
		e.height(200);
		return ;
	}
	return flag?(e.height(h+step)):(e.height(h-step));
}

function EditorSize(editorID)
{
	$('a[action]').parent('div').css({'text-align':'right'});
	$('a[action]').css({'font-size':'24px','font-weight':700,display:'block',float:'right',width:'28px','text-align':'center'});
	$('a[action]').click(function(){
		var flag= parseInt($(this).attr('action'));
		setEditorSize(editorID,flag);
	});
}

function loginCheck(form)
{
	var username = form.username;
	var password = form.password;
	var cookietime = form.cookietime;
	if(username.value == ''){alert("请输入用户名");username.focus();return false;}
	if(password.value == ''){alert("请输入密码");password.focus();return false;}
	var days = cookietime.value == 0 ? 1 : cookietime.value/86400;
	setcookie('username', username.value, days);
	return true;
}

function modal(url, triggerid, id, type)
{
	id = '#' + id;
	triggerid = '#' + triggerid;
	switch(type)
	{
		case 'ajax':
			$(id).jqm({ajax: url, modal:false, trigger: triggerid});
		break;
		default:
			$(id).jqm();
		break;
	}
	$(id).html('');
	$(id).hide();
}

function menu_selected(id)
{
	$('#menu_'+id).addClass('selected');
}

function CutPic(textid,thumbUrl){
  var thumb= $('#'+textid).val();
	if(thumb=='')
	{
		alert('请先上传标题图片');
		$('#'+textid).focus();
		return false;
	}
	else
	{
		if(thumb.indexOf('://') == -1) thumb = thumbUrl+thumb;
	}
  var arr=Dialog(phpcms_path + 'corpandresize/ui.php?'+thumb,'',700,500);
  if(arr!=null){
    $('#'+textid).val(arr);
  }
}

function is_ie()
{
	if(!$.browser.msie)
	{
		$("body").prepend('<div id="MM_msie" style="border:#FF7300 solid 1px;padding:10px;color:#FF0000">本功能只支持IE浏览器，请用IE浏览器打开。<div>');
	}
}

function select_catids()
{
	$('#addbutton').attr('disabled','');

}

function transact(update,fromfiled,tofiled)
{
	if(update=='delete')
	{
		var fieldvalue = $('#'+tofiled).val();

		$("select[@id="+tofiled+"] option").each(function()
		{
		   if($(this).val() == fieldvalue){
			$(this).remove();
		   }
		});
	}
	else
	{
		var fieldvalue = $('#'+fromfiled).val();
		var have_exists = 0;
		var len = $("select[@id="+tofiled+"] option").length;
		if(len>5)
		{
			alert('最多添加 6 项');
			return false;
		}
		$("select[@id="+tofiled+"] option").each(function()
		{
		   if($(this).val() == fieldvalue){
			have_exists = 1;
			alert('已经添加到列表中');
			return false;
		   }
		});
		if(have_exists==0)
		{
			fieldvalue = "<option value='"+fieldvalue+"'>"+fieldvalue+"</option>"
			$('#'+tofiled).append(fieldvalue);
			$('#deletebutton').attr('disabled','');
		}
		
	}
}
var set_show = false;
