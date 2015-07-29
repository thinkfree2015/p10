<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/6/29
  Time: 14:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ming800" uri="http://java.ming800.com/taglib" %>

<html>
<head>
    <title></title>
</head>
<body>
<div style="text-align: left" >
  <input onclick="window.location.href='<c:url value="/basic/xm.do?qm=formUser"/>'" type="button" class="am-btn am-btn-default am-btn-xs" style="margin-top: 4px;margin-bottom: 6px;width: 100px;margin-left:2px;height: 35px;" value="新建用户" />
</div>
<table class="am-table am-table-bordered am-table-radius am-table-striped">
  <tr style="text-align: center">
    <td>操作</td>
    <td>用户名</td>
    <td>真实姓名</td>
  </tr>

  <c:forEach items="${requestScope.pageInfo.list}" var="user">
    <tr style="text-align: center" id="${user.id}">
      <td width="20%">
        <div class="am-btn-toolbar">
          <div class="am-btn-group am-btn-group-xs" style="width: 100%;text-align: center;" >
            <button  style="margin-left: 70px;" onclick="window.location.href='<c:url value="/basic/xm.do?qm=formUser&id=${user.id}"/>'" class="am-btn am-btn-default am-btn-xs am-hide-sm-only"><span class="am-icon-edit"></span> 编辑</button>
            <button onclick="removeUser('${user.id}')" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"><span class="am-icon-trash-o"></span> 删除</button>
          </div>
        </div>
      </td>
      <td width="20%">${user.username}</td>
      <td width="20%">${user.name}</td>
    </tr>
  </c:forEach>
</table>
<div style="clear: both">
  <ming800:pcPageList bean="${requestScope.pageInfo.pageEntity}" url="/basic/xm.do">
    <ming800:pcPageParam name="qm" value="${requestScope.qm}"/>
    <ming800:pcPageParam name="conditions" value="${requestScope.conditions}"/>
    <ming800:pcPageParam name="menuId" value="${requestScope.menuId}"/>
  </ming800:pcPageList>
</div>
<script>

  function removeUser(divId){
    $.ajax({
      type: "get",
      url: '<c:url value="/basic/xmj.do?qm=removeUser"/>',
      cache: false,
      dataType: "json",
      data:{id:divId},
      success: function (data) {
        $("#"+divId).remove();
      }
    });
  }

</script>
</body>
</html>