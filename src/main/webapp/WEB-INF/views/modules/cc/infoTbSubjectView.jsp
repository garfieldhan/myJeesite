<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>市场主体管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/cc/infoTbSubject/">市场主体列表</a></li>
		<li class="active"><a href="${ctx}/cc/infoTbSubject/view?id=${infoTbSubject.id}">市场主体信息</a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="infoTbSubject" action="${ctx}/cc/infoTbSubject/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<table class="table table-striped table-bordered">
			<thead>
				<tr><th>市场主体信息</th></tr>
			</thead>
			<tbody>
				<tr>
					<td width="15%" style="text-align:right"><b>主键：</b></td>
					<td width="35%" >${infoTbSubject.id}</td>
					<td width="15%" style="text-align:right"><b>名字：</b></td>
					<td width="35%" >${infoTbSubject.name}</td>
				</tr>
				<tr>
					<td width="15%" style="text-align:right"><b>创建者：</b></td>
					<td width="35%" >${infoTbSubject.createBy.id}</td>
					<td width="15%" style="text-align:right"><b>创建时间：</b></td>
					<td width="35%" ><fmt:formatDate value="${infoTbSubject.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				</tr>
				<tr>
					<td width="15%" style="text-align:right"><b>更新者：</b></td>
					<td width="35%" >${infoTbSubject.updateBy.id}</td>
					<td width="15%" style="text-align:right"><b>更新时间：</b></td>
					<td width="35%" ><fmt:formatDate value="${infoTbSubject.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				</tr>
				<tr>
					<td width="15%" style="text-align:right"><b>地址：</b></td>
					<td width="35%" >${infoTbSubject.addr}</td>
					<td width="15%" style="text-align:right"><b>主体类型,字典SUBJECT_TYPE：</b></td>
					<td width="35%" >${fns:getDictLabel(infoTbSubject.subjectType,'SUBJECT_TYPE','')}</td>
				</tr>
				<tr>
					<td width="15%" style="text-align:right"><b>删除标记：</b></td>
					<td width="35%" colspan="3">${fns:getDictLabel(infoTbSubject.delFlag,'del_flag','')}</td>
				</tr>
			</tbody>
		</table>
		<div class="form-actions" align="center">
			<input id="btnCancel" class="btn" type="button" value="关 闭" onclick="top.$('.tab_selected .tab_close>a').click();" style="width:80px"/>
		</div>
	</form:form>
</body>
</html>