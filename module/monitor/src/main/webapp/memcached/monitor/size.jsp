<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>鲁班监控平台-数据统计信息</title>
<style type="text/css">
.panel-group{
	max-height: 100%;
}
</style>
</head>
<script type="text/javascript">
$(document).ready(function(){
	<c:if test="${msg != null}">
		layer.alert('${msg}', {
			  btn: ['确定'] //按钮
		});
	</c:if>
});
</script>
<body>
	<div class="page-header">
		<h3>memcached状态</h3>
	</div>
	
	<c:forEach items="${size}" var="item" varStatus="status">
		<div class="panel-group" id="accordion">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion" href="#server${status.index}">
						<span class="text-primary">
						${item.ip}
						</span>
					</a>
					</h3>
				</div>
				<div id="server${status.index}" class="panel-collapse collapse in">
					<div class="panel-body">
						<table class="table">
							<thead>
								<tr>
									<th>监控项</th>
									<th>数值</th>
									<th>监控项</th>
									<th>数值</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${item.sizes}" var="value" varStatus="subItem">
									<c:if test="${subItem.index % 2 == 0}">
										<tr>
									</c:if>
										<td>${value.key}(<s:message code="${value.key}" text=""></s:message>)</td>
										<td>
											<c:choose>
												<c:when test="${value.key=='time'}">
													<jsp:useBean id="myDate" class="java.util.Date"/> 
													<c:set target="${myDate}" property="time" value="${value.value*1000}"/> 
													<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${myDate}" type="both"/>
												</c:when>
												<c:otherwise>
													${value.value}
												</c:otherwise>
											</c:choose>
										</td>
										<!-- 总数不是2的整数时 -->
										<c:if test="${item.sizes.size() % 2 == 1}">
											<c:if test="${subItem.index == item.sizes.size() - 1}">
												<td>&nbsp;</td><td>&nbsp;</td>
											</c:if>
										</c:if>
									<c:if test="${subItem.index % 2 == 1}">
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>

</body>
</html>