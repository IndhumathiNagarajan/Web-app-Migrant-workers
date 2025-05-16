<%@include file="header.jsp" %>
<style>
  .fade-container {
    position: relative;
    width: 90%;
    max-width: 100vw;
    height: auto;
    margin: 0 auto;
    height:400px;
  }

  .fade-container img {
    position: absolute;
    width: 100%;
    height: auto;
    top: 0;
    left: 0;
    opacity: 0;
    transition: opacity 1s ease-in-out;
    height:400px;
  }

  .fade-container img.active {
    opacity: 1;
    z-index: 1;
  }
</style>

<h1 class="page-header">Migrant Worker <small>Assistance and Tracking System</small></h1>
<!--p style="text-align: center;"><img id="slideshow" src="imgs/a.jpg" style="width:90%;"></p-->
<div class="fade-container">
  <img src="imgs/a.jpg" class="active" alt="Image 1">
  <img src="imgs/b.jpg" alt="Image 2">
  <img src="imgs/c.jpg" alt="Image 3">
</div>
<%@include file="footer.jsp" %>
<script>
  const images = document.querySelectorAll('.fade-container img');
  let currentIndex = 0;

  setInterval(() => {
    images[currentIndex].classList.remove('active');
    currentIndex = (currentIndex + 1) % images.length;
    images[currentIndex].classList.add('active');
  }, 3000); // Change every 3 seconds
</script>