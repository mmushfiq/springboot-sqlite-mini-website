<%-- 
    Document   : search
    Created on : Mar 21, 2017, 2:03:34 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style>
    .search-content {
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;

        line-height: 16px;     /* fallback */
        max-height: 32px;      /* fallback */
        -webkit-line-clamp: 2; /* number of lines to show */

        /*        
        line-height: 18px;      
        max-height: 54px;       
        -webkit-line-clamp: 3;   
        */

        -webkit-box-orient: vertical;
    }
    .panel {
        margin-bottom: 5px !important; 
    }
    .list-group-item{
        background-image: url(<c:url value="/img/background.png" />) !important;
    }
</style>


<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">Found ${searchResult.size()} result for keyword <span class="label label-default" style="font-size: 90%;"><c:out value="${searchText}" escapeXml="true"/></span></h3>
    </div>
</div>
<ul id="search-list" class="list-group">
    <c:if test="${not empty searchResult}">
        <c:forEach var="v" items="${searchResult}">
            <li class="list-group-item">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <c:if test="${not empty v.location}">
                            <h4 class="panel-title" style="right: 10px; font-size: 14px;">${v.location}</h4>
                        </c:if>
                    </div>
                    <div class="panel-body">
                        <div class="media">
                            <div class="media-left">
                                <img class="media-object" src="<c:url value="/img/${v.imageSrc}" />" alt="${v.jobTitle}" class="img-responsive" height="100" width="150">
                            </div>
                            <div class="media-body" style="padding-left: 10px;">
                                <h4 style="font-size: 16px;"><a href="${home}/job/${v.id}/${v.urlSuffix}?searchText=${searchText}" style="color: #4c0d86; margin-bottom: 10px;"><strong>${v.jobTitle} - ${v.company}</strong></a></h4>
                                <div class="search-content"><span style="color:#808080;">${v.insertDate}</div>
                            </div>
                        </div>
                    </div>
                </div>
            </li>
        </c:forEach>
    </c:if>
</ul>

<script src="<c:url value="/js/paginathing.js" />"></script>
<script type="text/javascript">
    jQuery(document).ready(function ($) {
        $('.list-group').paginathing({
            perPage: 10,
//            limitPagination: false,
            limitPagination: 10,
            prevNext: true,
            firstLast: true,
            prevText: '&laquo;',
            nextText: '&raquo;',
            firstText: 'First',
            lastText: 'Last',
            containerClass: 'panel-footer',
            ulClass: 'pagination',
            liClass: 'page',
            activeClass: 'active',
            disabledClass: 'disabled'
        });

    });
</script>







