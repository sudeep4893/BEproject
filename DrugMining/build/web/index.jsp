<%@include file="header.jsp" %>
<%@include file="navigation.jsp" %>
<%@include file="flash.jsp" %>

<div id="myCarousel" class="carousel slide" data-interval="3000">
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
        <div class="item active">
            <img src="img/slide-01.jpg" alt="">
            <div class="carousel-caption">
                <h4>First Thumbnail label</h4>                
            </div>
        </div>
        <div class="item">
            <img src="img/slide-02.jpg" alt="">
            <div class="carousel-caption">
                <h4>Second Thumbnail label</h4>
            </div>
        </div>
        <div class="item">
            <img src="img/slide-03.jpg" alt="">
            <div class="carousel-caption">
                <h4>Third Thumbnail label</h4>
            </div>
        </div>
    </div>
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
</div>
<hr class="featurette-divider">
<hr class="featurette-divider">
<hr class="featurette-divider">
<%@include file="footer.jsp" %>