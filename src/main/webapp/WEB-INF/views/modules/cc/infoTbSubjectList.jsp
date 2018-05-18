<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>市场主体管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/cc/infoTbSubject/">市场主体列表</a></li>
		<shiro:hasPermission name="cc:infoTbSubject:edit"><li><a href="${ctx}/cc/infoTbSubject/form">市场主体添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="infoTbSubject" action="${ctx}/cc/infoTbSubject/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>名字：</label>
				<form:input path="name" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>创建者：</label>
				<form:input path="createBy.id" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>创建时间：</label>
				<input name="beginCreateDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${infoTbSubject.beginCreateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endCreateDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${infoTbSubject.endCreateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>更新者：</label>
				<form:input path="updateBy.id" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>更新时间：</label>
				<input name="beginUpdateDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${infoTbSubject.beginUpdateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endUpdateDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${infoTbSubject.endUpdateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>地址：</label>
				<form:input path="addr" htmlEscape="false" maxlength="500" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>名字</th>
				<th>创建者</th>
				<th>创建时间</th>
				<th>更新者</th>
				<th>更新时间</th>
				<th>地址</th>
				<th>主体类型,字典SUBJECT_TYPE</th>
				<shiro:hasPermission name="cc:infoTbSubject:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="infoTbSubject">
			<tr>
				<td><a href="${ctx}/cc/infoTbSubject/form?id=${infoTbSubject.id}">
					${infoTbSubject.name}
				</a></td>
				<td>
					${infoTbSubject.createBy.id}
				</td>
				<td>
					<fmt:formatDate value="${infoTbSubject.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${infoTbSubject.updateBy.id}
				</td>
				<td>
					<fmt:formatDate value="${infoTbSubject.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${infoTbSubject.addr}
				</td>
				<td>
					${fns:getDictLabel(infoTbSubject.subjectType, 'SUBJECT_TYPE', '')}
				</td>
				<td>
					<a href="${ctx}/cc/infoTbSubject/view?id=${infoTbSubject.id}">查看</a>
				<shiro:hasPermission name="cc:infoTbSubject:edit">
    				<a href="${ctx}/cc/infoTbSubject/form?id=${infoTbSubject.id}">修改</a>
					<a href="${ctx}/cc/infoTbSubject/delete?id=${infoTbSubject.id}" onclick="return confirmx('确认要删除该市场主体吗？', this.href)">删除</a>
				</shiro:hasPermission>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>