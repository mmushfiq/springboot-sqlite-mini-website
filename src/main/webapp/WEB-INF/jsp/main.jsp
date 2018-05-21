<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        
        <c:url var="home" value="/" scope="request" />

        <title>Developer Jobs</title>
        
        <script src="${home}webjars/jquery/3.2.0/jquery.min.js"></script>
        <script src="${home}webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link  href="${home}webjars/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
        <link  href="${home}webjars/bootstrap/3.3.7/css/bootstrap-theme.min.css" rel="stylesheet" />
    </head>

    <body style="overflow-y: scroll; margin-bottom: 35px; background-image: url(<c:url value="/img/background.png" />);">

        <div id="fb-root"></div>
        <script>(function (d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id))
                    return;
                js = d.createElement(s);
                js.id = id;
                js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.8&appId=463280827201201";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));</script> 

        <div class="container" style="max-width: 960px;">

            <!-- Header -->
            <nav class="navbar navbar-default" >
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="${home}">Developer Jobs</a>
                    </div>

                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li><a href="${home}">Home <span class="sr-only">(current)</span></a></li>
                            <li><a href="${home}ppolicy">Privacy Policy</a></li>
                            <li><a href="${home}contact">Contact</a></li>
                            <li><a href="${home}about">About</a></li>
                        </ul>
                    </div>
                </div>
            </nav>

            <div class="row">
                <!-- left area -->
                <div id="main-content" class="col-lg-8">
                    <jsp:include page="${includePage}" />
                </div>

                <!-- right area -->
                <div class="col-lg-4">
                    <springForm:form method="POST" commandName="search" action="${home}search.htm">
                        <div class="input-group">
                            <springForm:input path="searchText" cssClass="form-control" placeholder="Search for..." />
                            <span class="input-group-btn">
                                <input id="searchBtn" type="submit" class="btn btn-default" value="Search"  />
                            </span>
                        </div>
                        <springForm:errors path="searchText" cssClass="error" cssStyle="color: #ff0000; font-style: italic;" />
                    </springForm:form>
                    <div id="fb-page-az" style="margin:20px 0px; display: none;">
                        <iframe src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2Fprogrammer.vacancy%2F&tabs&width=290&height=214&small_header=false&adapt_container_width=false&hide_cover=false&show_facepile=true&appId=463280827201201" width="290" height="214" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true"></iframe>
                    </div>
                    <div id="fb-page-en" style="margin:20px 0px; ">
                        <iframe src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2FDeveloper-Jobs-1365397953503603%2F&tabs&width=290&height=214&small_header=false&adapt_container_width=true&hide_cover=false&show_facepile=true&appId=463280827201201" width="290" height="214" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true"></iframe>
                    </div> 
                </div>
            </div>

            <footer style='background: rgba(0,0,0,.6); height: 30px; bottom: 0; padding: 5px; '>
                <div class="container" style="max-width: 930px; color: rgba(249,249,249,0.7);">
                    <spring:message code="main.footer"/>
                </div>
            </footer>
        </div>

        <script src="<c:url value="/js/main.js" />"></script> 
    </body>
</html>
