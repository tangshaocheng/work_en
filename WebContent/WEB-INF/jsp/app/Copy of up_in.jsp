<html>
<head>
<%@ include file="/WEB-INF/jsp/header.jsp"%>
<%@ page contentType="text/html; charset=utf-8"%>
<title></title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<link href="${pageContext.request.contextPath}/css/layout.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function update(){
	if(strTrim($('#name').val())==''){
		alert('请输入应用名称');
		$('#name').focus();
		return;
	}
	if(strTrim($('#develope').val())==''){
		alert('请输入开发者');
		$('#develope').focus();
		return;
	}
	if(strTrim($('#version').val())==''){
		alert('请输入版本号');
		$('#version').focus();
		return;
	}
	if(strTrim($('#versionCode').val())==''){
		alert('请输入版本Code');
		$('#versionCode').focus();
		return;
	}
	if(strTrim($('#pakeage').val())==''){
		alert('请输入包名');
		$('#pakeage').focus();
		return;
	}
	if(strTrim($('#mainClass').val())==''){
		alert('请输入主类名');
		$('#mainClass').focus();
		return;
	}
	if(strTrim($('#embededVersion').val()) != '' || strTrim($('#embededPakeage').val()) != '' || strTrim($('#embededMainClass').val()) != '' || strTrim($('#embededApp').val()) != ''){
		if(strTrim($('#embededVersion').val())==''){
			alert('请输入内置版本号');
			$('#embededVersion').focus();
			return;
		}
		
		if(strTrim($('#embededPakeage').val())==''){
			alert('请输入内置包名');
			$('#embededPakeage').focus();
			return;
		}
		if(strTrim($('#embededMainClass').val())==''){
			alert('请输入内置主类名');
			$('#embededMainClass').focus();
			return;
		}
	}
	if(strTrim($('#appDesc').val())==''){
		alert('请输入应用描述');
		$('#appDesc').focus();
		return;
	}
	/*if(strTrim($('#upDesc').val())==''){
		alert('请输入版本更新介绍');
		$('#upDesc').focus();
		return;
	}*/
	if(strTrim($('#shareContent').val())==''){
		alert('请输入应用分享内容');
		$('#shareContent').focus();
		return;
	}
	if(strTrim($('#app').val())!=''){
		var picName = strTrim($('#app').val());
		var suffix = picName.substr(picName.lastIndexOf('.')+1).toLowerCase();  
		if(suffix!='apk'){
			alert('应用程序文件格式只能是 apk');
			return false;
		}
	}
	if(strTrim($('#mainPic').val())!=''){
		var picName = strTrim($('#mainPic').val());
		var suffix = picName.substr(picName.lastIndexOf('.')+1).toLowerCase();  
		if(suffix!='png'&&suffix!='jpg'){
			alert('主图片1文件格式只能是 png 或 jpg');
			return false;
		}
	}
	if(strTrim($('#mainPic2').val())!=''){
		var picName = strTrim($('#mainPic2').val());
		var suffix = picName.substr(picName.lastIndexOf('.')+1).toLowerCase();  
		if(suffix!='png'&&suffix!='jpg'){
			alert('主图片2文件格式只能是 png 或 jpg');
			return false;
		}
	}
	if(strTrim($('#icon').val())!=''){
		var picName = strTrim($('#icon').val());
		var suffix = picName.substr(picName.lastIndexOf('.')+1).toLowerCase();  
		if(suffix!='png'&&suffix!='jpg'){
			alert('图标文件格式只能是 png 或 jpg');
			return false;
		}
	}
	if(strTrim($('#pic1').val())!=''){
		var picName = strTrim($('#pic1').val());
		var suffix = picName.substr(picName.lastIndexOf('.')+1).toLowerCase();  
		if(suffix!='png'&&suffix!='jpg'){
			alert('应用截图1文件格式只能是 png 或 jpg');
			return false;
		}
	}
	if(strTrim($('#pic2').val())!=''){
		var picName = strTrim($('#pic2').val());
		var suffix = picName.substr(picName.lastIndexOf('.')+1).toLowerCase();  
		if(suffix!='png'&&suffix!='jpg'){
			alert('应用截图2文件格式只能是 png 或 jpg');
			return false;
		}
	}
	if(strTrim($('#pic3').val())!=''){
		var picName = strTrim($('#pic3').val());
		var suffix = picName.substr(picName.lastIndexOf('.')+1).toLowerCase();  
		if(suffix!='png'&&suffix!='jpg'){
			alert('应用截图3文件格式只能是 png 或 jpg');
			return false;
		}
	}
	if(strTrim($('#pic4').val())!=''){
		var picName = strTrim($('#pic4').val());
		var suffix = picName.substr(picName.lastIndexOf('.')+1).toLowerCase();  
		if(suffix!='png'&&suffix!='jpg'){
			alert('应用截图4文件格式只能是 png 或 jpg');
			return false;
		}
	}
	if(strTrim($('#pic5').val())!=''){
		var picName = strTrim($('#pic5').val());
		var suffix = picName.substr(picName.lastIndexOf('.')+1).toLowerCase();  
		if(suffix!='png'&&suffix!='jpg'){
			alert('应用截图5文件格式只能是 png 或 jpg');
			return false;
		}
	}
	var sid = '';
	var repeat = false
	var batchId = new Array();
	$('input[name^=appBatch]').each(function (){
		if($(this).val() != ''){
			var i = $(this).attr('id').split('_')[1];
			var bid = $('select[id=batchId_'+i+']@selected').val();
			if($.inArray(bid, batchId) >= 0){
				repeat = true;
				sid = $('select[id=batchId_'+i+']@selected').attr('id');
				return false;
			}
			batchId.push(bid);
		}
	});
	if(repeat){
		alert('同一批次号不能添加多次');
		$('#'+sid).focus();
		return false;
	}
	$('#index').val(index);

	$('#tform').submit();
}
function backUp_(data){
	if(data=='ok'){
		var pn = '${currentPageNum}';
		parent.queryData2(pn);
		alert('修改应用成功');
		parent.closeMyPop();
	}else if(data=='duplicate'){
		alert('此应用已存在');
		return;
	}else {
		alert('修改应用失败');
	}
}
var i = '${appBatchListSize}';
if(i==0) i=1;
var index = new Array();
index.push(0);
function addBatch(){
	$('tr[title^=appBatch]:last').after('<tr class="even" title="batchId_'+i+'"><td width="25%">批次号：</td><td width="75%"><select name="batchId" id="batchId_'+i+'"><option value=""></option><c:forEach items="${batchList}" var="batch"><option value="${batch.batchId}">${batch.batchId}</option></c:forEach></select>&nbsp;&nbsp;<input type="button" onclick="delBatch('+i+');" value="删除" /></td></tr><tr class="even" title="appBatch_'+i+'"><td width="25%">apk程序：</td><td width="75%"><input type="file" name="appBatch_'+i+'" id="appBatch_'+i+'" style="width: 300px"></td></tr>');
	index.push(i);
	i++;
}
function delBatch(i){
	index.splice($.inArray(i, index), 1);
	var bid = 'tr[title=batchId_' + i + ']';
	var aid = 'tr[title=appBatch_' + i + ']';
	$(bid).remove();
	$(aid).remove();
}

