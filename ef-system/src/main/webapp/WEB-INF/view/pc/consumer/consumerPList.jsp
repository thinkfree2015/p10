<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/6/25
  Time: 14:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ming800" uri="http://java.ming800.com/taglib" %>

<html>
<head>
    <title></title>
    <script type="text/javascript" src="<c:url value='/scripts/jquery-1.11.1.min.js'/>"></script>
</head>
<body>
<div class="admin-content">
    <div class="am-u-sm-12 am-u-md-6">
        <div class="am-btn-toolbar">
            <div class="am-btn-group am-btn-group-xs">
                <a type="button" class="am-btn am-btn-default" href="<c:url value="/basic/xm.do?qm=formConsumer"/>"><span class="am-icon-plus"></span> 新建</a>
            </div>
        </div>
    </div>
    <div class="am-g">
        <div class="am-u-sm-12 am-u-md-6">
        </div>
        <div class="am-u-sm-12">
            <table class="am-table am-table-striped am-table-hover table-main">
                <thead>
                <tr>
                    <th class="table-set">操作</th>
                    <th class="table-title">用户名</th>
                    <th class="table-title">电话</th>
                    <th class="table-title">性别</th>
                    <th class="table-title">账户余额</th>
                    <th class="table-title">积分</th>

                </tr>
                </thead>
                <tbody>



                <c:forEach items="${requestScope.pageInfo.list}" var="consumer">
                    <tr>
                        <td>
                            <div class="am-btn-toolbar">
                                <div class="am-btn-group am-btn-group-xs">
                                    <a class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"
                                       href="<c:url value="/basic/xm.do?qm=formConsumer&id=${consumer.id}"/>"><span
                                            class="am-icon-trash-o"></span> 编辑
                                    </a>
                                </div>
                                <div class="am-btn-group am-btn-group-xs">
                                    <a class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"
                                       href="<c:url value="/basic/xm.do?qm=removeConsumer&id=${consumer.id}"/>"><span
                                            class="am-icon-trash-o"></span> 删除
                                    </a>
                                </div>
                                <div class="am-btn-group am-btn-group-xs">
                                    <a class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"
                                       href="<c:url value="/basic/xm.do?qm=plistPurchaseOrder_consumer&conditions=user.id:${consumer.id}"/>"><span
                                            class="am-icon-trash-o"></span> 查看消费者订单
                                    </a>
                                </div>
                            </div>
                        </td>
                        <td class="am-hide-sm-only"><a href="<c:url value='/basic/xm.do?qm=viewConsumer&id=${consumer.id}'/>">${consumer.username}</a></td>
                        <td class="am-hide-sm-only">${consumer.phone}</td>
                        <td class="am-hide-sm-only">
                            <c:if test="${consumer.sex == 1}">男</c:if>
                            <c:if test="${consumer.sex == 0}">女</c:if>
                        </td>
                        <td class="am-hide-sm-only">${consumer.deposit}</td>
                        <td class="am-hide-sm-only">${consumer.score}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div style="clear: both">
        <ming800:pcPageList bean="${requestScope.pageInfo.pageEntity}" url="/basic/xm.do">
            <ming800:pcPageParam name="qm" value="${requestScope.qm}"/>
            <ming800:pcPageParam name="conditions" value="${requestScope.conditions}"/>
        </ming800:pcPageList>
    </div>
</div>

</body>
</html>