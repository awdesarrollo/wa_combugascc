<%@ Page Title="" Language="C#" MasterPageFile="~/CallCenter/CallCenter.Master" AutoEventWireup="true" CodeBehind="Arterias.aspx.cs" Inherits="WA_CombugasCC.CallCenter.Arterias" %>
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
                    <h1>Calles</h1>
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
                        <span>Calles</span>
                    </li>
                </ul>
                <div class="page-content-inner" style="min-height: 400px;">
                    <div class="row">

                        <div class="col-md-9 col-sm-12">
                            <div class="portlet light "> 
                                <div class="portlet-title">
                                    <div class="caption caption-md">
                                        Calles
                                    </div>
                                </div>          
                                <div class="portlet-body">
                                    <div class="row">                       
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">           
                                             <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <center>Buscar por:</center>
                                                <div class="col-md-3 col-sm-12 col-xs-12">
                                                    <center><label>Zona</label></center>
                                                    <select class="form-control select2 col-md-12 col-sm-12 col-xs-12" id="zonaFil" style="margin-top:5px;margin-bottom:10px;">
                                                         <option value="-1"></option>
                                                    </select>
                                                </div>
                                                <div class="col-md-3 col-sm-12 col-xs-12">
                                                    <center><label>Estado</label></center>
                                                    <select class="form-control select2 col-md-12 col-sm-12 col-xs-12" id="estadoFil" style="margin-top:5px;margin-bottom:10px;">
                                                         <option value="-1"></option>
                                                    </select>
                                                </div>
                                                <div class="col-md-3 col-sm-12 col-xs-12">
                                                    <center><label>Ciudad</label></center>
                                                    <select class="form-control select2 col-md-12 col-sm-12 col-xs-12" id="ciudadFil" style="margin-top:5px;margin-bottom:10px;">
                                                         <option value="-1"></option>
                                                    </select>
                                                </div>
                                                <div class="col-md-3 col-sm-12 col-xs-12">
                                                    <center><label>Colonia</label></center>
                                                    <select class="form-control select2 col-md-12 col-sm-12 col-xs-12" id="codigoFil" style="margin-top:5px;margin-bottom:10px;">
                                                         <option value="-1"></option>
                                                    </select>
                                                </div>
                                            </div>
                                         <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="border-bottom:3px #eff3f8 solid;margin-top:10px;margin-bottom:10px;"></div>
                                              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">      
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <center><h3 >Listado de calles</h3></center>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">   
                                            <table class="table table-striped table-bordered table-hover dt-responsive" width="100%" id="tab" cellspacing="0" width="100%">
                                                    <thead>
                                                        <tr>
                                                        <th hidden>ID</th>
                                                        <th >Nombre</th>
                                                        <th style="text-align: center; " >Colonia</th>
                                                        <th style="text-align: center; " >Ciudad</th>
                                                        <th style="text-align: center;" >Estado</th>
                                                        <th style="text-align: center;" >Zona</th>
                                                        <th style="text-align: center;" >¿Activo?</th>
                                                        <th style="text-align: center;" >Modificar</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="tableart">
                                                   
                                                </tbody>
                                            </table>     
                                        </div>
                                    </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-12">
                            <div class="portlet light "> 
                                <div class="portlet-title">
                                    <div class="caption caption-md">
                                        Agregar calle
                                    </div>
                                </div>          
                                <div class="portlet-body">
                                    <div class="row">   
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <label>Tipo de calle</label>
                                            <select class="form-control select2 col-md-12 col-sm-12 col-xs-12" id="ZNSELECTIPO">
                                                <option value="-1"></option>
                                            </select>
                                        </div>                    
                                                 
                                    
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-top:5px;margin-bottom:10px;">
                                            <label style="margin-top: 5px;">Nombre de la calle</label>
                                            <input id="nombreCol" class="form-control" type="text"/>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <label>Selecciona una zona</label>
                                            <select class="form-control select2 col-md-12 col-sm-12 col-xs-12" id="ZNSELEC">
                                                <option value="-1"></option>
                                            </select>
                                        </div>
                                        
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <label>Selecciona un estado</label>
                                             <select class="form-control select2 col-md-12 col-sm-12 col-xs-12" id="ZNSELEC2">
                                                 <option value="-1" disabled></option>
                                            </select>
                                        </div>
                                       
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <label>Selecciona una ciudad</label>
                                            <select class="form-control select2 col-md-12 col-sm-12 col-xs-12" id="ZNSELEC3">
                                                 <option value="-1" disabled></option>
                                            </select>
                                        </div>
                                        
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <label>Selecciona una colonia</label>
                                            <select class="form-control select2 col-md-12 col-sm-12 col-xs-12" id="ZNSELEC4">
                                                 <option value="-1" disabled></option>
                                            </select>
                                        </div>
                                        
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <right>
                                                <button id="btnguardar" class="btn red pull-right" type="button" style="margin-top: 15px !important;" onclick="Guardar()">Guardar</button>
                                                <button id="btnLim" class="btn btn-default pull-left" type="button" style="margin-top: 15px !important; margin-right:15px;" onclick="Limpiar()">Limpiar</button>
                                            </right>
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
    

    <%-- Modal --%>

     <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="mdAgrega">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span></button>
        <h4 class="modal-title" >Modificar calle</h4>
      </div>
      <div class="modal-body" >
          <div class="row">
               <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top:15px;">
            <label class=" col-md-2 col-sm-2 col-xs-12" >Tipo<span>:</span>
            </label>
            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
                   <select class="form-control col-md-12 col-sm-12 col-xs-12" id="ZNSELECTP">
                         <option value="-1"></option>
                   </select>
            </div>
            </div>
        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top:15px;">
           
            <label class="col-md-2 col-sm-2 col-xs-12" >Arteria<span >:</span></label>
            <div class="col-md-10 col-sm-10 col-xs-12">
              <input type="text" id="txtZona" required class="form-control col-md-7 col-xs-12 " value="">
            </div>
          </div> 
              <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top:15px;">
            <label class=" col-md-2 col-sm-2 col-xs-12" >Zona<span>:</span>
            </label>
            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
                   <select class="form-control  col-md-12 col-sm-12 col-xs-12" id="ZNSELEC5">
                         <option value="-1"></option>
                   </select>
            </div>
            </div> 
          <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top:15px;">
            <label class=" col-md-2 col-sm-2 col-xs-12" >Estado<span>:</span>
            </label>
            <div class=" col-lg-10  col-md-10 col-sm-10 col-xs-12">
                   <select class="form-control  col-md-12 col-sm-12 col-xs-12" id="ZNSELEC6">
                         <option value="-1"></option>
                   </select>
            </div>
            </div>
              <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top:15px;">
            <label class=" col-md-2 col-sm-2 col-xs-12" >Ciudad<span>:</span>
            </label>
            <div class="col-lg-10  col-md-10 col-sm-10 col-xs-12">
                   <select class="form-control  col-md-12 col-sm-12 col-xs-12" id="ZNSELEC7">
                         <option value="-1"></option>
                   </select>
            </div>
            </div>
            <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top:15px;">
            <label class=" col-md-2 col-sm-2 col-xs-12" >Colonia<span>:</span>
            </label>
            <div class="col-lg-10  col-md-10 col-sm-10 col-xs-12">
                   <select class="form-control col-md-12 col-sm-12 col-xs-12" id="ZNSELEC8">
                         <option value="-1"></option>
                   </select>
            </div>
            </div>
          <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top:15px;">
            <label class=" col-md-2 col-sm-2 col-xs-12" >Activo<span>:</span>
            </label>
            <div class=" col-md-10 col-sm-10 col-xs-12">
                   <input id="checkss" name="checkss" type="checkbox" class="icheck" >
            </div>
            </div> 
               </div>
      </div>
      <div class="modal-footer" >
        <button class="btn btn-default" type="button"  data-dismiss="modal">Cancelar</button>

        <button type="button" class="btn btn-success"  onclick="actualizar();">Guardar</button ">
      </div>
        
                  
      
    </div>
  </div>
