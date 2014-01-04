function loginSubmit(login, uc)
{
	var username = login.elements['username'];
	var password = login.elements['password'];
	var iscomment = login.elements['iscomment'];
    if(!loginCheck(login)) return false;
	if(uc == 1) return true;
	$.post(login.action, 'action=ajax&username='+username.value+'&password='+password.value, function(data){
		if(data == 1)
		{
			//$('#logined_username').html(username.value);
			//$('#div_login').hide();
			//$('#div_logined').show();
			if (iscomment.value == 1)
			{
				redirect(document.URL);
			}
			else
			{
				redirect('/member/index.php');
			}
		}
		else
		{
			alert('登录失败');
			redirect(login.action);
		}
		username.value = password.value = '';
	});
	return false;
}

function logout(url)
{
	$.get(url+'&id='+Math.random()*5, function(data){
		if(data != 1) alert(data);
	});
	$('#div_logined').hide();
	$('#div_login').show();
}

function loginshow()
{
	var auth = getcookie('auth');
	//alert(auth);
	if(auth != null)
	{
		//alert(unescape(getcookie('username')));
		//$('#logined_username').html(unescape(getcookie('username')));
		$('#logined_username').html(getcookie('username'));
		$('#div_login').hide();
		$('#div_logined').show();
	}
	else
	{
		$('#div_logined').hide();
		$('#div_login').show();
	}
}

$(function(){
   loginshow();
});