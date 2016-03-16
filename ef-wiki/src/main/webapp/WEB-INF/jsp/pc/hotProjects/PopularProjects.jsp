<%@ page import="com.efeiyi.ec.wiki.organization.util.AuthorizationUtil" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/10/8
  Time: 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js">
<head>

  <title>【工艺与大师】-最新最全的非物质文化遗产信息查询平台</title>
  <meta name="keywords" content="e飞蚁,非物质文化遗产,中国非物质文化遗产,非物质文化遗产名录,非遗博览园,非遗节,非遗产品,非遗大师,非遗技艺，传统文化，传统美术" />
  <meta name="description" content="最新最全的非物质文化遗产信息查询，有国家级文化遗产、省级文化遗产、市级文化遗产和世界文化遗产包括对应非遗传承人介绍" />

</head>
<body>


<!-- //End--topbar-->

<!-- //End--header-->
<div class="craft-details ">
  <div class="nav-bars ae">
    <ul class="bars">
      <li class="active"><a href="/pc/index.do">热&nbsp;门</a></li>
     <%-- <%if(AuthorizationUtil.getMyUser().getId()==null || "no".equalsIgnoreCase(request.getAttribute("isShow").toString()) ){%>
      <li><a href="<c:url value='/pc/beforeAttention.do'/>">关注</a></li>
      <%}%>
      <%
        if(AuthorizationUtil.getMyUser().getId()!=null && "ok".equalsIgnoreCase(request.getAttribute("isShow").toString()) ){
      %>
      <li><a href="<c:url value='/pc/afterAttention.do'/>">关注</a></li>
      <%}%>--%>

      <li><a href="<c:url value='/pc/category'/>">发&nbsp;现</a></li>
    </ul>
  </div>
</div>
<!--nav-bars-->
<div class="home-craft">
  <div class="craft-details">
    <%--<div class="focus wh">
     <!--轮播图-->
    <ul class="slider-main">
       <c:if test="${! empty bannerList}">
         <c:forEach var="banner" items="${bannerList}" varStatus="status">
         <c:if test="${status.index==0}">
         <li style="display: block;"><a href="${banner.directUrl}"><img src="http://pro.efeiyi.com/${banner.imageUrl}" ></a></li>
           </c:if>
           <c:if test="${status.index!=0}">
             <li><a href="${banner.directUrl}"><img src="http://pro.efeiyi.com/${banner.imageUrl}" ></a></li>
           </c:if>
         </c:forEach>

       </c:if>
     </ul>
      <ul class="slider-nav">
        <li class="active"></li>
        <li></li>
        <li></li>
      </ul>
    </div>--%>
    <!-- //End--nav-->
    <div class="cart-tabe">
      <div class="craft-zy" style="display: block">
      <c:if test="${!empty projectCategory}">
        <c:forEach items="${projectCategory}" var="pc" varStatus="status">
          <div class="craft-content ae">
            <h4>${pc[0].project.projectCategory.name}</h4>
            <a href="#" class="left-icon"></a>
            <div class="commodity-list ae">
              <ul>


                <c:if test="${!empty pc}">
                  <c:forEach items="${pc}" var="projectR" varStatus="status">
                    <li>
                      <div class="commodity-img">
                        <a href="<c:url value='/project/brifProject/${projectR.project.id}'/>"><img src="http://pro.efeiyi.com/${projectR.project.picture_pc_url}@!pc-project-list"></a>
                        <%--<a href="#">
                          <div class="list-moods">
                            <i class="img-icon"></i>
                            <em>${projectR.project.fsAmount}</em>
                          </div>
                        </a>--%>
                      </div>
                      <div class="commodity-txt">
                        <h4><a href="<c:url value='/project/brifProject/${projectR.project.id}'/>">${projectR.project.name}</a></h4></p>

                        <p>
                          <c:choose>
                            <c:when test="${projectR.project.level  eq '1'}">国家级非物质文化遗产</c:when>
                            <c:when test="${projectR.project.level  eq '2'}">省级非物质文化遗产</c:when>
                            <c:when test="${projectR.project.level  eq '3'}">市级非物质文化遗产</c:when>
                            <c:otherwise>县级非物质文化遗产</c:otherwise>
                          </c:choose></p>
                        <p>${projectR.project.addressDistrict.addressCity.addressProvince.name}</p>

                      <%--  <p>${fn:length(projectR.project.productList)}件作品</p>

                        <p>${fn:length(projectR.project.masterProjects)}位大师</p>--%>
                      </div>
                    </li>
                  </c:forEach>
                </c:if>

              </ul>
            </div>
            <a href="#" class="right-icon"></a>
          </div>
        </c:forEach>
      </c:if>


      </div>

    </div>
  </div>
</div>

<!-- //End--footer-->
<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js?uid=" charset="utf-8"></script>
</body>
</html>

