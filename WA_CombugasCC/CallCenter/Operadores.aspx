<%@ Page Title="" Language="C#" MasterPageFile="~/CallCenter/CallCenter.Master" AutoEventWireup="true" CodeBehind="Operadores.aspx.cs" Inherits="WA_CombugasCC.CallCenter.Operadores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <style>

.sa {
    height: 300px !important;
    overflow-x: hidden;
    overflow-y: scroll;
    display:block;
}
    </style>
    
<div class="page-container" >
    <div class="page-content-wrapper">
        <div class="page-head">
            <div class="container">
                <div class="page-title">
                    <h1>Choferes</h1>
                </div>
            </div>
        </div>
        <div class="page-content">
            <div class="container">
                <ul class="page-breadcrumb breadcrumb">
                    <li>
                        <a href="Default.aspx">Home</a>
                        <i class="fa fa-circle"></i>
                    </li>
                    <li>
                        <a href="#">Asignacion Rutas</a>
                            <i class="fa fa-circle"></i>
                    </li>
                    <li>
                        <span>Choferes</span>
                    </li>
                </ul>
                <div class="page-content-inner" style="min-height: 400px;">
                    <div class="row">
                        <div class="col-md-12 col-sm-12">
                                    <div class="portlet light ">
                                        <div class="portlet-title">
                                            <div class="caption caption-md" >
                                                Datos del chofer
                                            </div>
                                        </div>
                                        <div class="portlet-body">
                                            <div class="col-md-3 col-sm-12">
                                                <div class="row" style="display:block;" id="muestradrop">
                                                  <div id="dZUpload" class="dropzone" style="min-height: 200px;">
                                                                 <div class="dz-default dz-message">
                                                                     <span><h2>Arrastra la imagen aquí</h2></span>
                                                                 </div>
                                                        </div>
                                                </div>
                                                <div class="row" style="min-height: 200px; display:none;" id="muestraimg">
                                                    
                                                </div>
                                            </div>
                                            <div class="col-md-9 col-sm-12">
                                                <div class="row">
                                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                                        <center><label style="margin-top: 5px;">Nombre</label></center>
                                                        <input id="nombrezona" class="form-control" type="text"/>
                                                    </div>
                                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                                        <center><label style="margin-top: 5px;">Apellido Paterno</label></center>
                                                        <input id="Apellido1" class="form-control" type="text"/>
                                                    </div>
                                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                                        <center><label style="margin-top: 5px;">Apellido Materno</label></center>
                                                        <input id="Apellido2" class="form-control" type="text"/>
                                                    </div>
                                                    <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12">
                                                        <center><label style="margin-top: 5px;">Dirección</label></center>
                                                        <input id="Direccion" class="form-control" type="text"/>
                                                    </div>
                                                      <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                        <center><label style="margin-top: 5px;">Activo</label></center>
                                                         <center><input id="checkss" name="checkss" type="checkbox"  class="icheck" ></center>
                                                    </div>
                                                    
                                                     <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                        <center><label style="margin-top: 5px;">Usuario</label></center>
                                                        <input id="User" class="form-control" type="text"/>
                                                    </div>
                                                     <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                        <center><label style="margin-top: 5px;">Contraseña</label></center>
                                                        <input id="Pass" class="form-control" type="password"/>
                                                    </div>
                                                  
                                         
                                              
                                                </div>
                                               
                                            </div>
                                            <br />
                                            <br />
                                          <div class="row" >
                                             
                                              <div class="col-md-12 col-sm-12" style="margin-top: 20px;">
                                                   <button id="btnLims" class="btn btn-default pull-left" type="button" style="margin-top:15px !important; margin-right:15px; display:none;" onclick="MuestraDrop();">Cambiar Imagen</button>&nbsp;
                                              
                                                    <button id="btnguardar" class="btn red pull-right" type="button" style="margin-top:15px !important;display: block;" onclick="Guardar();">Guardar</button>&nbsp;
                                                    <button class="btn red pull-right" id="btnEditar" type="button" style="margin-top:15px !important; display: none;">Modificar</button>&nbsp;
                                                    <button id="btnLim" class="btn btn-default pull-right" type="button" style="margin-top:15px !important; margin-right:15px;" onclick="Limpiar();">Limpiar</button>&nbsp;
                                                </div>
                                          </div>
                                        </div>
                                    </div>
                                </div>
                        <div class="col-md-12 col-sm-12">
                            <div class="row">
                                <div class="portlet light ">
                                    <div class="portlet-title">
                                        <div class="caption caption-md">
                                            Lista de Choferes
                                        </div>
                                    </div>
                                    <div class="portlet-body">
                                        <table class="table table-striped table-bordered table-hover dt-responsive" width="100%" id="tab" cellspacing="0" width="100%">
                                            <thead>
                                                <tr>
                                                    <th class="all">Nombre</th>
                                                    <th class="all" style="text-align: center; " >Estatus</th>
                                                    <th class="all" style="text-align: center;" >Modificar</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                         </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                   
                    </div>            
                </div>
            </div>
        </div>
    </div>
