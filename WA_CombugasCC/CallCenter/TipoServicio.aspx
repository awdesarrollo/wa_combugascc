<%@ Page Title="" Language="C#" MasterPageFile="~/CallCenter/CallCenter.Master" AutoEventWireup="true" CodeBehind="TipoServicio.aspx.cs" Inherits="WA_CombugasCC.CallCenter.TipoServicio" %>
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
                    <h1>Servicios</h1>
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
                        <a href="#">Catalogos</a>
                            <i class="fa fa-circle"></i>
                    </li>
                    <li>
                        <span>Tipo de servicio</span>
                    </li>
                </ul>
                <div class="page-content-inner" style="min-height: 400px;">
                    <div class="row">
                        <div class="col-md-9 col-sm-12">
                            <div class="row">
                                <div class="portlet light ">
                                    <div class="portlet-title">
                                        <div class="caption caption-md">
                                            Lista de Servicios
                                        </div>
                                    </div>
                                    <div class="portlet-body">
                                        <table class="table table-striped table-bordered table-hover dt-responsive" width="100%" id="tab" cellspacing="0" width="100%">
                                            <thead>
                                                <tr>
                                                    <th class="all">Servicio</th>
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
                        <div class="col-md-3 col-sm-12">
                            <div class="portlet light ">  
                                <div class="portlet-title">
                                    <div class="caption caption-md">
                                        Agregar un servicio
                                    </div>
                                </div>     
                                <div class="portlet-body">
                                    <div class="row">         
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <center><label style="margin-top: 5px;">Nombre del servicio</label></center>
                                            <input id="nombrezona" class="form-control" type="text"/>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <center><label style="margin-top: 5px;">Activo</label></center>
                                             <center><input id="checkss" name="checkss" type="checkbox"  class="icheck" ></center>
                                        </div>
                                         
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <button id="btnguardar" class="btn red pull-right" type="button" style="margin-top:15px !important;display: block;" onclick="Guardar();">Guardar</button>
                                            <button class="btn red pull-right" id="btnEditar" type="button" style="margin-top:15px !important; display: none;">Modificar</button>
                                            <button id="btnLim" class="btn btn-default pull-left" type="button" style="margin-top:15px !important;" onclick="Limpiar();">Limpiar</button>
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
</div>
    <script type="text/javascript">
        var inicio = true;
        var GBLIDOPERA = -1;
        $(document).ready(function () {
            actualizaTabla();
        });
        
        function actualizaTabla() {
            if (!inicio) $("#tab").dataTable().fnDestroy();
            $("#tab tbody").html("");
            var CategoriasProductos;
            $.ajax({
                type: "POST",
                url: "TipoServicio.aspx/CargarDatos",
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
                        }
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
            $("#checkss").iCheck('uncheck');
            $("#btnguardar").show("show");
            $("#btnEditar").hide("fast");
            actualizaTabla();
        }
        function Guardar() {
           //NOMBRE
            var  res= $.trim($("#nombrezona").val());
            var Nombre = res.toUpperCase();
            //ACTIVO
            var marcado = $("#checkss").prop("checked") ? true : false;
            if (Nombre == "") {
                toastr.error("Ingrese un nombre del operador.", "Advertencia");   
            } else {
                $.ajax({
                    type: "POST",
                    url: "TipoServicio.aspx/Guardar",
                    data: '{ Nombre:"' + Nombre + '",Activo:"'+marcado+'" }',
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
                url: "TipoServicio.aspx/Un",
                data: '{ Id:"' + idzona + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var parsedTest = JSON.parse(response.d.Data);
                    var metodo = "";
                    for (var i = 0; i < parsedTest.length; i++) {
                        $("#nombrezona").val(parsedTest[i]['nombre']);
                        if (parsedTest[i]['estado']) {
                            $("#checkss").iCheck('check');
                        } else {
                            $("#checkss").iCheck('uncheck');
                        }
                        $("#btnguardar").hide("fast");
                        $("#btnEditar").show("show");
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

                if (Nombre == "") {
                    toastr.error("Ingrese un nombre.", "Advertencia");

                } else {

                    $.ajax({
                        type: "POST",
                        url: "TipoServicio.aspx/Actualizar",
                        data: '{ Id:"' + GBLIDOPERA + '",Nombre:"' + Nombre + '",Activo:"' + marcado + '" }',
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
