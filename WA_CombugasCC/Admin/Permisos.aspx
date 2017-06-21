<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Permisos.aspx.cs" Inherits="WA_CombugasCC.Admin.Permisos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="page-container" >
            <div class="page-content-wrapper">
                <div class="page-head">
                    <div class="container">
                        <div class="page-title">
                            <h1>Permisos</h1>
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
                                                Asignacion de Permisos Por Rol
                                            </div>
                                        </div>
                                        <div class="portlet-body">
                                          <div class="row">
                                              <div class="col-md-2">Lista de Roles: </div>
                                              <div class="col-md-3">
                                                  <select id="cbRoles" class="form-control">
                                                  </select>
                                              </div>
                                          </div>
                                        </div>

                                        <div class="portlet-title" style="margin-top: 20px;">
                                            <div class="caption caption-md">
                                                Modulos a asignar:
                                            </div>
                                        </div>
                                        <div class="portlet-body">
                                          <div class="row" id="gridModulos">
                                          </div>
                                          <div class="row" style="margin-top:20px;">
                                              <div class="col-md-12">
                                                  <button type="button" class="btn btn-danger" id="btnAsignar">Asignar Permisos</button> 
                                                  <button type="button" class="btn btn-default" id="btnLimpiar">Limpiar</button>
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
                <i class="icon-login"></i>
            </a>
        </div>

    <script type="text/javascript">
        cargarRoles();

        function cargarRoles() {
            $.ajax({
                type: "POST",
                url: "Roles.aspx/CargarRoles",
                data: '{ }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (response) {
                    var datos = JSON.parse(response.d.Data);
                    
                    var options = "<option value='-1'>Seleccione un Rol</option>";
                    for (var i = 0; i < datos.length; i++) {
                        options += "<option value='" + datos[i].idRol + "'>" + datos[i].nombreRol + "</option>";
                    }
                    $("#cbRoles").html(options);
                },
                error: function (error) {
                    console.log(error);
                }
            });
        }

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
                    var gridModulos = "";
                    for (var i = 0; i < datos.length; i++) {
                        if (datos[i].estatus) {
                            gridModulos += '<div class="col-md-3"><label><input type="checkbox" name="ckModulo" class="icheck" value="' + datos[i].idmodulo + '" /> ' + datos[i].descripcion + '</label></div>';
                        }
                    }
                    $("#gridModulos").html(gridModulos);
                },
                error: function (error) {
                    console.log(error);
                }
            });
        }

        function limpiarModulos() {
            $('input[name=ckModulo]').each(function () {
                $(this).iCheck('uncheck');
            });
        }

        function obtenerModulosRoles() {
            if ($("#cbRoles").val() == -1) {
                limpiarModulos();
            }
            else {
                limpiarModulos();
                $.ajax({
                    type: "POST",
                    url: "Permisos.aspx/ObtenerModulosRol",
                    data: '{ idRol: "' + $("#cbRoles").val() + '" }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    success: function (response) {
                        var datos = JSON.parse(response.d.Data);
                        for (var i = 0; i < datos.length; i++) {
                            $('input[name=ckModulo]').each(function () {
                                if ($(this).val() == datos[i].idmodulo)
                                    $(this).iCheck('check');
                            });
                        }
                    },
                    error: function (error) {
                        console.log(error);
                    }
                });

            }
        }

        $("#cbRoles").change(function () {
            obtenerModulosRoles();
        });

        $("#btnLimpiar").click(function () {
            $("#cbRoles").val(-1);
            limpiarModulos();
        });

        $("#btnAsignar").click(function () {
            var asignacion = new Array()
            $('input[name=ckModulo]').each(function () {
                if ($(this).parent('[class*="icheckbox"]').hasClass("checked"))
                    asignacion.push($(this).val());
            });
            if ($("#cbRoles").val() == -1 || asignacion.length == 0) {
                toastr.error("Seleccione el Rol y los Modulos que se van a asignar", "Datos incorrectos");
            } else {
                $.ajax({
                    type: "POST",
                    url: "Permisos.aspx/AsignacionPermisos",
                    data: JSON.stringify({idRol:  $("#cbRoles").val(), modulos: asignacion }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    success: function (response) {
                        if (response.d.Result) {
                            toastr.success("La asignación se ha realizado correctamente", "Éxito");
                            $("#cbRoles").val(-1);
                            limpiarModulos();
                        } else {
                            toastr.error(response.d.Message, "Problema de asignación");
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
