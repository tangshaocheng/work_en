<html>
<head>
<%@ include file="/WEB-INF/jsp/header.jsp"%>
<%@ page contentType="text/html; charset=utf-8"%>
<title></title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<link href="${pageContext.request.contextPath}/css/layout.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function add_(){
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
	ajaxPost('${pageContext.request.contextPath}/ad/up_in.htm',backAdd_);
}
function backAdd_(data){
	if(data[0]['info']=='ok'){
		alert('修改成功！');
		parent.queryData();
		parent.closeMyPop();
	} else if(data[0]['info']=='exist'){
		alert('批次号重复！');
	} else {
		alert('修改失败！');
	}
}
function selectGroup(checkbox,obj) { 
	$('input[name='+obj+']').attr('checked', $(checkbox).attr('checked')); 
} 

</script>
</head>

<body>
<div class="main">
	<div class="nav">修改广告配置</div>
	<div class="selectthings">
	<input type="hidden" value="${adConf.batchId}" name="bb" id="bb">
		<table style="text-align: center;">
			
			<tr class="odd2" id="tr_name_0">
				<td width="35%">
	     	    	批次号：
	     		</td>
	     		<td width="45%"align="left">
     				<select name="batchId" disabled="disabled">
     					<option value="" ${adConf.batchId==''?'selected':''}></option>
     					<c:forEach items="${batchList}" var="batch">
     						<option value="${batch.batchId}" ${batch.batchId==adConf.batchId?'selected':''}>${batch.batchId}--${batch.name}</option>
     					</c:forEach>
     				</select>
	     		</td>
			</tr>
			<tr class="odd2" >
				<td width="35%">
	     	    	语种：
	     		</td>
	     		<td width="45%" align="left">
