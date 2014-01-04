<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/js/jquery-1.4.min.js"></script>

<!-- 创建兼容 IE/FireFox 的 event 及 event 的 srcElement、fromElement、toElement 属性 -->

<script type="text/javascript">
    if (window.addEventListener) {
        FixPrototypeForGecko();
    }
    function FixPrototypeForGecko() {
        HTMLElement.prototype.__defineGetter__("runtimeStyle", element_prototype_get_runtimeStyle);
        window.constructor.prototype.__defineGetter__("event", window_prototype_get_event);
        Event.prototype.__defineGetter__("srcElement", event_prototype_get_srcElement);
        Event.prototype.__defineGetter__("fromElement", element_prototype_get_fromElement);
        Event.prototype.__defineGetter__("toElement", element_prototype_get_toElement);
    }
    function element_prototype_get_runtimeStyle() {
        return this.style;
    }
    function window_prototype_get_event() {
        return SearchEvent();
    }
    function event_prototype_get_srcElement() {
        return this.target;
    }
    function element_prototype_get_fromElement() {
        var node;
        if (this.type == "mouseover") node = this.relatedTarget;
        else if (this.type == "mouseout") node = this.target;
        if (!node) return;
        while (node.nodeType != 1) node = node.parentNode;
        return node;
    }
    function element_prototype_get_toElement() {
        var node;
        if (this.type == "mouseout") node = this.relatedTarget;
        else if (this.type == "mouseover") node = this.target;
        if (!node) return;
        while (node.nodeType != 1) node = node.parentNode;
        return node;
    }
    function SearchEvent() {
        if (document.all) return window.event;
        func = SearchEvent.caller;
        while (func != null) {
            var arg0 = func.arguments[0];
            if (arg0 instanceof Event) {
                return arg0;
            }
            func = func.caller;
        }
        return null;
    }
var  highlightcolor='#c1ebff';
var  clickcolor='#51b2f6';
function  changeto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=highlightcolor&&source.id!="nc"&&cs[1].style.backgroundColor!=clickcolor)
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=highlightcolor;
}
}

function  changeback(){
if  (event.fromElement.contains(event.toElement)||source.contains(event.toElement)||source.id=="nc")
return
if  (event.toElement!=source&&cs[1].style.backgroundColor!=clickcolor)
//source.style.backgroundColor=originalcolor
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}

function  clickto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=clickcolor&&source.id!="nc")
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=clickcolor;
}
else
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}
function pageNow(pageNow){
	 var fy=$("#fenye").serialize(); //对表彰数据进行序列化
	 var f=$("#fenye").attr("action");//获取表单action的属性值
	 var pCount = parseInt("${pageView.pageCount}");
	if(pageNow < 1){
			alert(" 不 好 意 思 ， 已 经 是 第 一 页 啦  ！");
			return false ;
		}else if(pCount < pageNow){
		alert(" 没 有 下 一 页 啦 ！");
		return false ;
	}else{
			window.location.href=f+"?pageNow="+pageNow+"&"+fy;
		};
}
//<!--		################# 全选	    取消全选      -->
		function selectAllCheckBox()
			{
				var chose;
				if(document.getElementById("chose").checked){
					chose = document.getElementById("chose").checked;
				}
				if(document.getElementById("choseAll").checked){
					chose = document.getElementById("choseAll").checked;
				}
				var checkboxArray = document.getElementsByName("check");
				if(checkboxArray != null)
				{
					for(var i = 0; i < checkboxArray.length; i++)
					{
						checkboxArray[i].checked = chose;
					};
				};
			}

//点击删除时是否有勾选
function result()
	{
		var checks = document.getElementsByName("check");
		
		for(var i = 0; i < checks.length; i++)
		{
			if(checks[i].checked == true)
			{
				return false;
			};
		};
		
	}
function deleteAll(){
	var f=$("#fenye").attr("action");//获取表单action的属性值
	f=f.substring(0,f.lastIndexOf("/")+1);
		if(result() != false)
		{
			alert(" 请 选 择 你 要 删 除 的 项 ！");
		}else
		{
			if(window.confirm(" 你 确  定 要 全 部 删 除 吗 ！删 除 后 不 可 恢 复 !"))
			{ 
			    document.fenye.action = f+"deleteAll.html";
		 		document.fenye.submit();
			};
		};

	}
	function deleteId(url){
		if(window.confirm(" 你 确  定 要 删 除 吗 ！删 除 后 不 可 恢 复 !"))
		{ 
		    window.location.href=url;
		};
	}
//针对重置按钮失效，清空查询条件
function clearText(){
	var input = document.getElementsByTagName("input");
	for(var i=0;i<input.length;i++){
		if(input[i].type=="text" || input[i].type=="password"){
			input[i].value="";
		}
	}
}
</script>