$(document).ready(function() {
	$("select[name='language']").change(function() {
		
		var type = $(this).val();
		var html = "";
		if(type=="0") {
			html = "";
			html+="<table>	 		 		 		 		 		 		 		 		 		 		 		 		 		 		 		 		 		 		 		 		 		 		 		 		 		 		 		 		 		 		 		 		 		 		 		 		 		 		 		 		 		 		 		 		 		 		 		 		 		 		 		 		 		 		 		 		 		 		 		 	";
			html+="		 		<tr class=\"odd2\">                                                                                                                                                                                                                             ";
			html+="			     	<td width=\"25%\">应用ID<font color=\"red\">*</font>：</td>                                                                                                                                                                                 ";
			html+="			     	<td width=\"75%\"><input type=\"text\" name=\"id\" value=\"${vo.id}\" id=\"id\" maxlength=\"100\" readonly=\"readonly\" style=\"width:300px\"></td>                                                                                         ";
			html+="		     	</tr>                                                                                                                                                                                                                                         ";
			html+="		     	<tr class=\"odd2\">                                                                                                                                                                                                                           ";
			html+="		     		<td width=\"25%\">应用名<font color=\"red\">*</font>：</td>                                                                                                                                                                                 ";
			html+="		     		<td width=\"75%\"><input type=\"text\" name=\"name\" id=\"name\" value=\"${vo.name}\" maxlength=\"100\" style=\"width:300px\"></td>                                                                                                         ";
			html+="		     	</tr>                                                                                                                                                                                                                                         ";
			html+="		     	<tr class=\"even\">                                                                                                                                                                                                                           ";
			html+="		     		<td width=\"25%\">作者<font color=\"red\">*</font>：</td>                                                                                                                                                                                   ";
			html+="		     		<td width=\"75%\"><input type=\"text\" name=\"develope\" id=\"develope\" maxlength=\"100\" value=\"${vo.develope}\" style=\"width:300px\"></td>                                                                                             ";
			html+="		     	</tr>                                                                                                                                                                                                                                         ";
			html+="		     	<tr class=\"odd2\">                                                                                                                                                                                                                           ";
			html+="			     	<td width=\"25%\">热度：</td>                                                                                                                                                                                                               ";
			html+="			     	<td width=\"75%\">                                                                                                                                                                                                                          ";
			html+="			     	    <select name=\"heat\" id=\"heat\" style=\"width:100px\" >                                                                                                                                                                               ";
			html+="			     	      <option value=0 <c:if test=${vo.heat==0}>selected </c:if>   >☆☆☆☆☆</option>                                                                                                                                                  ";
			html+="			              <option value=1 <c:if test=${vo.heat==1}>selected </c:if>   >★☆☆☆☆</option>                                                                                                                                                ";
			html+="			              <option value=2 <c:if test=${vo.heat==2}>selected </c:if>   >★★☆☆☆</option>                                                                                                                                                ";
			html+="			              <option value=3 <c:if test=${vo.heat==3}>selected </c:if>   >★★★☆☆</option>                                                                                                                                                ";
			html+="			              <option value=4 <c:if test=${vo.heat==4}>selected </c:if>   >★★★★☆</option>                                                                                                                                                ";
			html+="			              <option value=5 <c:if test=${vo.heat==5}>selected </c:if>   >★★★★★</option>                                                                                                                                                ";
			html+="			            </select>                                                                                                                                                                                                                             ";
			html+="			     	</td>                                                                                                                                                                                                                                       ";
			html+="		     	</tr>                                                                                                                                                                                                                                         ";
			html+="		     	<tr class=\"odd2\">                                                                                                                                                                                                                           ";
			html+="					<td>线上app信息：<font color=\"red\">*</font></td>                                                                                                                                                                                            ";
			html+="					<td>                                                                                                                                                                                                                                          ";
			html+="						<table>                                                                                                                                                                                                                                     ";
			html+="							 <tr class=\"even\">                                                                                                                                                                                                                      ";
			html+="						     	<td width=\"25%\">版本号<font color=\"red\">*</font>：</td>                                                                                                                                                                           ";
			html+="						     	<td width=\"75%\"><input type=\"text\" name=\"version\" id=\"version\" maxlength=\"100\" value=\"${vo.version}\" style=\"width:300px\"></td>                                                                                          ";
			html+="						     </tr>                                                                                                                                                                                                                                  ";
			html+="						     <tr class=\"even\">                                                                                                                                                                                                                    ";
			html+="						     	<td width=\"25%\">版本Code<font color=\"red\">*</font>：</td>                                                                                                                                                                         ";
			html+="						     	<td width=\"75%\"><input type=\"text\" name=\"versionCode\" id=\"versionCode\" maxlength=\"10\" value=\"${vo.versionCode}\" style=\"width:300px\" onkeyup=\"this.value=this.value.replace(/\D/g,'')\" ></td>                          ";
			html+="						     </tr>                                                                                                                                                                                                                                  ";
			html+="						     <tr class=\"even\">                                                                                                                                                                                                                    ";
			html+="						     	<td width=\"25%\">包名<font color=\"red\">*</font>：</td>                                                                                                                                                                             ";
			html+="						     	<td width=\"75%\"><input type=\"text\" name=\"pakeage\" id=\"pakeage\" maxlength=\"100\" value=\"${vo.pakeage}\" style=\"width:300px\"></td>                                                                                          ";
			html+="						     </tr>                                                                                                                                                                                                                                  ";
			html+="						     <tr class=\"even\">                                                                                                                                                                                                                    ";
			html+="						     	<td width=\"25%\">主类名<font color=\"red\">*</font>：</td>                                                                                                                                                                           ";
			html+="						     	<td width=\"75%\"><input type=\"text\" name=\"mainClass\" id=\"mainClass\" maxlength=\"100\" value=\"${vo.mainClass}\" style=\"width:300px\"></td>                                                                                    ";
			html+="						     </tr>                                                                                                                                                                                                                                  ";
			html+="						      <tr class=\"even\">                                                                                                                                                                                                                   ";
			html+="						     	<td width=\"25%\">apk程序<font color=\"red\">*</font>：</td>                                                                                                                                                                          ";
			html+="						     	<td width=\"75%\">                                                                                                                                                                                                                    ";
			html+="						     		<input type=\"file\" name=\"app\" id=\"app\" style=\"width:300px\"><a href=\"${pageContext.request.contextPath}/downloadApp.htm?appUrl=${vo.app}\">下载</a>                                                                         ";
			html+="						     	</td>                                                                                                                                                                                                                                 ";
			html+="						     </tr>                                                                                                                                                                                                                                  ";
			html+="						     <tr class=\"even\">                                                                                                                                                                                                                    ";
			html+="						     	<td width=\"25%\">系统固件<font color=\"red\"></font>：</td>                                                                                                                                                                          ";
			html+="						     	<td width=\"75%\"><input type=\"text\" name=\"osVersionMin\" id=\"osVersionMin\" maxlength=\"100\" value=\"${vo.osVersionMin}\" style=\"width:300px\"></td>                                                                           ";
			html+="						    </tr>                                                                                                                                                                                                                                   ";
			html+="						    <c:if test=\"${appBatchListSize == 0}\">                                                                                                                                                                                                ";
			html+="						    	<tr class=\"even\" title=\"batchId_0\">                                                                                                                                                                                               ";
			html+="									<td width=\"25%\">批次号：</td>                                                                                                                                                                                                       ";
			html+="									<td width=\"75%\">                                                                                                                                                                                                                    ";
			html+="										<select name=\"batchId\" id=\"batchId_0\">                                                                                                                                                                                          ";
			html+="											<option value=\"\"></option>                                                                                                                                                                                                      ";
			html+="						     	    		<c:forEach items=\"${batchList}\" var=\"batch\">                                                                                                                                                                              ";
			html+="						     	    			<option value=\"${batch.batchId}\">${batch.batchId}</option>                                                                                                                                                                ";
			html+="						     	    		</c:forEach>                                                                                                                                                                                                                  ";
			html+="						     	    	</select>&nbsp;&nbsp;                                                                                                                                                                                                           ";
			html+="						     	    	<input type=\"button\" onclick=\"addBatch();\" value=\"添加\" />                                                                                                                                                                ";
			html+="									</td>                                                                                                                                                                                                                                 ";
			html+="								</tr>                                                                                                                                                                                                                                   ";
			html+="								<tr class=\"even\" title=\"appBatch_0\">                                                                                                                                                                                                ";
			html+="									<td width=\"25%\">apk程序：</td>                                                                                                                                                                                                      ";
			html+="									<td width=\"75%\">                                                                                                                                                                                                                    ";
			html+="										<input type=\"file\" name=\"appBatch_0\" id=\"appBatch_0\" style=\"width: 300px\">                                                                                                                                                  ";
			html+="									</td>                                                                                                                                                                                                                                 ";
			html+="								</tr>                                                                                                                                                                                                                                   ";
			html+="						    </c:if>                                                                                                                                                                                                                                 ";
			html+="						    <c:if test=\"${appBatchListSize > 0}\">                                                                                                                                                                                                 ";
			html+="							    <c:forEach items=\"${appBatchList}\" var=\"appBatch\" varStatus=\"status\">                                                                                                                                                           ";
			html+="							    	<tr class=\"even\" title=\"batchId_${status.index}\">                                                                                                                                                                               ";
			html+="										<td width=\"25%\">批次号：</td>                                                                                                                                                                                                     ";
			html+="										<td width=\"75%\">                                                                                                                                                                                                                  ";
			html+="											<select name=\"batchId\" id=\"batchId_${status.index}\">                                                                                                                                                                          ";
			html+="							     	    		<option value=\"${appBatch.batchId}\">${appBatch.batchId}</option>                                                                                                                                                          ";
			html+="												<option value=\"\"></option>                                                                                                                                                                                                    ";
			html+="							     	    	</select>&nbsp;&nbsp;                                                                                                                                                                                                         ";
			html+="							     	    	<c:if test=\"${status.index == 0}\"><input type=\"button\" onclick=\"addBatch();\" value=\"添加\" /></c:if>                                                                                                                   ";
			html+="							     	    	<c:if test=\"${status.index > 0}\"><input type=\"button\" onclick=\"delBatch(${status.index});\" value=\"删除\" /></c:if>                                                                                                     ";
			html+="										</td>                                                                                                                                                                                                                               ";
			html+="									</tr>                                                                                                                                                                                                                                 ";
			html+="									<tr class=\"even\" title=\"appBatch_${status.index}\">                                                                                                                                                                                ";
			html+="										<td width=\"25%\">apk程序：</td>                                                                                                                                                                                                    ";
			html+="										<td width=\"75%\">                                                                                                                                                                                                                  ";
			html+="											<input type=\"file\" name=\"appBatch_${status.index}\" id=\"appBatch_${status.index}\" style=\"width: 300px\"><a href=\"${pageContext.request.contextPath}/downloadApp.htm?appUrl=${appBatch.app}\">下载</a>                      ";
			html+="										</td>                                                                                                                                                                                                                               ";
			html+="									</tr>                                                                                                                                                                                                                                 ";
			html+="							    </c:forEach>                                                                                                                                                                                                                          ";
			html+="						    </c:if>                                                                                                                                                                                                                                 ";
			html+="						</table>                                                                                                                                                                                                                                    ";
			html+="					</td>                                                                                                                                                                                                                                         ";
			html+="				</tr>                                                                                                                                                                                                                                           ";
			html+="				<tr class=\"odd2\">                                                                                                                                                                                                                             ";
			html+="					<td>内置app信息：</td>                                                                                                                                                                                                                        ";
			html+="					<td>                                                                                                                                                                                                                                          ";
			html+="						<table>                                                                                                                                                                                                                                     ";
			html+="							<tr class=\"even\">                                                                                                                                                                                                                       ";
			html+="								<td width=\"25%\">内置版本号：</td>                                                                                                                                                                                                     ";
			html+="								<td width=\"75%\"><input type=\"text\" id=\"embededVersion\" maxlength=\"100\"  value=\"${vo.embededVersion}\" name=\"embededVersion\" style=\"width: 300px\"></td>                                                                     ";
			html+="							</tr>                                                                                                                                                                                                                                     ";
			html+="		                                                                                                                                                                                                                                                    ";
			html+="							<tr class=\"even\">                                                                                                                                                                                                                       ";
			html+="								<td width=\"25%\">内置包名：</td>                                                                                                                                                                                                       ";
			html+="								<td width=\"75%\"><input type=\"text\" id=\"embededPakeage\" maxlength=\"100\" value=\"${vo.embededPakeage}\" name=\"embededPakeage\" style=\"width: 300px\"></td>                                                                      ";
			html+="							</tr>                                                                                                                                                                                                                                     ";
			html+="		                                                                                                                                                                                                                                                    ";
			html+="							<tr class=\"even\">                                                                                                                                                                                                                       ";
			html+="								<td width=\"25%\">内置主类名：</td>                                                                                                                                                                                                     ";
			html+="								<td width=\"75%\"><input type=\"text\" id=\"embededMainClass\" maxlength=\"100\" value=\"${vo.embededMainClass}\" name=\"embededMainClass\" style=\"width: 300px\"></td>                                                                ";
			html+="							</tr>                                                                                                                                                                                                                                     ";
			html+="							<tr class=\"even\">                                                                                                                                                                                                                       ";
			html+="								<td width=\"25%\">内置apk程序：</td>                                                                                                                                                                                                    ";
			html+="								<td width=\"75%\"><input type=\"file\" id=\"embededApp\" name=\"embededApp\" style=\"width: 300px\">                                                                                                                                    ";
			html+="								  <a href=\"${pageContext.request.contextPath}/downloadApp.htm?appUrl=${vo.embededApp}\">下载</a>                                                                                                                                       ";
			html+="								</td>                                                                                                                                                                                                                                   ";
			html+="							</tr>                                                                                                                                                                                                                                     ";
			html+="						</table>                                                                                                                                                                                                                                    ";
			html+="					</td>                                                                                                                                                                                                                                         ";
			html+="				</tr>                                                                                                                                                                                                                                           ";
			html+="		     	<tr class=\"even\">                                                                                                                                                                                                                           ";
			html+="		     		<td width=\"25%\">应用简描述<font color=\"red\"></font>：</td>                                                                                                                                                                              ";
			html+="		     		<td width=\"75%\">                                                                                                                                                                                                                          ";
			html+="		     			<input type=\"text\" name=\"singleWord\" id=\"singleWord\" value=\"${vo.singleWord}\" style=\"width:400px\">                                                                                                            ";
			html+="		     		</td>                                                                                                                                                                                                                                       ";
			html+="		    	</tr>                                                                                                                                                                                                                                         ";
			html+="		     	<tr class=\"even\">                                                                                                                                                                                                                           ";
			html+="		     		<td width=\"25%\">应用详描述<font color=\"red\">*</font>：</td>                                                                                                                                                                             ";
			html+="		     		<td width=\"75%\">                                                                                                                                                                                                                          ";
			html+="		     			<textarea id=\"appDesc\" name=\"appDesc\" rows=\"12\" cols=\"96\" maxlength=\"1000\" style='padding:3px; font-family:\"Courier New\",Courier,monospace;'>${vo.appDesc}</textarea>                                                         ";
			html+="		     		</td>                                                                                                                                                                                                                                       ";
			html+="		     	</tr>                                                                                                                                                                                                                                         ";
			html+="		    	<tr class=\"even\">                                                                                                                                                                                                                           ";
			html+="		     		<td width=\"25%\">版本更新介绍<font color=\"red\">*</font>：</td>                                                                                                                                                                           ";
			html+="		     		<td width=\"75%\">                                                                                                                                                                                                                          ";
			html+="		     			<textarea id=\"upDesc\" name=\"upDesc\" rows=\"12\" cols=\"96\" maxlength=\"1000\" style='padding:3px; font-family:\"Courier New\",Courier,monospace;'>${vo.upDesc}</textarea>                                                            ";
			html+="		     		</td>                                                                                                                                                                                                                                       ";
			html+="		     	</tr>                                                                                                                                                                                                                                         ";
			html+="		     	<tr class=\"even\">                                                                                                                                                                                                                           ";
			html+="			    	<td width=\"25%\">应用分享内容<!-- <font color=\"red\">*</font> -->：</td>                                                                                                                                                                  ";
			html+="					<td width=\"75%\">                                                                                                                                                                                                                            ";
			html+="				  	 	<textarea id=\"shareContent\" name=\"shareContent\" rows=\"5\" maxlength=\"1000\" cols=\"96\" style='padding: 3px; font-family: \"Courier New\", Courier, monospace;'>${vo.shareContent}</textarea>                                       ";
			html+="					</td>                                                                                                                                                                                                                                         ";
			html+="				</tr>                                                                                                                                                                                                                                           ";
			html+="				<tr class=\"odd2\">                                                                                                                                                                                                                             ";
			html+="					<td valign=\"top\">所属分类<font color=\"red\">*</font>：</td>                                                                                                                                                                                ";
			html+="					<td>                                                                                                                                                                                                                                          ";
			html+="						<select id=\"categoryId\" name=\"categoryId\" style=\"width: 120px\">                                                                                                                                                                       ";
			html+="							<c:forEach items=\"${categoryList}\" var=\"category\">                                                                                                                                                                                    ";
			html+="					     		<option value=\"${category.id}\"<c:if test=\"${vo.categoryId eq category.id}\"> selected</c:if>>${category.name}</option>                                                                                                             ";
			html+="					     	</c:forEach>                                                                                                                                                                                                                            ";
			html+="						</select>                                                                                                                                                                                                                                   ";
			html+="					</td>                                                                                                                                                                                                                                         ";
			html+="				</tr>                                                                                                                                                                                                                                           ";
			html+="		     	<tr class=\"odd2\">                                                                                                                                                                                                                           ";
			html+="		     		<td width=\"25%\">图标<font color=\"red\">*</font>：</td>                                                                                                                                                                                   ";
			html+="		     		<td width=\"75%\">                                                                                                                                                                                                                          ";
			html+="		     			<input type=\"file\" name=\"icon\" id=\"icon\" style=\"width:300px\"><img src=\"${pageContext.request.contextPath}/downloadPic.htm?picUrl=${vo.icon}\" width=\"105\" height=\"45\" border=\"0\" />                                        ";
			html+="		     		</td>                                                                                                                                                                                                                                       ";
			html+="		     	</tr>                                                                                                                                                                                                                                         ";
			html+="		                                                                                                                                                                                                                                                    ";
			html+="		     	<tr class=\"even\">                                                                                                                                                                                                                           ";
			html+="		     		<td width=\"25%\">主图片1<!-- <font color=\"red\">*</font> -->：</td>                                                                                                                                                                       ";
			html+="		     		<td width=\"75%\">                                                                                                                                                                                                                          ";
			html+="		     			<input type=\"file\" name=\"mainPic\" id=\"mainPic\" style=\"width:300px\"><img src=\"${pageContext.request.contextPath}/downloadPic.htm?picUrl=${vo.mainPic}\" width=\"105\" height=\"45\" border=\"0\" />                               ";
			html+="					</td>                                                                                                                                                                                                                                         ";
			html+="		     	</tr>                                                                                                                                                                                                                                         ";
			html+="		     	<tr class=\"even\">                                                                                                                                                                                                                           ";
			html+="		     		<td width=\"25%\">主图片2<!-- <font color=\"red\">*</font> -->：</td>                                                                                                                                                                       ";
			html+="		     		<td width=\"75%\">                                                                                                                                                                                                                          ";
			html+="		     			<input type=\"file\" name=\"mainPic2\" id=\"mainPic2\" style=\"width:300px\"><img src=\"${pageContext.request.contextPath}/downloadPic.htm?picUrl=${vo.mainPic2}\" width=\"105\" height=\"45\" border=\"0\" />                            ";
			html+="					</td>                                                                                                                                                                                                                                         ";
			html+="		     	</tr>                                                                                                                                                                                                                                         ";
			html+="		     	<tr class=\"even\">                                                                                                                                                                                                                           ";
			html+="		     		<td width=\"25%\">截图1<font color=\"red\">*</font>：</td>                                                                                                                                                                                  ";
			html+="		     		<td width=\"75%\">                                                                                                                                                                                                                          ";
			html+="		     			<input type=\"file\" name=\"pic1\" id=\"pic1\" style=\"width:300px\"><img src=\"${pageContext.request.contextPath}/downloadPic.htm?picUrl=${vo.pic1}\" width=\"105\" height=\"45\" border=\"0\" />                                        ";
			html+="					</td>                                                                                                                                                                                                                                         ";
			html+="		     	</tr>                                                                                                                                                                                                                                         ";
			html+="		     	<tr class=\"even\">                                                                                                                                                                                                                           ";
			html+="		     		<td width=\"25%\">截图2<font color=\"red\">*</font>：</td>                                                                                                                                                                                  ";
			html+="		     		<td width=\"75%\">                                                                                                                                                                                                                          ";
			html+="		     			<input type=\"file\" name=\"pic2\" id=\"pic2\" style=\"width:300px\"><img src=\"${pageContext.request.contextPath}/downloadPic.htm?picUrl=${vo.pic2}\" width=\"105\" height=\"45\" border=\"0\" />                                        ";
			html+="					</td>                                                                                                                                                                                                                                         ";
			html+="		     	</tr>                                                                                                                                                                                                                                         ";
			html+="		     	<tr class=\"even\">                                                                                                                                                                                                                           ";
			html+="		     		<td width=\"25%\">截图3：</td>                                                                                                                                                                                                              ";
			html+="		     		<td width=\"75%\">                                                                                                                                                                                                                          ";
			html+="		     			<input type=\"file\" name=\"pic3\" id=\"pic3\" style=\"width:300px\"><img src=\"${pageContext.request.contextPath}/downloadPic.htm?picUrl=${vo.pic3}\" width=\"105\" height=\"45\" border=\"0\" />                                        ";
			html+="					</td>                                                                                                                                                                                                                                         ";
			html+="		     	</tr>                                                                                                                                                                                                                                         ";
			html+="		     	<tr class=\"even\">                                                                                                                                                                                                                           ";
			html+="		     		<td width=\"25%\">截图4：</td>                                                                                                                                                                                                              ";
			html+="		     		<td width=\"75%\">                                                                                                                                                                                                                          ";
			html+="		     			<input type=\"file\" name=\"pic4\" id=\"pic4\" style=\"width:300px\"><img src=\"${pageContext.request.contextPath}/downloadPic.htm?picUrl=${vo.pic4}\" width=\"105\" height=\"45\" border=\"0\" />                                        ";
			html+="					</td>                                                                                                                                                                                                                                         ";
			html+="		     	</tr>                                                                                                                                                                                                                                         ";
			html+="		     	<tr class=\"even\">                                                                                                                                                                                                                           ";
			html+="			     	<td width=\"25%\">截图5：</td>                                                                                                                                                                                                              ";
			html+="			     	<td width=\"75%\">                                                                                                                                                                                                                          ";
			html+="			     		<input type=\"file\" name=\"pic5\" id=\"pic5\" style=\"width:300px\"><c:if test=\"\"></c:if>  <img src=\"${pageContext.request.contextPath}/downloadPic.htm?picUrl=${vo.pic5}\" width=\"105\" height=\"45\" border=\"0\" />               ";
			html+="					</td>                                                                                                                                                                                                                                         ";
			html+="		     	</tr>                                                                                                                                                                                                                                         ";
			html+="		     	<tr class=\"even\">                                                                                                                                                                                                                           ";
			html+="			     	<td width=\"25%\">应用标签<font color=\"red\"></font>：</td>                                                                                                                                                                                ";
			html+="			     	<td width=\"75%\"><input type=\"text\" name=\"appTag\" id=\"appTag\" maxlength=\"100\" value=\"${vo.appTag}\" style=\"width:400px\"></td>                                                                                                   ";
			html+="		    	</tr>                                                                                                                                                                                                                                         ";
			html+="		    	<tr class=\"even\">                                                                                                                                                                                                                           ";
			html+="			     	<td width=\"25%\">硬件支持<font color=\"red\"></font>：</td>                                                                                                                                                                                ";
			html+="			     	<td width=\"75%\"><input type=\"text\" name=\"support\" id=\"support\" maxlength=\"100\" value=\"${vo.support}\" style=\"width:400px\"></td>                                                                                                ";
			html+="			    </tr>                                                                                                                                                                                                                                         ";
			html+="			    <tr class=\"even\">                                                                                                                                                                                                                           ";
			html+="			     	<td width=\"25%\">年龄限制<font color=\"red\"></font>：</td>                                                                                                                                                                                ";
			html+="			     	<td width=\"75%\"><input type=\"text\" name=\"ageLimit\" id=\"ageLimit\" maxlength=\"100\" value=\"${vo.ageLimit}\" style=\"width:400px\"></td>                                                                                             ";
			html+="			    </tr>                                                                                                                                                                                                                                         ";
			html+="		     	<tr class=\"even\">                                                                                                                                                                                                                           ";
			html+="			        <td colspan=\"2\" align=\"center\">                                                                                                                                                                                                       ";
			html+="			        	<input type=\"button\" value=\"确     定\" onclick=\"update()\" class=\"btn\"/>&nbsp;&nbsp;&nbsp;&nbsp;                                                                                                                                 ";
			html+="			       	 	<input type=\"button\" value=\"关     闭\" onclick=\"javascript:parent.closeMyPop();\" class=\"btn\"/>                                                                                                                                  ";
			html+="			        </td>	                                                                                                                                                                                                                                    ";
			html+="		     	</tr>                                                                                                                                                                                                                                         ";
			html+="			</table>                                                                                                                                                                                                                                          ";
			
		} else if(type=="1") {
			html = "1";
		} else if(type=="2") {
			html = "2";
		} else if(type=="3") {
			html = "3";
		} else if(type=="4") {
			html = "4";
		} else if(type=="5") {
			html = "5";
		}
		
		$("#content").html(html);

	});
});