<!-- 	     			<select name="language" disabled="disabled"> -->
<%-- 	     				<option value="" ${adConf.language==''?'selected':''}></option> --%>
<%-- 	     				<option value="en" ${adConf.language=='en'?'selected':''}>英语</option> --%>
<%-- 	     				<option value="ar" ${adConf.language=='ar'?'selected':''}>阿拉伯语</option> --%>
<%-- 	     				<option value="es" ${adConf.language=='es'?'selected':''}>西班牙语</option> --%>
<%-- 	     				<option value="id" ${adConf.language=='id'?'selected':''}>印尼语</option> --%>
<%-- 	     				<option value="de" ${adConf.language=='de'?'selected':''}>德语</option> --%>
<%-- 	     				<option value="it" ${adConf.language=='it'?'selected':''}>意大利语</option> --%>
<%-- 	     				<option value="fa" ${adConf.language=='fa'?'selected':''}>波斯语</option> --%>
<%-- 	     				<option value="pt" ${adConf.language=='pt'?'selected':''}>葡萄牙语</option> --%>
<%-- 	     				<option value="ru" ${adConf.language=='ru'?'selected':''}>俄语</option> --%>
<!-- 	     			</select> -->

					<table>
						<tr>
						<td class="odd2" colspan="5">
		     			<input type="checkbox" name="all" id="all" onclick="javascript:selectGroup('#all','language')"/><label for="all">全选</label><br/>
		     			</td>
		     			<tr class="odd2">
		     			
		     			<td><input type="checkbox" name="language" id="language_en" value="en" <c:forEach items="${bbList}" var="bbList"><c:if test="${bbList.language eq 'en'}">checked</c:if></c:forEach> /><label for="language_en">英语</label></td>
		     			<td><input type="checkbox" name="language" id="language_ar" value="ar" <c:forEach items="${bbList}" var="bbList"><c:if test="${bbList.language eq 'ar'}">checked</c:if></c:forEach> /><label for="language_ar">阿拉伯语</label></td>
		     			<td><input type="checkbox" name="language" id="language_es" value="es" <c:forEach items="${bbList}" var="bbList"><c:if test="${bbList.language eq 'es'}">checked</c:if></c:forEach> /><label for="language_es">西班牙语</label></td>
		     			<td><input type="checkbox" name="language" id="language_id" value="id" <c:forEach items="${bbList}" var="bbList"><c:if test="${bbList.language eq 'id'}">checked</c:if></c:forEach> /><label for="language_id">印尼语</label></td>
		     			<td><input type="checkbox" name="language" id="language_de" value="de" <c:forEach items="${bbList}" var="bbList"><c:if test="${bbList.language eq 'de'}">checked</c:if></c:forEach> /><label for="language_de">德语</label>
		     			</td></tr>
		     			<tr class="odd2"><td>
		     			<input type="checkbox" name="language" id="language_it" value="it" <c:forEach items="${bbList}" var="bbList"><c:if test="${bbList.language eq 'it'}">checked</c:if></c:forEach> /><label for="language_it">意大利语</label></td>
		     			<td><input type="checkbox" name="language" id="language_fa" value="fa" <c:forEach items="${bbList}" var="bbList"><c:if test="${bbList.language eq 'fa'}">checked</c:if></c:forEach> /><label for="language_fa">波斯语</label></td>
		     			<td><input type="checkbox" name="language" id="language_pt" value="pt" <c:forEach items="${bbList}" var="bbList"><c:if test="${bbList.language eq 'pt'}">checked</c:if></c:forEach> /><label for="language_pt">葡萄牙语</label></td>
		     			<td><input type="checkbox" name="language" id="language_ru" value="ru" <c:forEach items="${bbList}" var="bbList"><c:if test="${bbList.language eq 'ru'}">checked</c:if></c:forEach> /><label for="language_ru">俄语</label></td>
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
<!-- 	     			<select name="appType" disabled="disabled"> -->
<%-- 	     				<option value="" ${adConf.appType==''?'selected':''}></option> --%>
<%-- 	     				<option value="1" ${adConf.appType==1?'selected':''}>AppStore</option> --%>
<%-- 	     				<option value="2" ${adConf.appType==2?'selected':''}>GameCenter</option> --%>
<%-- 	     				<option value="3" ${adConf.appType==3?'selected':''}>三星市场</option> --%>
<!-- 	     			</select> -->
					<table>
						<tr class="odd2">
						<td class="odd2" colspan="3">
		     			<input type="checkbox" name="appType_all" id="appType_all" onclick="javascript:selectGroup('#appType_all','appType')"/><label for="appType_all">全选</label><br/>
		     			</td>
		     			<tr class="odd2">
		     			<td><input type="checkbox" name="appType" id="appType_1" value="1" <c:forEach items="${aaList}" var="aaList"><c:if test="${aaList.appType eq '1'}">checked</c:if></c:forEach> /><label for="appType_1">AppStore</label></td>
		     			<td><input type="checkbox" name="appType" id="appType_2" value="2" <c:forEach items="${aaList}" var="aaList"><c:if test="${aaList.appType eq '2'}">checked</c:if></c:forEach> /><label for="appType_2">GameCenter</label></td>
		     			<td><input type="checkbox" name="appType" id="appType_3" value="3" <c:forEach items="${aaList}" var="aaList"><c:if test="${aaList.appType eq '3'}">checked</c:if></c:forEach> /><label for="appType_3">三星市场</label></td>
		     			</tr>
	     			</table>
	     		</td>
			</tr>
			<tr class="odd2" id="tr_name_0">
				<td width="35%">
	     	    	激活天数：
	     		</td>
	     		<td width="45%" align="left">
	     			<input type="text" name="day" id="day" value="${adConf.day}" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"  style="width:300px"/>
	     		</td>
			</tr>
			<tr class="odd2" id="tr_name_0">
				<td width="35%">
	     	    	开关状态：
	     		</td>
	     		<td width="45%" align="left">
	     			<select name="switch" id="switch">
	     				<option value="" ${adConf.switch_==''?'selected':''}></option>
	     				<option value="0" ${adConf.switch_=='0'?'selected':''}>关闭</option>
	     				<option value="1" ${adConf.switch_=='1'?'selected':''}>开启</option>
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