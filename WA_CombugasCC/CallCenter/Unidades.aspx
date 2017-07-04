<%@ Page Title="" Language="C#" MasterPageFile="~/CallCenter/CallCenter.Master" AutoEventWireup="true" CodeBehind="Unidades.aspx.cs" Inherits="WA_CombugasCC.CallCenter.Unidades" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-container" >
            <div class="page-content-wrapper">
                <div class="page-head">
                    <div class="container">
                        <div class="page-title">
                            <h1>Unidades</h1>
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
                                <span>Unidades</span>
                            </li>
                        </ul>
                        <div class="page-content-inner" style="min-height: 400px;">
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                    <div class="portlet light ">
                                        <div class="portlet-title">
                                            <div class="caption caption-md">
                                                Datos de las Unidades
                                            </div>
                                        </div>
                                        <div class="portlet-body">
                                            <div class="col-md-8 col-sm-12">
                                                <div class="row">
                                              <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                <center><label style="margin-top: 5px;">Número</label></center>
                                                  <input id="numero" class="form-control "  value="0" type="number" />
                                              </div>
                                              <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                                <center><label style="margin-top: 5px;">Marca</label></center>
                                                  <input id="marca" class="form-control" type="text"/>
                                              </div>
                                              <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                                <center><label style="margin-top: 5px;">Modelo</label></center>
                                                   <input id="modelo" class="form-control" type="text"/>
                                              </div>
                                              <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                <center><label style="margin-top: 5px;">Año</label></center>
                                                   <input id="anio" class="form-control " type="number" value="2010"/>
                                              </div>
                                          </div>
                                                <div class="row" style="margin-top: 20px;">
                                              <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                                <center><label style="margin-top: 5px;">Número de placas</label></center>
                                                  <input id="numeroplacas" class="form-control" type="text"/>
                                              </div>
                                              <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                                <center><label style="margin-top: 5px;">Número de serie</label></center>
                                                   <input id="numeroserie" class="form-control" type="text"/>
                                              </div>
                                              <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                                <center><label style="margin-top: 5px;">Activo</label></center>
                                                <center><input id="checkss" name="checkss" type="checkbox"  class="icheck" style="margin-top:5px;"></center>
                                              </div>
                                          </div>
                                            </div>
                                            <div class="col-md-4 col-sm-12">
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <center><h3 style="margin-top: 1px;">Servicios por unidad</h3></center>
                                                     </div>
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="GridServicios">
                                                        
                                                     </div>
                                                </div>
                                            </div>
                                          <div class="row" style="margin-top: 20px;">
                                              <div class="col-md-12" style="margin-top: 20px;">
                                                    <button id="btnguardar" class="btn red pull-right" type="button" style="margin-top:15px !important;display: block;" onclick="Guardar();">Guardar</button>&nbsp;
                                                    <button class="btn red pull-right" id="btnEditar" type="button" style="margin-top:15px !important; display: none;">Modificar</button>&nbsp;
                                                    <button id="btnLim" class="btn btn-default pull-right" type="button" style="margin-top:15px !important; margin-right:15px;" onclick="Limpiar();">Limpiar</button>&nbsp;
                                                </div>
                                          </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-12 col-sm-12">
                                    <div class="portlet light ">
                                        <div class="portlet-title">
                                            <div class="caption caption-md">
                                                Lista de Unidades
                                            </div>
                                        </div>
                                        <div class="portlet-body">
                                          <table class="table table-striped table-bordered table-hover dt-responsive" width="100%" id="tab" cellspacing="0" width="100%">
                                                <thead>
                                                    <tr>
                                                        <th class="all">Número</th>
                                                        <th class="all">Descripción</th>
                                                        <th class="all">Estatus</th>
                                                        <th class="all">Modificar</th>
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
            <a href="javascript:;" class="page-quick-sidebar-toggler">
                <i class="icon-login"></i>
            </a>
        </div>



     <script type="text/javascript">
        var inicio = true;
        var GBLID = -1;
        var GBnumero = "";
        var GBmarca = "";
        var GBmodelo = "";
        var GBanio = "";
        var GBplacas = "";
        var GBserie = "";
        var GBactivo = "";
        var asignacion = new Array();
       
            actualizaTabla();
            cargaServ();
        

         //UNIDADES Y SERVICIOS CARGA
        function actualizaTabla() {
            if (!inicio) $("#tab").dataTable().fnDestroy();
            $("#tab tbody").html("");
            //Tabla
            $.ajax({
                type: "POST",
                url: "Unidades.aspx/CargarDatos",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) { 
                    if (response.d.Result) {
                        var parsedTest = JSON.parse(response.d.Data);             
                        var metodo = "";

                        for (var i = 0; i < parsedTest.length; i++) {
                            if(parsedTest[i]['estado']){
                                metodo='<span class="label label-success">Activo</span>';
                            }else {
                                metodo='<span class="label label-danger">Inactivo</span>';
                            }
                            $('#tab tbody').append('<tr>' + '<td>' + parsedTest[i]['numero'] + '</td><td>Unidad: ' + parsedTest[i]['marca'] +', '+
                                parsedTest[i]['modelo'] +', '+ parsedTest[i]['anio']+', Placas: '+ parsedTest[i]['no_placa']+
                                ', Serie: '+ parsedTest[i]['no_serie']+'</td><td style="text-align: center;">' +
                                metodo + '</td><td style="text-align: center;"><button type="button" class="btn btn-default btn-xs" onclick="carga(' +
                                parsedTest[i]['id'] + ')"><i class="fa fa-edit"></i></button></td></tr>');
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
        function cargaServ() {
            //Servicios
            $.ajax({
                type: "POST",
                url: "Unidades.aspx/CargarDatos2",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d.Result) {
                        var gridServicios = "";
                        var parsedTest = JSON.parse(response.d.Data);
                        for (var i = 0; i < parsedTest.length; i++) {
                            if (parsedTest[i]['estado']) {
                                gridServicios += '<div class="col-md-6"><label><input type="checkbox" name="ckServicio" class="icheck" value="' + parsedTest[i]['id'] + '" /> ' + parsedTest[i]['nombre'] + '</label></div>';
                            }
                        }
                        $("#GridServicios").html(gridServicios);
                    }
                }
            });
        }

         //Limpia datos
        function Limpiar() {
            $("#numero").val('1');
            $("#marca").val('');
            $("#modelo").val('');
            $("#anio").val('2017');
            $("#numeroplacas").val('');
            $("#numeroserie").val('');
            $(".icheck").iCheck('uncheck');
            GBnumero = "";
            GBmarca = "";
            GBmodelo = "";
            GBanio = "";
            GBplacas = "";
            GBserie = "";
            GBactivo = "";
            GBLID = -1;
            asignacion.length=0;
            $('input[name=ckServicio]').each(function () {
                $(this).iCheck('uncheck');
            });
            $("#btnguardar").show("show");
            $("#btnEditar").hide("fast");
            actualizaTabla();
        }

         //Obtiene datos de campos
        function Obtener() {
            GBnumero= $("#numero").val();
            GBmarca = $("#marca").val();
            GBmodelo = $("#modelo").val();
            GBanio = $("#anio").val();
            GBplacas = $("#numeroplacas").val();
            GBserie = $("#numeroserie").val();
            GBactivo = $("#checkss").prop("checked") ? true : false;
            
            $('input[name=ckServicio]').each(function () {
                if ($(this).parent('[class*="icheck"]').hasClass("checked"))
                    asignacion.push($(this).val());
            });
            
        }

        function Guardar() {
            Obtener();

            if (GBnumero == "") {
                toastr.error("Ingrese un número.", "Advertencia");   
            } else {
                $.ajax({
                    type: "POST",
                    url: "Unidades.aspx/Guardar",
                    data: JSON.stringify({ Id: GBLID, Numero: GBnumero, Marca: GBmarca, Modelo: GBmodelo, anio: GBanio, NumeroP: GBplacas, NumeroS: GBserie, Activo: GBactivo, servicios: asignacion }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d.Result) {
                            Limpiar();
                            toastr.success("La unidad ha sido agregada correctamente", "Éxito");
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
            GBLID = idzona;
            $('input[name=ckServicio]').each(function () {
                $(this).iCheck('uncheck');
            });
            $.ajax({
                type: "POST",
                url: "Unidades.aspx/Un",
                data: '{ Id:"' + idzona + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var parsedTest = JSON.parse(response.d.Data);
                    var metodo = "";
                    for (var i = 0; i < parsedTest.length; i++) {
                        $("#numero").val(parsedTest[i]['numero']);
                        $("#marca").val(parsedTest[i]['marca']);
                        $("#modelo").val(parsedTest[i]['modelo']);
                        $("#anio").val(parsedTest[i]['anio']);
                        $("#numeroplacas").val(parsedTest[i]['no_placa']);
                        $("#numeroserie").val(parsedTest[i]['no_serie']);
                        if (parsedTest[i]['estado']) {
                            $("#checkss").iCheck('check');
                        } else {
                            $("#checkss").iCheck('uncheck');
                        }
                        $("#btnguardar").hide("fast");
                        $("#btnEditar").show("show");
                        $("#numero").focus();
                    }
                },
                error: function (error) {
                    console.log("ERROR: " + error);
                }
            });
            carga2(idzona);
        }

        function carga2(idz) {
            $.ajax({
                type: "POST",
                url: "Unidades.aspx/UnS",
                data: '{ idRol:"' + idz + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    
                    var datos = JSON.parse(response.d.Data);
                    for (var i = 0; i < datos.length; i++) {
                        $('input[name=ckServicio]').each(function () {
                            if ($(this).val() == datos[i]['id'])
                                $(this).iCheck('check');
                        });
                    }
                },
                error: function (error) {
                    console.log("ERROR: " + error);
                }
            });
        }

        $("#btnEditar").click(function () {
            if (GBLID == -1) {

            } else {
                Obtener();

                if (GBnumero == "") {
                    toastr.error("Ingrese un número.", "Advertencia");

                } else {

                    $.ajax({
                        type: "POST",
                        url: "Unidades.aspx/Actualizar",
                        data: JSON.stringify({Id:GBLID ,Numero:GBnumero ,Marca:GBmarca ,Modelo:GBmodelo ,anio:GBanio ,NumeroP:GBplacas ,NumeroS: GBserie,Activo:GBactivo ,servicios:asignacion }),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            
                            $("#btnguardar").show("show");
                            $("#btnEditar").hide("fast");
                            Limpiar();
                            toastr.success("La unidad ha sido actualizada correctamente", "Éxito");
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
