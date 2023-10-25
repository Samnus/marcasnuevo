<%@page import="modelo.Marcas" %>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap" %>
<%@page import="javax.swing.table.DefaultTableModel"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Marcas</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
    <h1>Marcas</h1>
    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modal_marca" onclick="limpiar()">Nueva Marca</button>
    <div class="container">
        <div class="modal fade" id="modal_marca" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        <form action="sr_marca1" method="post" class="form-group">
                            <label for="lbl_idmarca"><b>ID de Marca:</b></label>
                            <input type="text" name="txt_idmarca" id="txt_idmarca" class="form-control" value="0" readonly>
                            <label for="lbl_marca"><b>Marca:</b></label>
                            <input type="text" name="txt_marca" id="txt_marca" class="form-control" placeholder="Ejemplo: Marca" required>
                            <br>
                            <button name="btn_agregar_marca" id="btn_agregar_marca" value="agregar" class="btn btn-primary">Agregar Marca</button>
                            <button name="btn_modificar_marca" id="btn_modificar_marca" value="modificar" class="btn btn-success">Modificar Marca</button>
                            <button name="btn_eliminar_marca" id="btn_eliminar_marca" value="eliminar" class="btn btn-outline-warning" onclick="javascript:if(!confirm('¿Desea eliminar esta Marca?')) return false">Eliminar Marca</button>
                            <button type="button" class="btn btn-outline-danger" data-dismiss="modal">Cerrar</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <table class="table">
            <thead>
                <tr>
                    <th>Marca</th>
                </tr>
            </thead>
            <tbody id="tbl_marcas">
               <%
       
  Marcas marca= new Marcas();
   DefaultTableModel tabla = new DefaultTableModel();
    tabla = marca.leer();
    for(int t =0; t<tabla.getRowCount();t++){
       out.println("<tr data-id="+tabla.getValueAt(t,0)+">");
       out.println("<td>"+tabla.getValueAt(t,1)+"</td>");
out.println("</tr>");
       }
   %>
            </tbody>
        </table>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    <script type="text/javascript">
        function limpiar() {
            $("#txt_idmarca").val(0);
            $("#txt_marca").val('');
        }

        $('#tbl_marcas').on('click', 'tr', function (evt) {
            var target,idmarca,marca;
            var target = $(event.target);
            var idmarca = target.parent().data('id');
            var marca = target.parent("tr").find("td").eq(0).html();
            $("#txt_idmarca").val(idmarca);
            $("#txt_marca").val(marca);
            $("#modal_marca").modal('show');
        });
    </script>
</body>
</html>
