﻿<%@ Page Title="" Language="C#" MasterPageFile="~/CallCenter/CallCenter.Master" AutoEventWireup="true" CodeBehind="Colonias.aspx.cs" Inherits="WA_CombugasCC.CallCenter.Colonias" %>
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
                    <h1>Colonias</h1>
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
                        <span>Colonias</span>
                    </li>
                </ul>
                <div class="page-content-inner" style="min-height: 400px;">
                    <div class="row">
                        <div class="col-md-12 col-sm-12">
                            <div class="portlet light ">       
                                <div class="portlet-body">
                                    <div class="row">
                                    <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12"></div>
                                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">           
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <center><h3 >Agregar una colonia nueva.</h3></center>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <label style="margin-top: 30px;">Nombre de la colonia.</label>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-top:5px;margin-bottom:10px;">
                                            <input id="nombreCol" class="form-control" type="text"/>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <label>Selecciona una zona.</label>
                                        </div>
                                        <div class=" col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-top:5px;margin-bottom:10px;">
                                            <select class="js-example-basic-single form-control col-md-12 col-sm-12 col-xs-12" id="ZNSELEC">
                                                 <option value="-1"></option>
                                            </select>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <label>Selecciona un estado.</label>
                                        </div>
                                        <div class=" col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-top:5px;margin-bottom:10px;">
                                            <select class="js-example-basic-single form-control col-md-12 col-sm-12 col-xs-12" id="ZNSELEC2">
                                                 <option value="-1" disabled>Primero: seleccione una zona.</option>
                                            </select>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <label>Selecciona una ciudad.</label>
                                        </div>
                                        <div class=" col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-top:5px;margin-bottom:10px;">
                                            <select class="js-example-basic-single form-control col-md-12 col-sm-12 col-xs-12" id="ZNSELEC3">
                                                 <option value="-1" >Primero: seleccione un estado</option>
                                            </select>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <right><button id="btnguardar" class="btn red pull-right" type="button" style="margin-top: 15px !important;" onclick="Guardar()">Guardar</button></right>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12"></div>
                                     <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-top:10px;">
                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12"></div>
                                        <div id="alertaCont" class="col-lg-8 col-md-8 col-sm-12 col-xs-12 alert alert-danger alert-dismissable" style="display:none;">
                                            <center><strong id="mensajs">Agregar un nombre.</strong></center>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12"></div>
                                    </div>
                                         <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="border-bottom:3px #eff3f8 solid;margin-top:10px;margin-bottom:10px;"></div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">      
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <center><h3 >Listado de colonias.</h3></center>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">   
                                            <table class="table table-hover table-bordered "  id="tab">
                                                <thead style="background:#e7505a;">
                                                    <tr>
                                                        <th hidden>ID</th>
                                                        <th  style="color:white;">Nombre</th>
                                                        <th style="text-align: center; color:white;" >Ciudad</th>
                                                        <th style="text-align: center; color:white;" >Estado</th>
                                                        <th style="text-align: center; color:white;" >Zona</th>
                                                        <th style="text-align: center; color:white;" >¿Activo?</th>
                                                        <th style="text-align: center; color:white;" >Editar</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="tablecols">
                                                   
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
    </div>
    <a href="javascript:;" class="page-quick-sidebar-toggler">
                
    </a>