</div>

    <%-- End Modal --%>

<script type="text/javascript">
    var inicio = true;
    var GBLIDZONA = -1;
    var GBLIDEST = -1;
    var GBLIDCD = -1;
    var GBLIDCOL = -1;
    var GBLIDART = -1;
    //Inicializar Cargar zonas y colonias
    $(document).ready(function () {
        
        $('.select2').select2();
        llenarZona();
        llenarEdo();
        llenaCd();
        llenaCO();
        llenaCA();
        actualizaTabla();
    });

    function Limpiar() {
        $("#nombreCol").val('');
        $("#ZNSELEC").select2("val", "");
        $("#ZNSELECTIPO").select2("val", "");
        $("#ZNSELEC2").select2("val", "");
        $("#ZNSELEC3").select2("val", "");
        $("#ZNSELEC4").select2("val", "");
        llenarZona();
        llenarEdo();
        llenaCd();
        llenaCO();
        llenaCA();
        actualizaTabla();
    }
    function actualizaTabla() {
        if (!inicio) $("#tab").dataTable().fnDestroy();
        $("#tab tbody").html("");
        $.ajax({
            type: "POST",
            url: "Arterias.aspx/CargarDatos",
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                if (response.d.Result) {
                    var parsedTest = JSON.parse(response.d.Data);
                    var metodo = "";
                    for (var i = 1; i < parsedTest.length; i++) {
                        if (parsedTest[i]['estado']) {
                            metodo = '<span class="label label-success">SI</span>';
                        } else {
                            metodo = '<span class="label label-danger">NO</span>';//zona
                        }
                        $('#tab tbody').append('<tr>' + '<td hidden>' + parsedTest[i]['idz'] + '</td><td>' +parsedTest[i]['tipo']+' '+ parsedTest[i]['nombre'] + '</td><td style="text-align: center;">' + parsedTest[i]['col'] + '</td><td style="text-align: center;">' + parsedTest[i]['cd'] + '</td><td style="text-align: center;">' + parsedTest[i]['std'] + '</td><td style="text-align: center;">' + parsedTest[i]['zona'] + '</td><td style="text-align: center;">' + metodo + '</td><td style="text-align: center;"><button type="button" class="btn btn-default btn-xs" onclick="carga(' + parsedTest[i]['idz'] + ')"><i class="fa fa-pencil"></i></button></td></tr>');
                    }
                    $("#tab").trigger("update").trigger("appendCache");
                    $("#tab").dataTable({
                        'language': { 'url': '//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json' }
                    });
                    inicio = false;
                } else {
                }
            }, error: function (error) {
                console.log("ERROR: " + error);
            }
        });
    }
    function llenarZona() {
       
        $('#ZNSELEC').html('"<option value="-1"></option>"');
        $('#ZNSELEC option:contains("")').attr('selected', 'selected');
        $('#ZNSELEC5').html('"<option value="-1"></option>"');
        $('#ZNSELEC5 option:contains("")').attr('selected', 'selected');
        $('#zonaFil').html('"<option value="-1"></option>"');
        $('#zonaFil option:contains("")').attr('selected', 'selected');
     
       
       
        $.ajax({
            type: "POST",
            url: "Ciudades.aspx/CargarDatosZonas",
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                if (response.d.Result) {
                    var parsedTest = JSON.parse(response.d.Data);
                    var metodo = "";
                    for (var i = 0; i < parsedTest.length; i++) {
                        if (parsedTest[i]['estado']) {
                            $('#ZNSELEC').append('<option value="' + parsedTest[i]['idz'] + '">' + parsedTest[i]['nombre'] + '</option>');
                            $('#ZNSELEC5').append('<option value="' + parsedTest[i]['idz'] + '">' + parsedTest[i]['nombre'] + '</option>');
                            $('#zonaFil').append('<option value="' + parsedTest[i]['idz'] + '">' + parsedTest[i]['nombre'] + '</option>');
                        } else {
                        }
                    }
                } else {
                }
            }, error: function (error) {
                console.log("ERROR: " + error);
            }
        });
        $('#ZNSELEC option:contains("")').attr('selected', 'selected');
    }
    $("select[id=zonaFil]").change(function () {
       
        llenarEdo();
        llenaCd();
        llenaCO();
        var VALOR = $('#zonaFil').val();
        if (VALOR == '-1') {
        } else {
            if (!inicio) $("#tab").dataTable().fnDestroy();
            $("#tab tbody").html("");
            $.ajax({
                type: "POST",
                url: "Arterias.aspx/CargarDatos2",
                data: '{ id:' + VALOR + ',tipo:1 }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d.Result) {
                        var parsedTest = JSON.parse(response.d.Data);
                        var metodo = "";
                        for (var i = 0; i < parsedTest.length; i++) {
                            if (parsedTest[i]['estado']) {
                                metodo = '<span class="label label-success">SI</span>';
                            } else {
                                metodo = '<span class="label label-danger">NO</span>';//zona
                            }
                            $('#tab tbody').append('<tr>' + '<td hidden>' + parsedTest[i]['idz'] + '</td><td>' + parsedTest[i]['nombre'] + '</td><td style="text-align: center;">' + parsedTest[i]['col'] + '</td><td style="text-align: center;">' + parsedTest[i]['cd'] + '</td><td style="text-align: center;">' + parsedTest[i]['std'] + '</td><td style="text-align: center;">' + parsedTest[i]['zona'] + '</td><td style="text-align: center;">' + metodo + '</td><td style="text-align: center;"><button type="button" class="btn btn-default btn-xs" onclick="carga(' + parsedTest[i]['idz'] + ')"><i class="fa fa-pencil"></i></button></td></tr>');
                        }
                        $("#tab").trigger("update").trigger("appendCache");
                        $("#tab").dataTable({
                            'language': { 'url': '//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json' }
                        });
                        inicio = false;
                    } else {
                    }
                },
                error: function (error) {
                    console.log("ERROR: " + error);
                }
            });

        }
    });
    function llenarEdo() {
        $('#ZNSELEC2').html('"<option value="-1"></option>"');
        $('#ZNSELEC6').html('"<option value="-1"></option>"');
       $('#estadoFil').html('"<option value="-1"></option>"');
        $('#ZNSELEC2 option:contains("")').attr('selected', 'selected');
        $('#ZNSELEC6 option:contains("")').attr('selected', 'selected');
       $('#estadoFil option:contains("")').attr('selected', 'selected');

        $.ajax({
            type: "POST",
            url: "Ciudades.aspx/CargarDatosEstad",
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                if (response.d.Result) {


                    var parsedTest = JSON.parse(response.d.Data);

                    var metodo = "";
                    for (var i = 0; i < parsedTest.length; i++) {
                        if (parsedTest[i]['estado']) {
                            $('#ZNSELEC2').append('<option value="' + parsedTest[i]['idz'] + '">' + parsedTest[i]['nombre'] + '</option>');
                            $('#ZNSELEC6').append('<option value="' + parsedTest[i]['idz'] + '">' + parsedTest[i]['nombre'] + '</option>');
                           $('#estadoFil').append('<option value="' + parsedTest[i]['idz'] + '">' + parsedTest[i]['nombre'] + '</option>');
                        } else {

                        }

                    }

                } else {


                }



            }, error: function (error) {
                console.log("ERROR: " + error);
            }
        });

    }
    $("select[id=estadoFil]").change(function () {
        llenarZona();
       
        llenaCd();
        llenaCO();
        var VALOR = $('#estadoFil').val();
        if (VALOR == '-1') {
        } else {
            if (!inicio) $("#tab").dataTable().fnDestroy();
            $("#tab tbody").html("");
            $.ajax({
                type: "POST",
                url: "Arterias.aspx/CargarDatos2",
                data: '{ id:' + VALOR + ',tipo:2 }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d.Result) {
                        var parsedTest = JSON.parse(response.d.Data);
                        var metodo = "";
                        for (var i = 0; i < parsedTest.length; i++) {
                            if (parsedTest[i]['estado']) {
                                metodo = '<span class="label label-success">SI</span>';
                            } else {
                                metodo = '<span class="label label-danger">NO</span>';//zona
                            }
                            $('#tab tbody').append('<tr>' + '<td hidden>' + parsedTest[i]['idz'] + '</td><td>' + parsedTest[i]['nombre'] + '</td><td style="text-align: center;">' + parsedTest[i]['col'] + '</td><td style="text-align: center;">' + parsedTest[i]['cd'] + '</td><td style="text-align: center;">' + parsedTest[i]['std'] + '</td><td style="text-align: center;">' + parsedTest[i]['zona'] + '</td><td style="text-align: center;">' + metodo + '</td><td style="text-align: center;"><button type="button" class="btn btn-default btn-xs" onclick="carga(' + parsedTest[i]['idz'] + ')"><i class="fa fa-pencil"></i></button></td></tr>');
                        }
                        $("#tab").trigger("update").trigger("appendCache");
                        $("#tab").dataTable({
                            'language': { 'url': '//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json' }
                        });
                        inicio = false;
                    } else {
                    }
                },
                error: function (error) {
                    console.log("ERROR: " + error);
                }
            });

        }
    });
    function llenaCd() {
        $('#ZNSELEC3').html('"<option value="-1"></option>"');
        $('#ZNSELEC7').html('"<option value="-1"></option>"');
        $('#ciudadFil').html('"<option value="-1"></option>"');
        $('#ZNSELEC3 option:contains("")').attr('selected', 'selected');
        $('#ZNSELEC7 option:contains("")').attr('selected', 'selected');
        $('#ciudadFil option:contains("")').attr('selected', 'selected');

        $.ajax({
            type: "POST",
            url: "Ciudades.aspx/CargarDatos",
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                if (response.d.Result) {


                    var parsedTest = JSON.parse(response.d.Data);

                    var metodo = "";
                    for (var i = 0; i < parsedTest.length; i++) {
                        if (parsedTest[i]['estado']) {
                            $('#ZNSELEC3').append('<option value="' + parsedTest[i]['idz'] + '">' + parsedTest[i]['nombre'] + '</option>');
                            $('#ZNSELEC7').append('<option value="' + parsedTest[i]['idz'] + '">' + parsedTest[i]['nombre'] + '</option>');
                            $('#ciudadFil').append('<option value="' + parsedTest[i]['idz'] + '">' + parsedTest[i]['nombre'] + '</option>');

                        } else {

                        }

                    }

                } else {


                }



            }, error: function (error) {
                console.log("ERROR: " + error);
            }
        });

    }
    $("select[id=ciudadFil]").change(function () {
        llenarZona();
        llenarEdo();
       
        llenaCO();
        var VALOR = $('#ciudadFil').val();
        if (VALOR == '-1') {
        } else {
            if (!inicio) $("#tab").dataTable().fnDestroy();
            $("#tab tbody").html("");
            $.ajax({
                type: "POST",
                url: "Arterias.aspx/CargarDatos2",
                data: '{ id:' + VALOR + ',tipo:3 }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d.Result) {
                        var parsedTest = JSON.parse(response.d.Data);
                        var metodo = "";
                        for (var i = 0; i < parsedTest.length; i++) {
                            if (parsedTest[i]['estado']) {
                                metodo = '<span class="label label-success">SI</span>';
                            } else {
                                metodo = '<span class="label label-danger">NO</span>';//zona
                            }
                            $('#tab tbody').append('<tr>' + '<td hidden>' + parsedTest[i]['idz'] + '</td><td>' + parsedTest[i]['nombre'] + '</td><td style="text-align: center;">' + parsedTest[i]['col'] + '</td><td style="text-align: center;">' + parsedTest[i]['cd'] + '</td><td style="text-align: center;">' + parsedTest[i]['std'] + '</td><td style="text-align: center;">' + parsedTest[i]['zona'] + '</td><td style="text-align: center;">' + metodo + '</td><td style="text-align: center;"><button type="button" class="btn btn-default btn-xs" onclick="carga(' + parsedTest[i]['idz'] + ')"><i class="fa fa-pencil"></i></button></td></tr>');
                        }
                        $("#tab").trigger("update").trigger("appendCache");
                        $("#tab").dataTable({
                            'language': { 'url': '//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json' }
                        });
                        inicio = false;
                    } else {
                    }
                },
                error: function (error) {
                    console.log("ERROR: " + error);
                }
            });

        }
    });
    function llenaCO() {
        $('#codigoFil').html('"<option value="-1"></option>"');
        $('#ZNSELEC4').html('"<option value="-1"></option>"');
        
        $('#ZNSELEC4 option:contains("")').attr('selected', 'selected');
        $('#codigoFil option:contains("")').attr('selected', 'selected');

        $.ajax({
            type: "POST",
            url: "Colonias.aspx/CargarDatos",
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                if (response.d.Result) {


                    var parsedTest = JSON.parse(response.d.Data);

                    var metodo = "";
                    for (var i = 0; i < parsedTest.length; i++) {
                        if (parsedTest[i]['estado']) {
                            $('#ZNSELEC4').append('<option value="' + parsedTest[i]['idz'] + '">' + parsedTest[i]['nombre'] + '</option>');
                            $('#codigoFil').append('<option value="' + parsedTest[i]['idz'] + '">' + parsedTest[i]['nombre'] + '</option>');
                           

                        } else {

                        }

                    }

                } else {


                }



            }, error: function (error) {
                console.log("ERROR: " + error);
            }
        });

    }
    $("select[id=codigoFil]").change(function () {
        llenarZona();
        llenarEdo();
        llenaCd();
       
        var VALOR = $('#codigoFil').val();
        alert(VALOR);
        if (VALOR == '-1') {
        } else {
            if (!inicio) $("#tab").dataTable().fnDestroy();
            $("#tab tbody").html("");
            $.ajax({
                type: "POST",
                url: "Arterias.aspx/CargarDatos2",
                data: '{ id:' + VALOR + ',tipo:4 }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d.Result) {
                        var parsedTest = JSON.parse(response.d.Data);
                        var metodo = "";
                        for (var i = 0; i < parsedTest.length; i++) {
                            if (parsedTest[i]['estado']) {
                                metodo = '<span class="label label-success">SI</span>';
                            } else {
                                metodo = '<span class="label label-danger">NO</span>';//zona
                            }
                            $('#tab tbody').append('<tr>' + '<td hidden>' + parsedTest[i]['idz'] + '</td><td>' + parsedTest[i]['nombre'] + '</td><td style="text-align: center;">' + parsedTest[i]['col'] + '</td><td style="text-align: center;">' + parsedTest[i]['cd'] + '</td><td style="text-align: center;">' + parsedTest[i]['std'] + '</td><td style="text-align: center;">' + parsedTest[i]['zona'] + '</td><td style="text-align: center;">' + metodo + '</td><td style="text-align: center;"><button type="button" class="btn btn-default btn-xs" onclick="carga(' + parsedTest[i]['idz'] + ')"><i class="fa fa-pencil"></i></button></td></tr>');
                        }
                        $("#tab").trigger("update").trigger("appendCache");
                        $("#tab").dataTable({
                            'language': { 'url': '//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json' }
                        });
                        inicio = false;
                    } else {
                    }
                },
                error: function (error) {
                    console.log("ERROR: " + error);
                }
            });

        }
    });
    function llenaCA() {
        $('#ZNSELECTIPO').html('"<option value="-1"></option>"');
        $('#ZNSELECTP').html('"<option value="-1"></option>"');

        $('#ZNSELECTIPO option:contains("")').attr('selected', 'selected');
        $('#ZNSELECTP option:contains("")').attr('selected', 'selected');

        $.ajax({
            type: "POST",
            url: "Arterias.aspx/CargarDatosCa",
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                if (response.d.Result) {


                    var parsedTest = JSON.parse(response.d.Data);

                    var metodo = "";
                    for (var i = 0; i < parsedTest.length; i++) {
                        if (parsedTest[i]['estado']) {
                            $('#ZNSELECTIPO').append('<option value="' + parsedTest[i]['idz'] + '">' + parsedTest[i]['nombre'] + '</option>');
                            $('#ZNSELECTP').append('<option value="' + parsedTest[i]['idz'] + '">' + parsedTest[i]['nombre'] + '</option>');


                        } else {

                        }

                    }

                } else {


                }



            }, error: function (error) {
                console.log("ERROR: " + error);
            }
        });

    }
    //-------------------------------------------------------------------------------------------------
    //-------------------------------------------------------------------------------------------------AGREGA
    $("select[id=ZNSELEC]").change(function () {
        var VALOR = $('#ZNSELEC').val();
        $('#ZNSELEC2').html('"<option value="-1"></option>"');
        $('#ZNSELEC2 option:contains("")').attr('selected', 'selected');
        if (VALOR == '-1') {
        } else {
            $.ajax({
                type: "POST",
                url: "Ciudades.aspx/CargarDatosEstadZN",
                data: '{ idzone:' + VALOR + ' }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d.Result) {
                        var parsedTest = JSON.parse(response.d.Data);
                        var metodo = "";
                        for (var i = 0; i < parsedTest.length; i++) {
                            if (parsedTest[i]['estado']) {
                                $('#ZNSELEC2').append('<option value="' + parsedTest[i]['idz'] + '">' + parsedTest[i]['nombre'] + '</option>');
                            } else {
                            }
                        }
                    } else {
                    }
                },
                error: function (error) {
                    console.log("ERROR: " + error);
                }
            });

        }
    });
    $("select[id=ZNSELEC2]").change(function () {
        var VALOR = $('#ZNSELEC2').val();
        $('#ZNSELEC3').html('"<option value="-1"></option>"');

        $('#ZNSELEC3 option:contains("")').attr('selected', 'selected');
        if (VALOR == '-1') {
        } else {
            $.ajax({
                type: "POST",
                url: "Colonias.aspx/CargarDatosCdEst",
                data: '{ idEst:' + VALOR + ' }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d.Result) {
                        var parsedTest = JSON.parse(response.d.Data);

                        for (var i = 0; i < parsedTest.length; i++) {
                            if (parsedTest[i]['estado']) {
                                $('#ZNSELEC3').append('<option value="' + parsedTest[i]['idz'] + '">' + parsedTest[i]['nombre'] + '</option>');
                            } else {
                            }
                        }
                    } else {
                    }
                },
                error: function (error) {
                    console.log("ERROR: " + error);
                }
            });
        }
    });
    $("select[id=ZNSELEC3]").change(function () {
        var VALOR = $('#ZNSELEC3').val();
        $('#ZNSELEC4').html('"<option value="-1"></option>"');

        $('#ZNSELEC4 option:contains("")').attr('selected', 'selected');
        if (VALOR == '-1') {
        } else {
            $.ajax({
                type: "POST",
                url: "Colonias.aspx/CargarDatos2",
                data: '{ id:' + VALOR + ',tipo:3 }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d.Result) {
                        var parsedTest = JSON.parse(response.d.Data);

                        for (var i = 0; i < parsedTest.length; i++) {
                            if (parsedTest[i]['estado']) {
                                $('#ZNSELEC4').append('<option value="' + parsedTest[i]['idz'] + '">' + parsedTest[i]['nombre'] + '</option>');
                            } else {
                            }
                        }
                    } else {
                    }
                },
                error: function (error) {
                    console.log("ERROR: " + error);
                }
            });
        }
    });
    //-------------------------------------------------------------------------------------------------
    //-------------------------------------------------------------------------------------------------GUARDAR
    function Guardar() {
        // Nombre zona estado ciudad
        //Nombre
        var res = $.trim($("#nombreCol").val());
        var Nombre = res.toUpperCase();
        //Zona
        var IDZon = $("#ZNSELEC").val();
        //Estado
        var IDEst = $("#ZNSELEC2").val();
        //Ciudad
        var IDCd = $("#ZNSELEC3").val();
        //Colonia
        var IDCol = $("#ZNSELEC4").val();
        //Tipo
        var IDTipo = $("#ZNSELECTIPO").val();

        if (Nombre == "") {
            toastr.error("Ingrese un nombre.", "Advertencia");
        } else {
            
            if (IDZon < 0 || IDEst < 0 || IDCd < 0 || IDCol < 0) {
                toastr.error("Faltan campos, la calle se almacenara con campos faltantes *Zona, Estado ,Ciudad o Colonia.", "Advertencia");
            } else if (IDZon <= 0) {
                IDZon = 1;
            } else if (IDEst <= 0) {
                IDEst = 1;
            } else if (IDCd <= 0) {
                IDCd = 1;
            } else if (IDCol <= 0) {
                IDCol = 1;
            } else if (IDTipo <= 0) {
                IDTipo = 1;
            } else {
                //Guardar
                $.ajax({
                    type: "POST",
                    url: "Arterias.aspx/GuardaArt",
                    data: '{ Nombre:"' + Nombre + '", Zona:' + IDZon + ',Edo:' + IDEst + ',Cd:' + IDCd + ', Col:' + IDCol + ', Tp:' + IDTipo + ' }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d.Result) {
                            
                            Limpiar();
                            toastr.success("La calle ha sido agregada correctamente", "Éxito");
                        } else {
                            
                            Limpiar();
                        }
                    },
                    error: function (error) {
                        console.log("ERROR: " + error);
                    }
                });
            }
        }
    }
    //-------------------------------------------------------------------------------------------------
    //-------------------------------------------------------------------------------------------------Cargar por Id
    function carga(idArt) {
        GBLIDART = idArt;
        $.ajax({
            type: "POST",
            url: "Arterias.aspx/Unaart",
            data: '{ Id:"' + idArt + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                if (response.d.Result) {
                    var parsedTest = JSON.parse(response.d.Data);
                    var metodo = "";
                    for (var i = 0; i < parsedTest.length; i++) {
                        //Nombre Colonia
                        $("#txtZona").val(parsedTest[i]['nombre']);
                        //Zona
                        var zn = parsedTest[i]['zona'];
                        var ty = parsedTest[i]['tipo'];
                        $('#ZNSELECTP option:contains("' + ty + '")').attr('selected', 'selected');
                       $('#ZNSELEC5 option:contains("' + zn + '")').attr('selected', 'selected');
                        //Estado
                        var esd = parsedTest[i]['std'];
                        var esdid = parsedTest[i]['stdid'];
                        $('#ZNSELEC6').html('<option value="' + esdid + '">' + esd + '</option>');
                        //Ciudad
                        var CDS = parsedTest[i]['cd'];
                        var cdsid = parsedTest[i]['cdsid'];
                        $('#ZNSELEC7').html('<option value="' + cdsid + '">' + CDS + '</option>');
                        //Colonia
                        var COL = parsedTest[i]['col'];
                        var colid = parsedTest[i]['colid'];
                        $('#ZNSELEC8').html('<option value="' + colid + '">' + COL + '</option>');
                        //Acivo
                        if (parsedTest[i]['estado']) {
                            $("#checkss").iCheck('check');
                        } else {
                            $("#checkss").iCheck('uncheck');
                        }
                    }
                    $('#mdAgrega').modal('show');
                }
            },
            error: function (error) {
                console.log("ERROR: " + error);
            }
        });
        $('#mdAgrega').modal('show');
    }
    $("select[id=ZNSELEC5]").change(function () {
        var VALOR = $('#ZNSELEC5').val();
        $('#ZNSELEC6').html('"<option value="-1"></option>"');
        $('#ZNSELEC6 option:contains("")').attr('selected', 'selected');
        if (VALOR == '-1') {
        } else {
            $.ajax({
                type: "POST",
                url: "Ciudades.aspx/CargarDatosEstadZN",
                data: '{ idzone:' + VALOR + ' }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d.Result) {
                        var parsedTest = JSON.parse(response.d.Data);
                        var metodo = "";
                        for (var i = 0; i < parsedTest.length; i++) {
                            if (parsedTest[i]['estado']) {
                                $('#ZNSELEC6').append('<option value="' + parsedTest[i]['idz'] + '">' + parsedTest[i]['nombre'] + '</option>');
                            } else {
                            }
                        }
                    } else {
                    }
                },
                error: function (error) {
                    console.log("ERROR: " + error);
                }
            });

        }
    });
    $("select[id=ZNSELEC6]").change(function () {
        var VALOR = $('#ZNSELEC6').val();
        $('#ZNSELEC7').html('"<option value="-1"></option>"');

        $('#ZNSELEC7 option:contains("")').attr('selected', 'selected');
        if (VALOR == '-1') {
        } else {
            $.ajax({
                type: "POST",
                url: "Colonias.aspx/CargarDatosCdEst",
                data: '{ idEst:' + VALOR + ' }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d.Result) {
                        var parsedTest = JSON.parse(response.d.Data);

                        for (var i = 0; i < parsedTest.length; i++) {
                            if (parsedTest[i]['estado']) {
                                $('#ZNSELEC7').append('<option value="' + parsedTest[i]['idz'] + '">' + parsedTest[i]['nombre'] + '</option>');
                            } else {
                            }
                        }
                    } else {
                    }
                },
                error: function (error) {
                    console.log("ERROR: " + error);
                }
            });
        }
    });
    $("select[id=ZNSELEC7]").change(function () {
        var VALOR = $('#ZNSELEC7').val();
        $('#ZNSELEC8').html('"<option value="-1"></option>"');

        $('#ZNSELEC8 option:contains("")').attr('selected', 'selected');
        if (VALOR == '-1') {
        } else {
            $.ajax({
                type: "POST",
                url: "Colonias.aspx/CargarDatos2",
                data: '{ id:' + VALOR + ',tipo:3 }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d.Result) {
                        var parsedTest = JSON.parse(response.d.Data);

                        for (var i = 0; i < parsedTest.length; i++) {
                            if (parsedTest[i]['estado']) {
                                $('#ZNSELEC8').append('<option value="' + parsedTest[i]['idz'] + '">' + parsedTest[i]['nombre'] + '</option>');
                            } else {
                            }
                        }
                    } else {
                    }
                },
                error: function (error) {
                    console.log("ERROR: " + error);
                }
            });
        }
    });
    function actualizar() {
        //Nombre
        var res = $.trim($("#txtZona").val());
        var Nombre = res.toUpperCase();
        //Zona
        GBLIDZONA = $('#ZNSELEC5').val();
        //Estado
        GBLIDEST = $('#ZNSELEC6').val();
        //Ciudad
        GBLIDCD = $('#ZNSELEC7').val();
        //Colonia
        GBLIDCOL = $('#ZNSELEC8').val();
        //Tipo
        var IDTipo = $("#ZNSELECTP").val();
        //Activo
        var activo = true;
        var Activo = document.getElementById('checkss');
        if (Activo.checked) {
            activo = true;
        } else {
            activo = false;
        }

        if (GBLIDEST < 0) {
            toastr.error("Seleccione un estado.", "Advertencia");
        } else {
            if (GBLIDCD < 0) {
                toastr.error("Seleccione una ciudad.", "Advertencia"); 
            } else {
                if (GBLIDCOL < 0) {
                    toastr.error("Seleccione una colonia.", "Advertencia");
                } else {

                    //Hubo cambios
                    $.ajax({
                        type: "POST",
                        url: "Arterias.aspx/UnaartAct",
                        data: '{ Id:' + GBLIDART + ',idZ:' + GBLIDZONA + ',idE:' + GBLIDEST + ',idC:' + GBLIDCD + ',idCo:' + GBLIDCOL + ',Nombre:"' + Nombre + '",stado:' + activo + ' , tipo:' + IDTipo + '}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            if (response.d.Result) {

                                Limpiar();
                                $('#mdAgrega').modal('hide');
                                toastr.success("La calle ha sido actualizada correctamente", "Éxito");
                            }
                        },
                        error: function (error) {
                            console.log("ERROR: " + error);
                        }
                    });

                }

               
            }
        }
    }
</script>


</asp:Content>
