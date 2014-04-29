// check.js�� ����
/*
	�ΰ� ���� �˻�
	obj : document.form��ü.inputType
	name : �޽���
*/
function isNull(obj, msg){
	if(obj.value == ""){
		alert(msg);
		obj.focus();
		return true;
	}
	else{
		return false;
	}
}

/*
	���̵� �˻�
	����, ����, _�� ����ϴ� ���� �˻�
*/

function isId(obj){
	var data = obj.value;
	
	if(data.length == 0)
		return false;
		
	data = data.toUpperCase();
	
	for(var i=0; i<data.length; i++){
		if(!((data.charAt(i)>="A" && data.charAt(i)<="Z")||
			(data.charAt(i)>="0" && data.charAt(i) <="9")||
			data.charAt(i) == "_")){
			return false;
		}
	}
	
	return true;
}

/*
	�̸��� �˻�
	@, .�� �ִ��� �˻�
*/
function isEmail(obj){
	var data = obj.value;
	
	if(data == "")
		return false;
		
	var i = data.indexOf("@");
	if(i < 0){
		return false;
	}
	
	var i = data.indexOf(".");
	if(i < 0){
		return false;
	}
	
	return true;
}

/*
	�н������ �н����� Ȯ�� �˻�
*/
function isSame(obj1, obj2){
	var val1 = obj1.value;
	var val2 = obj2.value;
	
	if(val1.length == 0 || val2.length == 0)
		return false;
		
	if(val1 == val2)
		return true;
		
	return false;
}