</div>


    <script type="text/javascript">

        var max = 0;
        var imgName="";
        $(document).ready(function () {

            actualizaTabla();

            Dropzone.autoDiscover = false;
            //Simple Dropzonejs 
            $("#dZUpload").dropzone({
                url: "hn_FileUpload.ashx?username=" + max.toString(),
                maxFiles: 1,
                addRemoveLinks: true,
                dictResponseError: "Ha ocurrido un error en el server",
                acceptedFiles: 'image/*,.jpeg,.jpg,.png,.JPEG,.JPG,.PNG',
                dictRemoveFile: "Remover",
                success: function (file, response) {
                    imgName = response;
                    file.previewElement.classList.add("dz-success");
                    toastr.success(imgName, "Advertencia");
                },
                error: function (file, response) {
                    file.previewElement.classList.add("dz-error");
                }
            });
        });
        var inicio = true;
        var GBLIDOPERA = -1;
        
        
        function actualizaTabla() {
            var conts = 0;
            if (!inicio) $("#tab").dataTable().fnDestroy();
            $("#tab tbody").html("");
            var CategoriasProductos;
            $.ajax({
                type: "POST",
                url: "Operadores.aspx/CargarDatos",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) { 
                    if (response.d.Result) {
                        var parsedTest = JSON.parse(response.d.Data);             
                        var metodo="";
                        for (var i = 0; i < parsedTest.length; i++) {
                            if(parsedTest[i]['estado']){
                                metodo='<span class="label label-success">Activo</span>';
                            }else {
                                metodo='<span class="label label-danger">Inactivo</span>';
                            }
                            $('#tab tbody').append('<tr>' + '<td>' + parsedTest[i]['nombre'] + '</td><td style="text-align: center;">' + metodo + '</td><td style="text-align: center;"><button type="button" class="btn btn-default btn-xs" onclick="carga(' + parsedTest[i]['id'] + ')"><i class="fa fa-edit"></i></button></td></tr>');
                            conts = i;
                        }
                        max = parsedTest[conts]['id']+1;
                       
                        $("#tab").trigger("update").trigger("appendCache");
                        $("#tab").dataTable({
                            'language': { 'url': '//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json' },
                            buttons: [
                                { extend: 'print', className: 'btn dark btn-outline' },
                                { extend: 'pdf', className: 'btn green btn-outline' },
                                { extend: 'csv', className: 'btn purple btn-outline ' }
                            ],
                            responsive: {
                                details: {
                                }
                            },
                            "order": [
                                [0, 'asc']
                            ],
                            "lengthMenu": [
                                [5, 10, 50, 100, -1],
                                [5, 10, 50, 100, "Todos"]
                            ],
                            "pageLength": 10,
                            "dom": "<'row' <'col-md-12'B>><'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r><'table-scrollable't><'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>",
                        });

                        inicio = false;
                    } else {                      
                    }             
                }
            }); 
        }
        function Limpiar() {
            $("#nombrezona").val('');
            $("#User").val('');
            imgName = "";
            $("#Pass").val('');
            $("#Apellido1").val('');
            $("#Apellido2").val('');
            $("#Direccion").val('');
            $("#checkss").iCheck('uncheck');
            $("#btnguardar").show("show");
            $("#btnEditar").hide("fast");
            document.getElementById('dZUpload').style.display = 'block';
            document.getElementById('btnLims').style.display = 'none';
            document.getElementById('muestraimg').style.display = 'none'; 
            document.getElementById("muestradrop").innerHTML = "";
            $("#muestradrop").append('<div id="dZUpload" class="dropzone" style="min-height: 200px;"><div class="dz-default dz-message">' +
                '<span><h2>Arrastra la imagen aquí</h2></span><br></div></div>');
            Dropzone.autoDiscover = false;
            //Simple Dropzonejs 
            $("#dZUpload").dropzone({
                url: "hn_FileUpload.ashx?username=" + max.toString(),
                maxFiles: 1,
                addRemoveLinks: true,
                dictResponseError: "Ha ocurrido un error en el server",
                acceptedFiles: 'image/*,.jpeg,.jpg,.png,.JPEG,.JPG,.PNG',
                dictRemoveFile: "Remover",
                success: function (file, response) {
                    imgName = response;
                    file.previewElement.classList.add("dz-success");
                    toastr.success(imgName, "Advertencia");
                },
                error: function (file, response) {
                    file.previewElement.classList.add("dz-error");
                }
            });
            actualizaTabla();
        } 
        function MuestraDrop() {
            
            document.getElementById('dZUpload').style.display = 'block';
            document.getElementById('btnLims').style.display = 'none';
            document.getElementById('muestraimg').style.display = 'none';
            
        }
        function Guardar() {
           //NOMBRE
            var  res= $.trim($("#nombrezona").val());
            var Nombre = res.toUpperCase();
            var User=$("#User").val();
            var Pas = $("#Pass").val();
            var ape1 = $("#Apellido1").val().toUpperCase();
            var ape2 = $("#Apellido2").val().toUpperCase();
            var dir = $("#Direccion").val().toUpperCase();
            //ACTIVO
            var marcado = $("#checkss").prop("checked") ? true : false;
            if (Nombre == "" || User == "" || Pas == "" || imgName=="") {
                toastr.error("Los campos son requeridos.", "Advertencia");   
            } else {
                $.ajax({
                    type: "POST",
                    url: "Operadores.aspx/Guardar",
                    data: '{ Nombre:"' + Nombre + '",Activo:"' + marcado + '",Us:"' + User + '",Pass:"' + Pas + '",A1:"' + ape1 + '",A2:"' + ape2 + '",IDFOTO:"'+imgName+'",Dir:"'+dir+'"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d.Result) {
                            Limpiar();
                            toastr.success("El operador ha sido agregado correctamente", "Éxito");
                        } else {
                            toastr.error("No es posible agregar.", "Advertencia");
                            Limpiar();
                        }
                    },
                    error: function (error) {
                        console.log("ERROR: " + error);
                    }
                });     
            }
        }


        function carga(idzona) {
            GBLIDOPERA = idzona;
            $.ajax({
                type: "POST",
                url: "Operadores.aspx/Un",
                data: '{ Id:"' + idzona + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var parsedTest = JSON.parse(response.d.Data);
                    var metodo = "";
                    for (var i = 0; i < parsedTest.length; i++) {
                        $("#nombrezona").val(parsedTest[i]['nombre']);
                        $("#User").val(parsedTest[i]['usuario']);
                        $("#Pass").val(parsedTest[i]['contrasenia']);
                        $("#Apellido1").val(parsedTest[i]['a1']);
                        $("#Apellido2").val(parsedTest[i]['a2']);
                        $("#Direccion").val(parsedTest[i]['dir']);
                        imgName = parsedTest[i]['foto'];
                        if (parsedTest[i]['estado']) {
                            $("#checkss").iCheck('check');
                        } else {
                            $("#checkss").iCheck('uncheck');
                        }
                        $('#muestraimg').html('<img style="width: 100%; display: block;height: 200px;" src="../Images/choferes/' + parsedTest[i]['foto'] + '" alt="' + parsedTest[i]['nombre'] + '" />');
                        $("#btnguardar").hide("fast");
                        $("#btnEditar").show("show");
                        document.getElementById('dZUpload').style.display = 'none';
                        document.getElementById('btnLims').style.display = 'block';
                        document.getElementById('muestraimg').style.display = 'block';
                        $("#nombrezona").focus();

                    }
                },
                error: function (error) {
                    console.log("ERROR: " + error);
                }
            });
        }


        $("#btnEditar").click(function () {
            if (GBLIDOPERA == -1) {

            } else {
                var res = $.trim($("#nombrezona").val());
                var Nombre = res.toUpperCase();
                var marcado = $("#checkss").prop("checked") ? true : false;
                var User = $("#User").val();
                var Pas = $("#Pass").val();
                var ape1 = $("#Apellido1").val().toUpperCase();
                var ape2 = $("#Apellido2").val().toUpperCase();
                var dir = $("#Direccion").val().toUpperCase();
                if (Nombre == "" || User == "" || Pas == "" || ape1 == "" || ape2 == "" || imgName=="") {
                    toastr.error("Los campos son requeridos.", "Advertencia");
                } else {

                    $.ajax({
                        type: "POST",
                        url: "Operadores.aspx/Actualizar",
                        data: '{ Id:"' + GBLIDOPERA + '",Nombre:"' + Nombre + '",Activo:"' + marcado + '" ,Us:"' + User + '",Pass:"' + Pas + '",A1:"' + ape1 + '",A2:"' + ape2 + '" ,IDFOTO:"' + imgName + '",Dir:"' + dir + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            
                            $("#btnguardar").show("show");
                            $("#btnEditar").hide("fast");
                            Limpiar();
                            toastr.success("El operador ha sido actualizado correctamente", "Éxito");
                        },
                        error: function (error) {
                            console.log("ERROR: " + error);
                        }
                    });
                }

            }
        });
</script>
</asp:Content>
