<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<div class="btn-group" role="group" aria-label="...">  
    <a href="${home}country?id=031" class="btn btn-default">Azerbaijan</a>
    <a href="${home}country?id=840" class="btn btn-default">USA</a>

    <div class="btn-group" role="group">
        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Other
            <span class="caret"></span>
        </button>
        <ul class="dropdown-menu">
            <li><a href="${home}country?id=276">Germany</a></li>
            <li><a href="#">Canada</a></li>
            <li><a href="#">Australia</a></li>
        </ul>
    </div>
</div>
<br/><br/>

<c:if test="${not empty jobList}">
    <c:forEach var="v" items="${jobList}">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <c:if test="${not empty v.location}"><h4 class="panel-title" style="right: 10px; font-size: 14px;">${v.location}</h4></c:if>
            </div>
            <div class="panel-body">
                <div class="media">
                    <div class="media-left">
                        <img class="media-object" src="<c:url value="/img/${v.imageSrc}" />" alt="${v.jobTitle}" class="img-responsive" height="100" width="150">
                    </div>
                    <div class="media-body" style="padding-left: 10px;">
                        <h4 class="media-heading" style="color: #4c0d86; margin-bottom: 10px;"><strong>${v.company}</strong></h4>
                        <h4 class="media-heading">${v.jobTitle}</h4>
                        <h5>${v.salary}</h5>
                        <c:if test="${not empty deadline}"><p>Deadline: ${v.deadline}</p></c:if>
                        <div style="float:right; bottom: 0px; margin-bottom: 0px;">
                            <a type="button" href="${home}job/${v.id}/${v.urlSuffix}" class="btn btn-primary" >More info</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</c:if>

<center>
    <nav aria-label="Page navigation">
        <ul id="pagination2" class="pagination">
            <li><a href="${home}country?id=${countryCode}&page=1" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
            <li id="prev"><a href="${home}country?id=${countryCode}&page=${pagination.prev}"> prev </a></li>

            <c:forEach begin="${pagination.begin}" end="${pagination.end}" varStatus="loop">
                <li><a href="${home}country?id=${countryCode}&page=${loop.index}"> ${loop.index} </a></li>   
            </c:forEach>

            <li id="next"><a  href="${home}country?id=${countryCode}&page=${pagination.next}"> next </a></li>
            <li><a href="${home}country?id=${countryCode}&page=${pagination.count}"><span aria-hidden="true">&raquo;</span></a></li>
        </ul>
    </nav>
</center>
<input type="hidden" id="hidCount" value="${pagination.count}">

<script src="<c:url value="/js/jobs.js" />"></script>


