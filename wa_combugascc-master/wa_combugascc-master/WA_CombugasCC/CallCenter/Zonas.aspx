<%@ Page Title="" Language="C#" MasterPageFile="~/CallCenter/CallCenter.Master" AutoEventWireup="true" CodeBehind="Zonas.aspx.cs" Inherits="WA_CombugasCC.CallCenter.Zonas" %>
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
                    <h1>Zonas.</h1>
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
                        <span>Zonas</span>
                    </li>
                </ul>
                <div class="page-content-inner" style="min-height: 400px;">
                    <div class="row">
                        <div class="col-md-4 col-sm-12">
                            <div class="portlet light ">       
                                <div class="portlet-body">
                                    <div class="row">
                                    
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">           
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <center><h3 >Agregar una zona nueva.</h3></center>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <label style="margin-top: 30px;">Nombre de la zona.</label>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <input id="nombrezona" class="form-control" type="text"/>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <right><button id="btnguardar" class="btn red pull-right" type="button" style="margin-top:15px !important;" onclick="Guardar();">Guardar</button></right>
                                        </div>
                                       
                                    </div>
                                  
                                        
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-top:10px;">
                                        
                                        <div id="alertaCont" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 alert alert-danger alert-dismissable" style="display:none;">
                                            <center><strong id="mensajs">Agregar un nombre.</strong></center>
                                        </div>
                                       
                                    </div>
                                
                                    </div>
                                        
                                </div>
                            </div>
                        </div>
                           <div class="col-md-8 col-sm-12">
                            <div class="portlet light ">       
                                <div class="portlet-body">
                                    <div class="row">
                                                             
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">      
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <center><h3 >Listado de zonas.</h3></center>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">   
                                            <table class="table table-hover table-bordered "  id="tab">
                                                <thead style="background:#e7505a;">
                                                    <tr>
                                                        <th hidden>ID</th>
                                                        <th  style="color:white;">Nombre</th>
                                                        <th style="text-align: center; color:white; width:40px;" >¿Activo?</th>
                                                        <th style="text-align: center; color:white; width:40px;" >Editar</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="tablezonas">
                                                    
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
<div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="mdAgrega">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span></button>
        <h4 class="modal-title" >Editar zona</h4>
      </div>
      <div class="modal-body" >
          <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12" >
            <label class="col-md-2 col-sm-2 col-xs-12" >Zona<span >* :</span></label>
            <div class="col-md-10 col-sm-10 col-xs-12">
              <input type="text" id="txtZona" required class="form-control col-md-7 col-xs-12 " value="">
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

    <script src="../assets/global/plugins/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        var inicio = true;
        var GBLIDZONA = -1;
        $(document).ready(function () {
           
            //$(".js-example-basic-single").select2();
            actualizaTabla();
        });
        
        function actualizaTabla() {
            if (!inicio) $("#tab").dataTable().fnDestroy();
            $("#tab tbody").html("");
            var CategoriasProductos;
            $.ajax({
                type: "POST",
                url: "Zonas.aspx/CargarDatos",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) { 
                    if (response.d.Result) {
                        
                        

                        var parsedTest = JSON.parse(response.d.Data);
                
                        var metodo="";
                        for (var i = 0; i < parsedTest.length; i++) {
                            if(parsedTest[i]['estado']){
                                metodo='<span class="label label-success">SI</span>';
                            }else {
                                metodo='<span class="label label-danger">NO</span>';
                            }
                            $('#tab tbody').append('<tr>' + '<td hidden>' + parsedTest[i]['idz'] + '</td><td>' + parsedTest[i]['nombre'] + '</td><td style="text-align: center;">' + metodo + '</td><td style="text-align: center;"><button type="button" class="btn btn-default btn-xs" onclick="carga(' + parsedTest[i]['idz'] + ')"><i class="fa fa-pencil"></i></button></td></tr>');

                        }
                        $("#tab").trigger("update").trigger("appendCache");
                        $("#tab").dataTable({
                            'language': { 'url': '//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json' }
                        });
                        inicio = false;
                    } else {
                       

                    }
                    
                }
            });

           
        }
        
        function Guardar() {
           
            var  res= $.trim($("#nombrezona").val());
            var Nombre = res.toUpperCase();
            if (Nombre == "") {
                document.getElementById('alertaCont').style.display = 'block';
            } else {
                document.getElementById('alertaCont').style.display = 'none';
                $.ajax({
                    type: "POST",
                    url: "Zonas.aspx/Guardazona",
                    data: '{ Nombre:"' + Nombre + '" }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d.Result) {
                            $("#nombrezona").val('');
                            actualizaTabla();
                        } else {
                            $("#mensajs").html(response.d.Message);
                            document.getElementById('alertaCont').style.display = 'block';
                            actualizaTabla();
                            
                        }
                    },
                    error: function (error) {
                        console.log("ERROR: " + error);
                    }
                });
               
            }
        }
        function carga(idzona) {
            GBLIDZONA = idzona;
           
            $.ajax({
                type: "POST",
                url: "Zonas.aspx/Unazona",
                data: '{ Id:"' + idzona + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {

                    var parsedTest = JSON.parse(response.d.Data);

                    var metodo = "";
                    for (var i = 0; i < parsedTest.length; i++) {
                        $("#txtZona").val(parsedTest[i]['nombre']);
                        if (parsedTest[i]['estado']) {
                            $("#checkss").prop("checked", true);
                        } else {
                            $("#checkss").prop("checked", false);
                        }
                        
                    }
                    $('#mdAgrega').modal('show');
                  













                   
                },
                error: function (error) {
                    console.log("ERROR: " + error);
                }
            });
        }
        function actualizar() {
            if (GBLIDZONA==-1) {

            } else {
                var res = $.trim($("#txtZona").val());
                var Nombre = res.toUpperCase();
                var marcado = $("#checkss").prop("checked") ? true : false;
            $.ajax({
                type: "POST",
                url: "Zonas.aspx/UnazonaAct",
                data: '{ Id:"' + GBLIDZONA + '",Nombre:"' + Nombre + '",stado:"'+marcado+'" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    actualizaTabla();
                    $('#mdAgrega').modal('hide');
                },
                error: function (error) {
                    console.log("ERROR: " + error);
                }
            });

            }
        }
</script>
</asp:Content>

