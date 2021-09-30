<%-- 
    Document   : index
    Created on : 30/08/2021, 18:55:50
    Author     : joseg
--%>
<html>
    <head>
        <title>Inicio</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/" crossorigin="anonymous"></script>
    </head>
    <body background="">
        <!--<div class="container">
            <h2>Listado de Links para ir al formulario que desee</h2>
            <div class="list-group">
                <a href="Cliente.jsp" class="list-group-item list-group-item-action">Clientes</a>
                <a href="Empleado.jsp" class="list-group-item list-group-item-action">Empleados</a>
              </div>
        </div> -->
        
        <div class="container">
        <h2>Listado de Links para ir al formulario que desee</h2>
        
        <div class="row">
            <center>
            <div class="row g-3">
                
                <div class="card" style="width: 18rem;">
                    <img src="https://konfio-blog.s3.us-west-2.amazonaws.com/wp-content/uploads/2019/08/05105628/Fidelizacion-del-cliente-las-claves-y-estrategias-para-lograrla.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                      <h5 class="card-title">Formulario Clientes</h5>
                      <p class="card-text">En este formulario podrá ingresar datos para agregar a un nuevo cliente</p>
                      <a href="Cliente.jsp" class="btn btn-primary">Clientes</a>
                    </div>
                </div>
                <div class="col-md-2"></div>
                <div class="card" style="width: 18rem;">
                    <img src="https://spheremodel.com/blog/wp-content/uploads/2019/10/happy-employees-post.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                      <h5 class="card-title">Formulario Empleados</h5>
                      <p class="card-text">En este formulario podrá ingresar datos para agregar a un nuevo Empleado a la empresa</p>
                      <a href="Empleado.jsp" class="btn btn-primary">Empleados</a>
                    </div>
                </div>
            </div>
                </center>
        </div>
        </div>
    </body>
</html>