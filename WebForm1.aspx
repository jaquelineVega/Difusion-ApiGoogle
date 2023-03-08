<!DOCTYPE html>
<html>
<head> 
    <meta charset="UTF-8">
	<meta name="viewport" content="initial-scale=1.0">
    <title>GOOGLE API</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
    
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCfxPD7VdQYeMQCOL5BhBjKSLZSdbvwRCM&callback=initMap"
        async defer></script>
	<style> 
  	  #map {
        height: 100%;
      }
     
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
	</style> 
</head>  
	<body>
        <!--NAVBAR-->
        <nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Dropdown
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled">Disabled</a>
        </li>
      </ul>
      <form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>
        <!--FIN NAVBAR-->
        <!--CAJAS-->
        <div class="container text-center" style="margin-top:2%; margin-bottom:2%;">
          <div class="row">

            <div class="col">
                <img src="img/database.svg"  alt="...">
                <div class="card-body">
                  <form>
                      <div class="mb-3">
                        <label for="exampleInputEmail1" class="form-label">
                            Latitud
                        </label>
                        <input type="email" class="form-control" id="latitud" >
                      </div>
                      <div class="mb-3">
                        <label for="exampleInputPassword1" class="form-label">
                            Longitud
                        </label>
                       <input type="email" class="form-control" id="longitud">
                      </div>
                     
                      <button type="submit" class="btn btn-success">Aceptar</button>
                    </form>
                </div>
            </div>

            <div class="col">
                <img src="img/location.svg"  alt="...">
                <div class="card-body">
                  <h5 class="card-title">localización</h5>
                </div>
            </div>
            <div class="col">
                <img src="img/map.svg"  alt="...">
                <div class="card-body">
                  <h5 class="card-title">Mapeo</h5>
                  
                </div>
            </div>
          </div>
        </div>
        <!--FIN CAJAS-->
        <!--MAPA INICIO-->
		<div id ="map" style="width:100%;background:red; height:70%";padding-top:"2%"></div> 
        <!--FIN MAPA-->
       <!--SCRIP GOOGLE -->
        
 
       <script>

          

           // In the following example, markers appear when the user clicks on the map.
           // Each marker is labeled with a single alphabetical character.
           const labels = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
           let labelIndex = 0;

           var map;
           function initMap() {
               var latitud = 22.145283;
               var longitud = - 101.015192;

               coordenadas = {
                   lng: longitud,
                   lat: latitud,
               };
               generarMapa(coordenadas);
           }

           function generarMapa(coordenadas){


               map = new google.maps.Map(document.getElementById('map'), {
                   center: new google.maps.LatLng(coordenadas.lat, coordenadas.lng),
                   zoom: 13,
               });
               var marker = new google.maps.Marker({
                   position: new google.maps.LatLng(coordenadas.lat,coordenadas.lng),
                   map: map,
                   title: 'Zona Universitaria'
               });
               var infowindow = new google.maps.InfoWindow({
                   content: "<p>Coordenadas:" + marker.getPosition() + "</p>",
               });

               //EVENTO PARA TOMAR COORDENADAS AL ARRASTRARSE

               marker.addListener('dragend', function (event) {
                   document.getElementById("latitud").value = this.getPosition().lat();
                   document.getElementById("longitud").value = this.getPosition().lng();
               })

               // This event listener calls addMarker() when the map is clicked.
               google.maps.event.addListener(map, "click", (event) => {
                   addMarker(event.latLng, map);
               });
               // Add a marker at the center of the map.
               addMarker(bangalore, map);
           }

           // Adds a marker to the map.
           function addMarker(location, map) {
               // Add the marker at the clicked location, and add the next-available label
               // from the array of alphabetical characters.
               new google.maps.Marker({
                   position: location,
                   label: labels[labelIndex++ % labels.length],
                   map: map,
               });
           }

           window.initMap = initMap;


       </script>
	
	</body> 
</html>