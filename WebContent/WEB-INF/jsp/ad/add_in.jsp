<html>
<head>
<%@ include file="/WEB-INF/jsp/header.jsp"%>
<%@ page contentType="text/html; charset=utf-8"%>
<title></title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<link href="${pageContext.request.contextPath}/css/layout.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function add_(){
	if(strTrim($('#batchId').val()) =="") {
		alert("批次号不能为空！");
		return;
	}
// 	if(strTrim($('#language').val()) =="") {
// 		alert("语种不能为空！");
// 		return;
// 	}
// 	if(strTrim($('#appType').val()) =="") {
// 		alert("应用类型不能为空！");
// 		return;
// 	}
	if(strTrim($('#day').val()) =="") {
		alert("激活天数不能为空！");
		return;
	}
	if(strTrim($('#day').val())>300 || strTrim($('#day').val()) <0) {
		alert("激活天数范围在0~300！");
		return;
	}
	if(strTrim($('#switch').val()) =="") {
		alert("开关状态不能为空！");
		return;
	}
	ajaxPost('${pageContext.request.contextPath}/ad/add_in.htm',backAdd_);
}
function backAdd_(data){
	if(data[0]['info']=='ok'){
		alert('添加成功！');
		parent.queryData();
		parent.closeMyPop();
	} else if(data[0]['info']=='exist'){
		alert('批次号重复！');
	} else {
		alert('添加失败！');
	}
}

	function selectGroup(checkbox,obj) { 
		$('input[name='+obj+']').attr('checked', $(checkbox).attr('checked')); 
	} 

</script>
</head>

<body>
<div class="main">
	<div class="nav">添加广告配置</div>
	<div class="selectthings">
		<table style="text-align: center;">
			<tr class="odd2" id="tr_name_0">
				<td width="35%">
	     	    	批次号：
	     		</td>
	     		<td width="45%"align="left">
     				<select name="batchId" id="batchId">
     					<option value=""></option>
     					<c:forEach items="${batchList}" var="batch">
     						<option value="${batch.batchId}">${batch.batchId}--${batch.name}</option>
     					</c:forEach>
     				</select>
	     		</td>
			</tr>
			<tr class="odd2" >
				<td width="35%">
	     	    	语种：
	     		</td>
	     		<td width="45%" align="left">
<!-- 	     			<select name="language" id="language"> -->
<!-- 	     				<option value=""></option> -->
<!-- 	     				<option value="en">英语</option> -->
<!-- 	     				<option value="ar">阿拉伯语</option> -->
<!-- 	     				<option value="es">西班牙语</option> -->
<!-- 	     				<option value="id">印尼语</option> -->
<!-- 	     				<option value="de">德语</option> -->
<!-- 	     				<option value="it">意大利语</option> -->
<!-- 	     				<option value="fa">波斯语</option> -->
<!-- 	     				<option value="pt">葡萄牙语</option> -->
<!-- 	     				<option value="ru">俄语</option> -->
<!-- 	     			</select> -->
					<table>
						<tr>
						<td class="odd2" colspan="5">
		     			<input type="checkbox" name="all" id="all" onclick="javascript:selectGroup('#all','language')"/><label for="all">全选</label><br/>
		     			</td>
		     			<tr class="odd2">
		     			<td><input type="checkbox" name="language" id="language_en" value="en"/><label for="language_en">英语</label></td>
		     			<td><input type="checkbox" name="language" id="language_ar" value="ar"/><label for="language_ar">阿拉伯语</label></td>
		     			<td><input type="checkbox" name="language" id="language_es" value="es"/><label for="language_es">西班牙语</label></td>
		     			<td><input type="checkbox" name="language" id="language_id" value="id"/><label for="language_id">印尼语</label></td>
		     			<td><input type="checkbox" name="language" id="language_de" value="de"/><label for="language_de">德语</label>
		     			</td></tr>
		     			<tr class="odd2"><td>
		     			<input type="checkbox" name="language" id="language_it" value="it"/><label for="language_it">意大利语</label></td>
		     			<td><input type="checkbox" name="language" id="language_fa" value="fa"/><label for="language_fa">波斯语</label></td>
		     			<td><input type="checkbox" name="language" id="language_pt" value="pt"/><label for="language_pt">葡萄牙语</label></td>
		     			<td><input type="checkbox" name="language" id="language_ru" value="ru"/><label for="language_ru">俄语</label></td>
		     			<td>
		     			</td></tr>
	     			</table>
	     		</td>
			</tr>
			<tr class="odd2" id="tr_name_0">
				<td width="35%">
	     	    	应用类型：
	     		</td>
	     		<td width="45%" align="left">
<!-- 	     			<select name="appType" id="appType"> -->
<!-- 	     				<option value=""></option> -->
<!-- 	     				<option value="1">AppStore</option> -->
<!-- 	     				<option value="2">GameCenter</option> -->
<!-- 	     				<option value="3">三星市场</option> -->
<!-- 	     			</select> -->
					<table>
						<tr class="odd2">
						<td class="odd2" colspan="3">
		     			<input type="checkbox" name="appType_all" id="appType_all" onclick="javascript:selectGroup('#appType_all','appType')"/><label for="appType_all">全选</label><br/>
		     			</td>
		     			<tr class="odd2">
		     			<td><input type="checkbox" name="appType" id="appType_1" value="1"/><label for="appType_1">AppStore</label></td>
		     			<td><input type="checkbox" name="appType" id="appType_2" value="2"/><label for="appType_2">GameCenter</label></td>
		     			<td><input type="checkbox" name="appType" id="appType_3" value="3"/><label for="appType_3">三星市场</label></td>
		     			</tr>
	     			</table>
	     		</td>
			</tr>
			<tr class="odd2" id="tr_name_0">
				<td width="35%">
	     	    	激活天数：
	     		</td>
	     		<td width="45%" align="left">
	     			<input type="text" name="day" id="day" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"  value="30" style="width:300px"/>
	     		</td>
			</tr>
			<tr class="odd2" id="tr_name_0">
				<td width="35%">
	     	    	开关状态：
	     		</td>
	     		<td width="45%" align="left">
	     			<select name="switch" id="switch">
	     				<option value=""></option>
	     				<option value="0">关闭</option>
	     				<option value="1">开启</option>
	     			</select>
	     		</td>
			</tr>
			
			<tr class="even">
		        <td colspan="3" align="center">
		        	<input type="button" value="确     定" onclick="add_()" class="btn"/>&nbsp;&nbsp;&nbsp;&nbsp;
		        	<input type="button" value="关     闭" onclick="parent.closeMyPop();" class="btn"/>
		 		</td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>