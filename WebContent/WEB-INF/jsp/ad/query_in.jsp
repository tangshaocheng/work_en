<html>
<head>
<%@ include file="/WEB-INF/jsp/header.jsp"%>
<%@ page contentType="text/html; charset=utf-8"%>
<title></title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<link href="${pageContext.request.contextPath}/css/layout.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
var currentPageNum = 0;
function ajaxQuery(){
	ajaxPost('${pageContext.request.contextPath}/ad/query_in.htm',backQuery);
}
function backQuery(data){
  var html='';
  $('#resultData').html('');
  var result=data[0]['resultList'];
  currentPageNum = data[0]['currentPageNum'];
  for(var i=0;i<result.length;i++){
	 var single = result[i];
	 var operation='';
	 operation+="[<a href='javascript:switch_("+single['id']+","+single['switch_']+")'>"+(single['switch_']=='0'?'点击开启':'点击关闭')+"</a>]&nbsp;&nbsp;";
	 operation+="[<a href='javascript:up_("+single['id']+")'>修改</a>]&nbsp;&nbsp;";
// 	 operation+="[<a href='javascript:del_("+single['id']+")'>删除</a>]";
	 i%2==0?html+="<tr class='even'>":html+="<tr class='odd2'>";
// 	 html+='<td>'+single['id']+'</td>';
     html+='<td>'+single['batchId']+'</td>';
//      html+='<td>'+$("select[name='language'] option[value='"+single['language']+"']").text()+'</td>';
//      html+='<td>'+$("select[name='appType'] option[value='"+single['appType']+"']").text()+'</td>';
     html+='<td>'+single['day']+'</td>';
     html+='<td>'+(single['switch_']=='0'?'<font color=red>关闭</font>':'<font color=green>开启</font>')+'</td>';
//      html+="<td>"+$("select[name='appSource'] option[value='"+single['app_source']+"']").text()+"</td>";
     html+='<td>'+operation+'</td>';
     html+='</tr>';
  }
  $('#resultData').html(html);	
  ajaxPage(data);
}
function add_(){
	showDivDetail('${pageContext.request.contextPath}/ad/toAdd_in.htm',750,700,10,10);
}
function up_(){
	showDivDetail('${pageContext.request.contextPath}/ad/toUp_in.htm?id='+arguments[0],750,700,10,10);
}
function del_(){
	if(confirm('确定删除此应用吗？'))
		ajaxPost('${pageContext.request.contextPath}/ad/del_in.htm',backDel_,{'id':arguments[0]});
}

function switch_(){
	var content = "关闭";
	var switch_=0;
	if(arguments[1] ==0) {
		content="开启";
		switch_=1;
	} 
	if(confirm("确定"+content+"吗？"))
		ajaxPost('${pageContext.request.contextPath}/ad/switch_in.htm',backSwitch_,{'id':arguments[0],'switch':switch_});
}

function backSwitch_(data){
	if(data[0]['info']=='ok'){
		alert('操作成功');
		ajaxQuery();
	}else{
		alert('操作失败');
	}
}

function backDel_(data){
	if(data[0]['info']=='ok'){
		alert('删除成功');
		ajaxQuery();
	}else{
		alert('删除失败');
	}
}
</script>
</head>
<body>
<div class="main">
<div class="nav">广告配置管理</div>
<div class="selectthings">
	<table>
     	<tr>
 			<td width="100%">
 			批次号：
 			<select name="batchId">
     					<option value=""></option>
     					<c:forEach items="${batchList}" var="batch">
     						<option value="${batch.batchId}">${batch.batchId}--${batch.name}</option>
     					</c:forEach>
     				</select>
<!--  			语种： -->
<!--  			<select name="language"> -->
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
<!-- 	     			</select>&nbsp;&nbsp; -->
<!-- 	     			应用类型： -->
<!-- 	     			<select name="appType"> -->
<!-- 	     				<option value=""></option> -->
<!-- 	     				<option value="1">AppStore</option> -->
<!-- 	     				<option value="2">GameCenter</option> -->
<!-- 	     				<option value="3">三星市场</option> -->
<!-- 	     			</select> -->
		  		&nbsp;&nbsp;<input type="button" value="查询" onclick="queryData()" class="btn">
		  		&nbsp;&nbsp;<input type="button" value="添加" onclick="add_()" class="btn">
   			</td>
		</tr>
	</table>
</div>
<div class="qdata">
    <table width="100%" class="datatable" >
      <tbody>
         <tr>
<!--            <th width="10%">ID</th> -->
           <th width="10%">批次号</th>
<!--            <th width="10%">语种</th> -->
<!--            <th width="10%">应用类型</th> -->
           <th width="10%">激活天数</th>
           <th width="10%">开关状态</th>
           <th width="10%">操作</th>
         </tr>
       </tbody>
        <tbody id="resultData">
       </tbody>
    </table>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/ajaxPage.js"></script>
</div>
</div>  
</body>
</html>