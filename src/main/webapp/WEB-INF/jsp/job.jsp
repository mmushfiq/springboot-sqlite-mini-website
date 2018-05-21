<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title"><strong>Job Details</strong></h3>
    </div>
    <div class="panel">
        <div class="panel-body">
            <div class="media">
                <div class="media-left">
                    <a href="#">
                        <img class="media-object" src="<c:url value="/img/${job.imageSrc}" />" alt="${job.jobTitle}" class="img-responsive" height="100" width="150">
                    </a>
                </div>
                <div class="media-body" style="padding-left: 10px;">
                    <h4 class="media-heading" style="color: #4c0d86; margin-bottom: 10px;"><strong>${job.company}</strong></h4>
                    <h4 class="media-heading">${job.jobTitle}</h4>
                    <h5>${job.salary}</h5>
                </div>
            </div>
        </div>
    </div>
    <div class="panel-body">
        <div class="media">
            <div class="media-body">
                <div class="entry-content" style="line-height: 30px;">
                    <p style="text-align: justify;">${job.content}</p>
                </div>
            </div>
            <div class="fb-like" data-layout="standard" data-action="like" data-size="small" data-show-faces="true" data-share="false"></div>
            <div style="padding-top: 20px;"> 
                <!-- AddToAny BEGIN -->
                <div class="a2a_kit a2a_kit_size_32 a2a_default_style">
                    <a class="a2a_button_facebook"></a>
                    <a class="a2a_button_twitter"></a>
                    <a class="a2a_button_google_plus"></a>
                    <a class="a2a_button_linkedin"></a>
                    <a class="a2a_dd" href="https://www.addtoany.com/share"></a>
                </div>
                <script async src="https://static.addtoany.com/menu/page.js"></script>
                <!-- AddToAny END -->
            </div>
        </div>
    </div>

    <div class="fb-comments" data-href="developerjobs.info/job/${v.id}/${v.urlSuffix}" data-width="100%" data-numposts="5"></div>   <!-- data-width="600" -->
</div>