</div>

    <%-- Modal --%>
    
     <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="mdAgrega">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span></button>
        <h4 class="modal-title" >Editar colonia</h4>
      </div>
      <div class="modal-body" >
          <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12" >
            <label class="col-md-2 col-sm-2 col-xs-12" >Colonia<span >* :</span></label>
            <div class="col-md-10 col-sm-10 col-xs-12">
              <input type="text" id="txtZona" required class="form-control col-md-7 col-xs-12 " value="">
            </div>
          </div> 
              <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top:15px;">
            <label class=" col-md-2 col-sm-2 col-xs-12" >Zona<span>*:</span>
            </label>
            <div class=" col-md-10 col-sm-10 col-xs-12">
                   <select class="js-example-basic-single form-control col-md-12 col-sm-12 col-xs-12" id="ZNSELEC4">
                         <option value="-1"></option>
                   </select>
            </div>
            </div> 
          <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top:15px;">
            <label class=" col-md-2 col-sm-2 col-xs-12" >Estado<span>*:</span>
            </label>
            <div class=" col-md-10 col-sm-10 col-xs-12">
                   <select class="js-example-basic-single form-control col-md-12 col-sm-12 col-xs-12" id="ZNSELEC5">
                         <option value="-1"></option>
                   </select>
            </div>
            </div>
              <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top:15px;">
            <label class=" col-md-2 col-sm-2 col-xs-12" >Ciudad<span>*:</span>
            </label>
            <div class=" col-md-10 col-sm-10 col-xs-12">
                   <select class="js-example-basic-single form-control col-md-12 col-sm-12 col-xs-12" id="ZNSELEC6">
                         <option value="-1"></option>
                   </select>
            </div>
            </div>
          <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top:15px;">
            <label class=" col-md-2 col-sm-2 col-xs-12" >Activo<span>*:</span>
            </label>
            <div class=" col-md-10 col-sm-10 col-xs-12">
                   <input id="checkss" name="checkss" type="checkbox" style="opacity: 1;" >
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


     <script src="../assets/global/plugins/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        var inicio = true;
        var GBLIDZONA = -1;
        var GBLIDEST = -1;
        var GBLIDCD = -1;
        var GBLIDCOL = -1;
        //Inicializar Cargar zonas y colonias
        $(document).ready(function () {
            $("#ZNSELEC3").select2();
            llenarZona();
            actualizaTabla();
        });
        function llenarZona() {
            $('#ZNSELEC').html('"<option value="-1"></option>"');
            $('#ZNSELEC option:contains("")').attr('selected', 'selected');
            $('#ZNSELEC4').html('"<option value="-1"></option>"');
            $('#ZNSELEC4 option:contains("")').attr('selected', 'selected');

            $('#ZNSELEC2').html('"<option value="-1">Primero: seleccione una zona.</option>"');
            $('#ZNSELEC3').html('"<option value="-1">Primero: seleccione un estado.</option>"');
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
                                $('#ZNSELEC4').append('<option value="' + parsedTest[i]['idz'] + '">' + parsedTest[i]['nombre'] + '</option>');
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
        function actualizaTabla() {
            if (!inicio) $("#tab").dataTable().fnDestroy();
            $("#tab tbody").html("");
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
                                metodo = '<span class="label label-success">SI</span>';
                            } else {
                                metodo = '<span class="label label-danger">NO</span>';//zona
                            }
                            $('#tab tbody').append('<tr>' + '<td hidden>' + parsedTest[i]['idz'] + '</td><td>' + parsedTest[i]['nombre'] + '</td><td style="text-align: center;">' + parsedTest[i]['cd'] + '</td><td style="text-align: center;">' + parsedTest[i]['std'] + '</td><td style="text-align: center;">' + parsedTest[i]['zona'] + '</td><td style="text-align: center;">' + metodo + '</td><td style="text-align: center;"><button type="button" class="btn btn-default btn-xs" onclick="carga(' + parsedTest[i]['idz'] + ')"><i class="fa fa-pencil"></i></button></td></tr>');
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
            $("#ZNSELEC3").select2("val", "");
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
        function Guardar() {
            // Nombre zona estado ciudad
            //Nombre
            var  res= $.trim($("#nombreCol").val());
            var Nombre = res.toUpperCase();
            //Zona
            var IDZon = $("#ZNSELEC").val();
            //Estado
            var IDEst = $("#ZNSELEC2").val();
            //Ciudad
            var IDCd = $("#ZNSELEC3").val();
            if (Nombre == "") {
                document.getElementById('alertaCont').style.display = 'block';
            } else {
                document.getElementById('alertaCont').style.display = 'none';
                if (IDZon<0 || IDEst <0 || IDCd<0) {

                } else {
                    //Guardar
                    $.ajax({
                        type: "POST",
                        url: "Colonias.aspx/GuardaCol",
                        data: '{ Nombre:"' + Nombre + '", Zona:' + IDZon + ',Edo:' + IDEst + ',Cd:' + IDCd + ' }',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            if (response.d.Result) {
                                document.getElementById('alertaCont').style.display = 'none';
                                $("#nombreCol").val('');
                                llenarZona();                             
                                actualizaTabla();
                            } else {
                                $("#mensajs").html(response.d.Message);
                                document.getElementById('alertaCont').style.display = 'block';
                                llenarZona();                          
                                actualizaTabla();
                            }
                        },
                        error: function (error) {
                            console.log("ERROR: " + error);
                        }
                    });
                }
            }
        }

        function carga(idCol) {
            GBLIDCOL = idCol;

            $.ajax({
                type: "POST",
                url: "Colonias.aspx/Unacol",
                data: '{ Id:"' + idCol + '" }',
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
                            $('#ZNSELEC4 option:contains("' + zn + '")').attr('selected', 'selected');
                            //Estado
                            var esd = parsedTest[i]['std'];
                            var esdid = parsedTest[i]['stdid'];
                            $('#ZNSELEC5').html('<option value="' + esdid + '">' + esd + '</option>');
                            //Ciudad
                            var CDS = parsedTest[i]['cd'];
                            var cdsid = parsedTest[i]['cdsid'];
                            $('#ZNSELEC6').html('<option value="' + cdsid + '">' + CDS + '</option>');
                            //Acivo
                            if (parsedTest[i]['estado']) {
                                $("#checkss").prop("checked", true);
                            } else {
                                $("#checkss").prop("checked", false);
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
        $("select[id=ZNSELEC4]").change(function () {// Modal ZOna
            var VALOR = $('#ZNSELEC4').val();
            $('#ZNSELEC5').html('"<option value="-1"></option>"');
            $('#ZNSELEC6').html('"<option value="-1"></option>"');
            $('#ZNSELEC5 option:contains("")').attr('selected', 'selected');
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
                                    $('#ZNSELEC5').append('<option value="' + parsedTest[i]['idz'] + '">' + parsedTest[i]['nombre'] + '</option>');
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
        $("select[id=ZNSELEC5]").change(function () {// modal estados
            var VALOR = $('#ZNSELEC5').val();
            $('#ZNSELEC6').html('"<option value="-1"></option>"');
            $('#ZNSELEC6 option:contains("")').attr('selected', 'selected');
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
        function actualizar() {
            //Nombre
            var res = $.trim($("#txtZona").val());
            var Nombre = res.toUpperCase();
            //Zona
            GBLIDZONA = $('#ZNSELEC4').val();
            //Estado
            GBLIDEST = $('#ZNSELEC5').val();
            //Ciudad
            GBLIDCD = $('#ZNSELEC6').val();
            //Activo
            var activo = true;
            var Activo = document.getElementById('checkss');
            if (Activo.checked) {
                activo = true;
            } else {
                activo = false;
            }

            //alert(Nombre);
            //alert(GBLIDZONA);
            //alert(GBLIDEST);
            //alert(GBLIDCD);
            //alert(GBLIDCOL);
            //alert(activo);
            if (GBLIDEST < 0) {
                alert('Seleccione un estado.');
            } else {
                if (GBLIDCD < 0) {
                    alert('Seleccione una ciudad.');
                } else {

                
                    //Hubo cambios
                    $.ajax({
                        type: "POST",
                        url: "Colonias.aspx/UnacolAct",
                        data: '{ Id:' + GBLIDCOL + ',idZ:' + GBLIDZONA + ',idE:' + GBLIDEST + ',idC:'+GBLIDCD+',Nombre:"' + Nombre + '",stado:' + activo + ' }',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            if (response.d.Result) {
                                
                                llenarZona();
                                actualizaTabla();
                                $('#mdAgrega').modal('hide');
                            }
                        },
                        error: function (error) {
                            console.log("ERROR: " + error);
                        }
                    });
                }
            }
        }
    </script>
   
</asp:Content>
