<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/particlesjs/2.2.3/particles.min.js"></script>
<script src="//code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/parallax.js/1.4.2/parallax.min.js"></script>
<style>
@import url(https://fonts.googleapis.com/css?family=Lato:400,300,100);

.background {
   position: absolute;
   display: block;
   top: 0;
   left: 0;
   z-index: 0;
}

body {
   font-family: "Lato";
   background: #2980b9;
   overflow: hidden;
   height: 100%;
   width: 100%;
   -webkit-font-smoothing: antialiased;
   -webkit-user-select: none;
   -moz-user-select: none;
   -ms-user-select: none;
   user-select: none;
}

.container {
   display: flex;
   justify-content: center;
   align-items: center;
   height: 100vh;
}

.box {
   background: #fff;
   border-radius: 5px;
   padding: 20px;
   text-align: center;
   position: absolute;
   z-index: 1;
}

body {
   
}

#particles-js, #parallax, .layer, .some-space, .some-more-space {
   height: 100%;
   position: absolute;
   width: 100%;
}

#particles-js {
   opacity: 0.6;
}

h1 {
   color: white;
   font-size: 5em;
   font-weight: 100;
   letter-spacing: 0.2em;
   position: absolute;
   top: 50%;
   left: 50%;
   -webkit-transform: translate3d(-50%, -50%, 0);
   transform: translate3d(-50%, -50%, 0);
}

a {
  color: white;
  border: 1px solid white;
  display: table;
  position: absolute;
  top: 60%;
  left: 50%;
  letter-spacing: 0.05em;
  -webkit-transform: translate3d(-50%, -50%, 0);
          transform: translate3d(-50%, -50%, 0);
  text-decoration: none;
  transition: all 200ms ease;
  padding: 10px 15px;
}
a:hover {
  background: white;
  color: black;
}

.some-space {
  animation: rotate 18s 0.5s infinite linear reverse;
}

.some-more-space {
  -webkit-animation: rotate 15s 0.1s infinite linear;
          animation: rotate 15s 0.1s infinite linear;
}

@-webkit-keyframes rotate {
  0% {
    -webkit-transform: rotateZ(0deg) translate3d(0, 1.5%, 0) rotateZ(0deg);
            transform: rotateZ(0deg) translate3d(0, 1.5%, 0) rotateZ(0deg);
  }
  100% {
    -webkit-transform: rotateZ(360deg) translate3d(0, 1.5%, 0) rotateZ(-360deg);
            transform: rotateZ(360deg) translate3d(0, 1.5%, 0) rotateZ(-360deg);
  }
}

@keyframes rotate {
  0% {
    -webkit-transform: rotateZ(0deg) translate3d(0, 1.5%, 0) rotateZ(0deg);
            transform: rotateZ(0deg) translate3d(0, 1.5%, 0) rotateZ(0deg);
  }
  100% {
    -webkit-transform: rotateZ(360deg) translate3d(0, 1.5%, 0) rotateZ(-360deg);
            transform: rotateZ(360deg) translate3d(0, 1.5%, 0) rotateZ(-360deg);
  }
}
</style>
</head>
<body>
   <canvas class="background"></canvas>
   <div id="parallax">
      <div class="layer" data-depth="0.6">
         <div class="some-space">
            <h1>BENKFIT</h1>
         </div>
      </div>
      <div class="layer" data-depth="0.4">
         <div id="particles-js"></div>
      </div>
      <div class="layer" data-depth="0.3">
         <div class="some-more-space">
            <a href="index">more ?</a>
         </div>
      </div>
   </div>

   <script type="text/javascript">
   window.onload = function() {
      Particles.init({
         selector : '.background',
         sizeVariations : 10,
         color : [ '#ffffff', '#ffffff', '#ffffff' ],
         connectParticles : true
      });
   };
</script>
</body>
</html>