</script>
</head>

<!-- 	case 1: -->
<!-- 				lan = "es"; //西班牙true -->
<!-- 				break; -->
<!-- 			case 2: -->
<!-- 				lan = "ar";break;//阿拉伯语 -->
<!-- 			case 3: -->
<!-- 				lan = "fa";break;//波斯语 -->
<!-- 			case 4: -->
<!-- 				lan = "pt";break;//葡萄牙true -->
<!-- 			case 5: -->
<!-- 				lan = "ru";break;//俄语true -->

<body>
<div class="main">
	
	<div class="nav">修改应用</div>
	<div class="selectthings">
		<form name="tform" id="tform" action="${pageContext.request.contextPath}/app/up_in.htm" method="post" enctype="multipart/form-data" target="hidden_frame">
			<input type="hidden" id="index"  name="index" value="">
			<input type="hidden" name="appSize" id="appSize" value="${vo.appSize}">
			<input type="hidden" name="downCnt" id="downCnt" value="${vo.downCnt}">
			
		<div>
			 <table>
		 		<tr class="odd2">
			 		<td>
						选择配置应用语种：
						<select name="language">
							<option value=""></option>
							<option value="0">英语</option>
							<option value="1">西班牙语</option>
							<option value="2">阿拉伯语</option>
							<option value="3">波斯语</option>
							<option value="4">葡萄牙语</option>
							<option value="5">俄语</option>
						</select>
					</td>
				</tr>
			</table>
		</div>
		
	<div id="content">
		    
			</div>
		</form>
		
	</div>
</div>
<iframe name="hidden_frame" id="hidden_frame" style="display:none"></iframe>

</body>
</html>