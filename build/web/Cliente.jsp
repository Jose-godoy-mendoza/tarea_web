<%-- 
    Document   : Cliente
    Created on : 29/09/2021, 20:18:04
    Author     : joseg
--%>

<%@page import="modelo.Cliente"  %>
<%@page import="modelo.Empleado"  %>
<%@page import="javax.swing.table.DefaultTableModel"  %>
<%@page import="controlador.sr_empleado"  %>
<%@page import="java.util.HashMap" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Formulario Clientes</h1>
        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modal_empleado" onclick="limpiar()">Nuevo</button>
        
        <div class="container">
            <div class="modal fade" id="modal_empleado" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">       
                        <div class="modal-body">

                            <form action="sr_cliente" method="post" class="form-group">
                                <label form="lbl_id"><b>ID</b></label>
                                <input type="text" name="txt_id_cliente" id="txt_id_cliente" class="form-control" value="0" readonly="">

                                <label for="lbl_codigo"><b>NIT</b></label>
                                <input type="text" name="txt_nit" id="txt_nit" class="form-control"  placeholder="Ingrese su nit">
                                <label for="lbl_nombres"><b>Nombres</b></label>
                                <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" pattern="[A-Z]{1}[a-zA-ZÀ-ÿ\s]{4,40}([ ][A-Z]{1}[a-zA-ZÀ-ÿ\s]{4,40})?" placeholder="Nombre1 nombre2">
                                <label for="lbl_apellidos"><b>Apellidos</b></label>
                                <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" pattern="[A-Z]{1}[a-zA-ZÀ-ÿ\s]{4,40}[ ][A-Z]{1}[a-zA-ZÀ-ÿ\s]{3,40}" placeholder="Apellido1 apellido2">
                                <label for="lbl_direccion"><b>Direccion</b></label>
                                <input type="text" name="txt_direccion" id="txt_direccion" class="form-control" pattern="[A-Z]{1}[a-zA-ZÀ-ÿ\s]{4,40}([ ][A-Z]{1}[a-zA-ZÀ-ÿ\s]{3,40})?" placeholder="#casa avenida">
                                <label for="lbl_telefono"><b>Telefono</b></label>
                                <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" pattern="[0-9]{0-8}" placeholder="+502 #### ####">
                                
                                <label for="lbl_nacimiento" ><b>Nacimiento</b></label>
                                <input type="date" name="txt_nacimiento" id="txt_nacimiento" class="form-control">
                                <br>
                                <button name="btn_agregar_cliente" id="btn_agregar_cliente" value="Agregar_cliente" class="btn btn-primary ">Agregar</button>
                                <button name="btn_modificar_cliente" id="btn_modificar_cliente" value="modificar_cliente" class="btn btn-success">Modificar</button>
                                <button name="btn_eliminar_cliente" id="btn_eliminar_cliente" value="eliminar_cliente" class="btn btn-danger" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false">Eliminar</button>
                                <button type="button" class="btn btn-warning" data-dismiss="modal">Cerrar</button>
                            </form>
                                    
                        </div>
                    </div>
                                    
                </div>
            </div>       
                                    
            <br>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>NIT </th>
                        <th>Nombres </th>
                        <th>Apellido </th>
                        <th>Direccion </th>
                        <th>Telefono</th>
                        <th>Nacimiento </th>
                        
                    </tr>
                </thead>
                <tbody id="tbl_empleados">
                    <%
                        Cliente cliente= new Cliente();
                        DefaultTableModel tabla = new DefaultTableModel();
                        tabla = cliente.leer_cliente();
                        for (int t=0;t <tabla.getRowCount();t++){
                            out.println("<tr data-id="+tabla.getValueAt(t, 0)+" data-id_c="+tabla.getValueAt(t, 6)+">");
                            out.println("<td>"+ tabla.getValueAt(t, 1)+"</td>");
                            out.println("<td>"+ tabla.getValueAt(t, 2)+"</td>");
                            out.println("<td>"+ tabla.getValueAt(t, 3)+"</td>");

                            out.println("<td>"+ tabla.getValueAt(t, 4)+"</td>");
                            out.println("<td>"+ tabla.getValueAt(t, 5)+"</td>");
                            out.println("<td>"+ tabla.getValueAt(t, 6)+"</td>");
                            out.println("</tr>");
                        }
        
                    %>
                    
                </tbody>
            </table>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        
        <script type="text/javascript">
            function limpiar()
            {
                $("#txt_id_cliente").val(0);
                $("#txt_nit").val("");
                $("#txt_nombres").val("nombres");
                $("#txt_apellidos").val("apellidos");
                $("#txt_direccion").val("direccion");
                $("#txt_telefono").val("telefono");
                $("#txt_nacimiento").val("nacimiento");
            }
            
            $("#tbl_empleados").on("click","tr td",function(evt)
            {
                var target,id,id_c,nit,nombres,apellidos,direccion,telefono,nacimiento;
                target=$(evt.target);
                id=target.parent().data("id");
                id_c=target.parent().data("id_p");
                nit=target.parent("tr").find("td").eq(0).html();
                nombres=target.parent("tr").find("td").eq(1).html();
                apellidos=target.parent("tr").find("td").eq(2).html();
                direccion=target.parent("tr").find("td").eq(3).html();
                telefono=target.parent("tr").find("td").eq(4).html();
                nacimiento=target.parent("tr").find("td").eq(5).html();
                $("#txt_id_cliente").val(id);
                $("#txt_nit").val(nit);
                $("#txt_nombres").val(nombres);
                $("#txt_apellidos").val(apellidos);
                $("#txt_direccion").val(direccion);
                $("#txt_telefono").val(telefono);
                $("#txt_nacimiento").val(nacimiento);
                
                
                $("#modal_empleado").modal("show");
            });
        </script>
        
    </body>
</html>