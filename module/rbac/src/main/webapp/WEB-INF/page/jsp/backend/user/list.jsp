<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<table class="grid">
	<thead>
		<tr>
			<th class="grid-checkbox"><input type="checkbox" onclick="checkedByName(event,'user_checkbox')" style="margin-right:9px;"></th>
			<th>用户名</th>
			<th>所属人员</th>
			<th>最后登录时间</th>
			<th>状态</th>
			<th>操作</th>
		</tr>
	</thead>
	
	<tbody>
		<c:forEach items="${resultInfo.list}" var="result">
			<tr ondblclick="user.detail('${result.id}');">
				<td class="grid-checkbox">
					<input type="checkbox" name="user_checkbox" />
					<input type="hidden" name="user_id" value="${result.id}"/>
				</td>
				<td>${result.username}</td>
				<td>${result.personName}</td>
				<td>${result.lastLoginTime}</td>
				<td>${stateMap[fn:trim(result.state)].value}</td>
				<td>
					<a href="javascript:user.detail('${result.id}','${updateLock}');">查看</a>
					<a href="javascript:user.update('${result.id}','${updateLock}');">修改</a>
					<a href="javascript:user.deleteSingle('${result.id}','${updateLock}');">删除</a>
					<a href="javascript:user.start('${result.id}','${updateLock}');">启用</a>
					<a href="javascript:user.stop('${result.id}','${updateLock}');">停用</a>
					<a href="javascript:user.disable('${result.id}','${updateLock}');">禁用</a>
					<a href="javascript:user.unlock('${result.id}','${updateLock}');">解锁</a>
					<a href="javascript:user.grant('${result.id}','${updateLock}');">授权</a>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<jsp:include page="/WEB-INF/page/jsp/pagination.jsp">
	<jsp:param value="user.search" name="action"/>
</jsp:include>