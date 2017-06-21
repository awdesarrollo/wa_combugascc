<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Modulos.aspx.cs" Inherits="WA_CombugasCC.Admin.Modulos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="page-container" >
            <div class="page-content-wrapper">
                <div class="page-head">
                    <div class="container">
                        <div class="page-title">
                            <h1>Modulos</h1>
                        </div>
                    </div>
                </div>
                <div class="page-content">
                    <div class="container">

                        <div class="page-content-inner" style="min-height: 400px;">
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                    <div class="portlet light ">
                                        <div class="portlet-title">
                                            <div class="caption caption-md">
                                                Datos de Modulos
                                            </div>
                                        </div>
                                        <div class="portlet-body">
                                          <div class="row">
                                              <div class="col-md-6">
                                                  <input type="hidden" id="hdidmodulo" value="0" />
                                                  <label>Titulo *</label>
                                                  <input type="text" id="txtTitulo" class="form-control" />
                                              </div>
                                              <div class="col-md-6">
                                                  <label>Descripción *</label>
                                                  <input type="text" id="txtDescripcion" class="form-control" />
                                              </div>
                                          </div>
                                          <div class="row" style="margin-top: 20px;">
                                              <div class="col-md-6">
                                                  <label>Archivo (.aspx) *</label>
                                                  <input type="text" id="txtUrlModulo" class="form-control" />
                                              </div>
                                              <div class="col-md-3">
                                                  <label>
                                                  <input type="checkbox" id="ckActivo" class="icheck" checked> Activo</label>
                                              </div>
                                              <div class="col-md-3">
                                                  <label>Modulo pertenece a:</label>
                                                  <select id="cbPadre" class="form-control">

                                                  </select>
                                              </div>
                                          </div>
                                          <div class="row" style="margin-top: 20px;">
                                              <div class="col-md-12" style="margin-top: 20px;">
                                                    <button class="btn btn-danger" id="btnGuardar" type="button">Guardar</button>
                                                    <button class="btn btn-danger" id="btnEditar" type="button" style="display: none;">Editar</button>&nbsp;
                                                    <button class="btn btn-default" id="btnLimpiar" type="button">Limpiar</button>
                                                </div>
                                          </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-12 col-sm-12">
                                    <div class="portlet light ">
                                        <div class="portlet-title">
                                            <div class="caption caption-md">
                                                Lista de Modulos
                                            </div>
                                        </div>
                                        <div class="portlet-body">
                                          <table class="table table-striped table-bordered table-hover dt-responsive" width="100%" id="tablaModulos" cellspacing="0" width="100%">
                                                <thead>
                                                    <tr>
                                                        <th class="all">Titulo</th>
                                                        <th class="all">Descripción</th>
                                                        <th class="all">Estatus</th>
                                                        <th class="all">Acciones</th>
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

        cargaPadre();

        function cargaPadre() {
            $.ajax({
                type: "POST",
                url: "Modulos.aspx/CargaPadre",
                data: '{ }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (response) {
                    if (response.d.Result) {
                        var data = JSON.parse(response.d.Data);
                        var options = '<option value="0">Es nuevo Modulo Padre</option>';
                        for (var i = 0; i < data.length; i++) {
                            options += '<option value="' + data[i].idmodulo + '">' + data[i].descripcion + '</option>';
                        }
                        $("#cbPadre").html(options);
                    }

                },
                error: function (error) {
                    console.log("ERROR: " + JSON.stringify(error));
                }
            });
        }

        var tablaModulos = $('#tablaModulos').dataTable({
            "language": {
                "url": '//cdn.datatables.net/plug-ins/3cfcc339e89/i18n/Spanish.json'
            },
            buttons: [
                //{ extend: 'print', className: 'btn dark btn-outline' },
                //{ extend: 'pdf', className: 'btn green btn-outline' },
                //{ extend: 'csv', className: 'btn purple btn-outline ' }
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

        cargarModulos();

        function cargarModulos() {
            $.ajax({
                type: "POST",
                url: "Modulos.aspx/CargaModulos",
                data: '{ }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (response) {
                    var datos = JSON.parse(response.d.Data);
                    tablaModulos.fnClearTable();
                    for (var i = 0; i < datos.length; i++) {
                        var estatus = "";
                        if (datos[i].estatus) {
                            estatus = '<label class="label label-success label-sm">Activo</label>';
                        } else {
                            estatus = '<label class="label label-danger label-sm">Inactivo</label>';
                        }
                        tablaModulos.fnAddData([datos[i].titulo, datos[i].descripcion, estatus, '<button type="button" onclick="editarModulo(' + datos[i].idmodulo + ')" class="btn btn-default"><span class="fa fa-edit"></span></button>']);
                    }
                },
                error: function (error) {
                    console.log(error);
                }
            });
        }

        function limpiar() {
            $("#hdidmodulo").val(0);
            $("#txtTitulo").val("");
            $("#txtUrlModulo").val("");
            $("#txtDescripcion").val("");
            $("#cbPadre").val(0);
            $("#btnGuardar").show("fast");
            $("#btnEditar").hide("fast");
            cargarModulos();
            cargaPadre();
        }

        function editarModulo(idmodulo) {
            $("#hdidmodulo").val(idmodulo);
            $.ajax({
                type: "POST",
                url: "Modulos.aspx/ObtieneModuloId",
                data: '{ idmodulo: "' + idmodulo + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                //async: false,
                success: function (response) {
                    if (response.d.Result) {
                        var datos = JSON.parse(response.d.Data);
                        $("#txtTitulo").val($.trim(datos.titulo));
                        $("#txtUrlModulo").val($.trim(datos.url));
                        $("#txtDescripcion").val($.trim(datos.descripcion));
                        $("#cbPadre").val(datos.idpadre);

                        if (datos.estatus) {
                            $('#ckActivo').iCheck('check');
                        } else {
                            $('#ckActivo').iCheck('uncheck');
                        }

                        $("#txtTitulo").focus();

                        $("#btnGuardar").hide("fast");
                        $("#btnEditar").show("show");

                    } else {
                        toastr.error(response.d.Message, "Problema al agregar");
                    }
                },
                error: function (error) {
                    console.log(error);
                }
            });
        }

        $("#btnLimpiar").click(function () {
            limpiar();
        });

        $("#btnEditar").click(function () {
            if ($.trim($("#txtTitulo").val()) == "" || $.trim($("#txtUrlModulo").val()) == "" || $.trim($("#txtDescripcion").val()) == "") {
                toastr.error("Falta captura de datos requeridos (*)", "Datos requeridos");
            } else {
                var titulo = $("#txtTitulo").val();
                var archivo = $("#txtUrlModulo").val();
                var estatus = ($('#ckActivo').parent('[class*="icheckbox"]').hasClass("checked") ? true : false);
                var idpadre = $("#cbPadre").val();
                var descripcion = $("#txtDescripcion").val();

                $.ajax({
                    type: "POST",
                    url: "Modulos.aspx/EditaModulos",
                    data: '{ titulo: "' + titulo + '", idmodulo: "' + $("#hdidmodulo").val() + '", descripcion: "' + descripcion + '", '
                        + ' estatus: "' + estatus + '", idpadre: "' + idpadre + '", archivo: "' + archivo + '" }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    success: function (response) {
                        if (response.d.Result) {
                            toastr.success("El Modulo ha sido editado correctamente", "Éxito");
                            limpiar();
                        } else {
                            toastr.error(response.d.Message, "Problema al agregar");
                        }
                    },
                    error: function (error) {
                        console.log(error);
                    }
                });

            }
        });

        $("#btnGuardar").click(function () {
            if ($.trim($("#txtTitulo").val()) == "" || $.trim($("#txtUrlModulo").val()) == "" || $.trim($("#txtDescripcion").val()) == "") {
                toastr.error("Falta captura de datos requeridos (*)", "Datos requeridos");
            } else {
                var titulo = $("#txtTitulo").val();
                var archivo = $("#txtUrlModulo").val();
                var estatus = ($('#ckActivo').parent('[class*="icheckbox"]').hasClass("checked") ? true : false);
                var idpadre = $("#cbPadre").val();
                var descripcion = $("#txtDescripcion").val();

                $.ajax({
                    type: "POST",
                    url: "Modulos.aspx/AgregaModulos",
                    data: '{ titulo: "' + titulo + '", descripcion: "' + descripcion + '", '
                        + ' estatus: "' + estatus + '", idpadre: "' + idpadre + '", archivo: "' + archivo + '" }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    success: function (response) {
                        if (response.d.Result) {
                            toastr.success("El Modulo ha sido editado correctamente", "Éxito");
                            limpiar();
                        } else {
                            toastr.error(response.d.Message, "Problema al agregar");
                        }
                    },
                    error: function (error) {
                        console.log(error);
                    }
                });

            }
        });

    </script>
</asp:Content>
