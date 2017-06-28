<%@ Page Title="" Language="C#" MasterPageFile="~/CallCenter/CallCenter.Master" AutoEventWireup="true" CodeBehind="asentamientos.aspx.cs" Inherits="WA_CombugasCC.CallCenter.asentamientos" %>
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
                    <h1>Tipo de asentamiento.</h1>
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
                        <span>Tipo de asentamiento</span>
                    </li>
                </ul>
                <div class="page-content-inner" style="min-height: 400px;">
                    <div class="row">
                        
                   
                                <div class="col-md-9 col-sm-12">
                                    <div class="row">
                                    <div class="portlet light ">
                                        <div class="portlet-title">
                                            <div class="caption caption-md">
                                                Lista de Tipos de asentamiento
                                            </div>
                                        </div>
                                        <div class="portlet-body">
                                            <table class="table table-striped table-bordered table-hover dt-responsive" width="100%" id="tab" cellspacing="0" width="100%">
                                                <thead>
                                                    <tr>
                                                        <th class="all" hidden>ID</th>
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


                        <div class="col-md-3 col-sm-12">
                            <div class="portlet light ">  
                                <div class="portlet-title">
                                            <div class="caption caption-md">
                                                Agregar un asentamiento.
                                            </div>
                                        </div>     
                                <div class="portlet-body">
                                    <div class="row">
                                    
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">           
                                       
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <label style="margin-top: 5px;">Nombre del asentamiento.</label>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <input id="nombrezona" class="form-control" type="text"/>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <right><button id="btnguardar" class="btn red pull-right" type="button" style="margin-top:15px !important;" onclick="Guardar();">Guardar</button></right>
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
    </div>
<div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="mdAgrega">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span></button>
        <h4 class="modal-title" >Modificar asentamiento</h4>
      </div>
      <div class="modal-body" >
          <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12" >
            <label class="col-md-3 col-sm-3 col-xs-12" >Asentamiento<span >* :</span></label>
            <div class="col-md-9 col-sm-9 col-xs-12">
              <input type="text" id="txtZona" required class="form-control col-md-7 col-xs-12 " value="">
            </div>
          </div> 
          
          <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top:15px;">
            <label class=" col-md-3 col-sm-3 col-xs-12" >Activo<span>*:</span>
            </label>
            <div class=" col-md-9 col-sm-9 col-xs-12">
                   <input id="checkss" name="checkss" type="checkbox"  class="icheck" >
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
                url: "asentamientos.aspx/CargarDatos",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) { 
                    if (response.d.Result) {
                        var parsedTest = JSON.parse(response.d.Data);          
                        var metodo="";
                        for (var i = 1; i < parsedTest.length; i++) {
                            if(parsedTest[i]['estado']){
                                metodo='<span class="label label-success">Activo</span>';
                            }else {
                                metodo='<span class="label label-danger">Inactivo</span>';
                            }
                            $('#tab tbody').append('<tr>' + '<td hidden>' + parsedTest[i]['idz'] + '</td><td>' + parsedTest[i]['nombre'] + '</td><td style="text-align: center;">' + metodo + '</td><td style="text-align: center;"><button type="button" class="btn btn-default btn-xs" onclick="carga(' + parsedTest[i]['idz'] + ')"><i class="fa fa-edit"></i></button></td></tr>');

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
        
        function Guardar() {
           
            var  res= $.trim($("#nombrezona").val());
            var Nombre = res.toUpperCase();
            if (Nombre == "") {
                toastr.error("Ingrese un nombre del asentamiento.", "Advertencia");
               
            } else {
                
                $.ajax({
                    type: "POST",
                    url: "asentamientos.aspx/Guarda",
                    data: '{ Nombre:"' + Nombre + '" }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d.Result) {
                            $("#nombrezona").val('');
                            actualizaTabla();
                            toastr.success("El asentamiento ha sido agregado correctamente", "Éxito");
                        } else {
                            toastr.error("No es posible agregar.", "Advertencia");
                            
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
                url: "asentamientos.aspx/Un",
                data: '{ Id:"' + idzona + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {

                    var parsedTest = JSON.parse(response.d.Data);

                    var metodo = "";
                    for (var i = 0; i < parsedTest.length; i++) {
                        $("#txtZona").val(parsedTest[i]['nombre']);
                        if (parsedTest[i]['estado']) {
                            $("#checkss").iCheck('check');
                        } else {
                            $("#checkss").iCheck('uncheck');
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

                if (Nombre == "") {
                    toastr.error("Ingrese un nombre del asentamiento.", "Advertencia");

                } else {


                    $.ajax({
                        type: "POST",
                        url: "asentamientos.aspx/UnazonaAct",
                        data: '{ Id:"' + GBLIDZONA + '",Nombre:"' + Nombre + '",stado:"' + marcado + '" }',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            actualizaTabla();
                            $('#mdAgrega').modal('hide');
                            toastr.success("El asentamiento ha sido actualizada correctamente", "Éxito");
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
