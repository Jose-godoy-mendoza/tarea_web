<%-- 
    Document   : Empleado
    Created on : 29/09/2021, 20:31:39
    Author     : joseg
--%>

<%@page import="modelo.Puesto"  %>
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
        <h1>Formulario Empleados</h1>
        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modal_empleado" onclick="limpiar()">Nuevo</button>
        
        <div class="container">
            <div class="modal fade" id="modal_empleado" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">       
                        <div class="modal-body">

                            <form action="sr_empleado" method="post" class="form-group">
                                <label form="lbl_id"><b>ID</b></label>
                                <input type="text" name="txt_id" id="txt_id" class="form-control" value="0" readonly="">

                                <label for="lbl_codigo"><b>Codigo</b></label>
                                <input type="text" name="txt_codigo" id="txt_codigo" class="form-control" pattern="[E]{1}[0-9]{3}" placeholder="Ejemplo E001">
                                <label for="lbl_nombres"><b>Nombres</b></label>
                                <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" placeholder="Nombres">
                                <label for="lbl_apellidos"><b>Apellidos</b></label>
                                <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" placeholder="Apellido 1">
                                <label for="lbl_direccion"><b>Direccion</b></label>
                                <input type="text" name="txt_direccion" id="txt_direccion" class="form-control" placeholder="#casa avenida">
                                <label for="lbl_telefono"><b>Telefono</b></label>
                                <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="+502 #### ####">
                                <label for="lbl_puesto" >Puestos</label>
                                <select name="drop_puestos" id="drop_puestos" class="form-select">
                                    <%
                                        Puesto puesto= new Puesto();
                                        HashMap<String,String> drop= puesto.drop_sangre();
                                        for(String i:drop.keySet())
                                        {
                                            out.println("<option value="+i+">"+drop.get(i)+ "</option>");
                                        }
                                    %>

                    <!--    <option value="0">--- Puesto ---</option>
                    <option value="1">Puesto 1</option>
                    <option value="2">Puesto 2</option>
                    <option value="3">Puesto 3</option>-->
                                </select>
                                <label for="lbl_nacimiento" ><b>Nacimiento</b></label>
                                <input type="date" name="txt_nacimiento" id="txt_nacimiento" class="form-control">
                                <br>
                                <button name="btn_agregar" id="btn_agregar" value="Agregar" class="btn btn-primary ">Agregar</button>
                                <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-success">Modificar</button>
                                <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-danger" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false">Eliminar</button>
                                <button type="button" class="btn btn-warning" data-dismiss="modal">Cerrar</button>
                            </form>
                                    
                        </div>
                    </div>
                                    
                </div>
            </div>
                        
                        
                                    
            <br>
            <table class="table table-form">
                <thead>
                    <tr>
                        <th>Codigo </th>
                        <th>Nombres </th>
                        <th>Apellido </th>
                        <th>Direccion </th>
                        <th>Telefono</th>
                        <th>Nacimiento </th>
                        <th>Puesto </th>
                        
                    </tr>
                </thead>
                <tbody id="tbl_empleados">
                    <%
                        Empleado empleado = new Empleado();
                        DefaultTableModel tabla = new DefaultTableModel();
                        tabla = empleado.leer();
                        for (int t=0;t <tabla.getRowCount();t++){
                            out.println("<tr data-id="+tabla.getValueAt(t, 0)+" data-id_p="+tabla.getValueAt(t, 8)+">");
                            out.println("<td>"+ tabla.getValueAt(t, 1)+"</td>");
                            out.println("<td>"+ tabla.getValueAt(t, 2)+"</td>");
                            out.println("<td>"+ tabla.getValueAt(t, 3)+"</td>");

                            out.println("<td>"+ tabla.getValueAt(t, 4)+"</td>");
                            out.println("<td>"+ tabla.getValueAt(t, 5)+"</td>");
                            out.println("<td>"+ tabla.getValueAt(t, 6)+"</td>");
                            out.println("<td>"+ tabla.getValueAt(t, 7)+"</td>");
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
                $("#txt_id").val(0);
                $("#txt_codigo").val("");
                $("#txt_nombres").val("nombres");
                $("#txt_apellidos").val("apellidos");
                $("#txt_direccion").val("direccion");
                $("#txt_telefono").val("telefono");
                $("#txt_nacimiento").val("nacimiento");
                $("#drop_puestos").val(1);
            }
            
            $("#tbl_empleados").on("click","tr td",function(evt)
            {
                var target,id,id_p,codigo,nombres,apellidos,direccion,telefono,nacimiento;
                target=$(evt.target);
                id=target.parent().data("id");
                id_p=target.parent().data("id_p");
                codigo=target.parent("tr").find("td").eq(0).html();
                nombres=target.parent("tr").find("td").eq(1).html();
                apellidos=target.parent("tr").find("td").eq(2).html();
                direccion=target.parent("tr").find("td").eq(3).html();
                telefono=target.parent("tr").find("td").eq(4).html();
                nacimiento=target.parent("tr").find("td").eq(5).html();
                $("#txt_id").val(id);
                $("#txt_codigo").val(codigo);
                $("#txt_nombres").val(nombres);
                $("#txt_apellidos").val(apellidos);
                $("#txt_direccion").val(direccion);
                $("#txt_telefono").val(telefono);
                $("#txt_nacimiento").val(nacimiento);
                $("#drop_puestos").val(id_p);
                
                $("#modal_empleado").modal("show");
            });
        </script>
        
    </body>
</html>

