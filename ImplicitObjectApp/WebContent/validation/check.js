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



