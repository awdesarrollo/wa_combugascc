<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WA_CombugasCC.Default" %>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="es">
<!--<![endif]-->
<head>
    <meta charset="utf-8" />
    <title>Combugas</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta content="Sistema Call Center" name="description" />
    <meta content="A W SOFTWARE | Eduardo Armendariz, Luis Rodriguez" name="author" />
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />
    <link href="assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css" />
    <link href="assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/global/css/components-rounded.min.css" rel="stylesheet" id="style_components" type="text/css" />
    <link href="assets/global/css/plugins.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/pages/css/login-4.min.css" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" href="favicon.png" />
    <script src="assets/global/plugins/jquery.min.js" type="text/javascript"></script>
</head>

<body class=" login">

    <div id="notificacionError" style="margin-top: 20px; margin-left: 20px; margin-right: 20px; display: none;">
        <div class="alert alert-danger">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            <div id="mensajeError"></div>
        </div>
<<<<<<< HEAD
    </div>

    <div id="notificacionExito" style="margin-top: 20px; margin-left: 20px; margin-right: 20px; display: none;">
        <div class="alert alert-success">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            <div id="mensajeExito"></div>
        </div>
    </div>

    <div class="logo">
        <a href="#">
            <img src="assets/pages/img/lgcombugas.png" alt="" width="180" />
        </a>
    </div>
    <div class="content">
        <div class="login-form" id="Form">
            <h3 class="form-title">Inicio de Sesión</h3>
            <div class="alert alert-danger display-hide">
                <button class="close" data-close="alert"></button>
                <span>Ingrese usuario y contraseña </span>
            </div>
            <div class="form-group">
                <label class="control-label visible-ie8 visible-ie9">Usuario</label>
                <div class="input-icon">
                    <i class="fa fa-user"></i>
                    <input id="txtUser" type="text" class="form-control placeholder-no-fix" autofocus autocomplete="off" placeholder="Usuario" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label visible-ie8 visible-ie9">Contraseña</label>
                <div class="input-icon">
                    <i class="fa fa-lock"></i>
                    <input id="txtPassword" type="password" class="form-control placeholder-no-fix" autocomplete="off" placeholder="Contraseña" />
=======
        <div class="content">
            <form class="login-form" id="Form" runat="server" method="post">
                <h3 class="form-title">Inicio de Sesión</h3>
                <div class="alert alert-danger display-hide">
                    <button class="close" data-close="alert"></button>
                    <span> Ingrese usuario y contraseña </span>
                </div>
                <div class="form-group">
                    <label class="control-label visible-ie8 visible-ie9">Usuario</label>
                    <div class="input-icon">
                        <i class="fa fa-user"></i>
                        <input class="form-control placeholder-no-fix"  id="txtUser" autofocus  autocomplete="off" placeholder="Usuario"  />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label visible-ie8 visible-ie9">Contraseña</label>
                    <div class="input-icon">
                        <i class="fa fa-lock"></i>
                        <input ="txtPassword" type="password"  class="form-control placeholder-no-fix" autocomplete="off" placeholder="Contraseña"   />
                    </div>
                </div>
                <div class="form-actions">
<<<<<<< HEAD
                    <button id="btnEntrar" class="btn red pull-right" type="submit">Entrar</button>
=======
                    <button id="btnEntrar" class="btn red pull-right" type="button">Entrar</button>
>>>>>>> master
>>>>>>> Eduardo
                </div>
            </div>
            <div class="form-actions">
                <button id="btnEntrar" class="btn red pull-right" type="button">Entrar</button>
            </div>


<<<<<<< HEAD
        </div>
    </div>
    <div class="copyright"><% Response.Write(DateTime.Now.Year.ToString()); %> &copy; COMBUSTIBLES Y GASES DE TORREON S.A. DE C.V. </div>
    
    <script src="assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/js.cookie.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/backstretch/jquery.backstretch.min.js" type="text/javascript"></script>
    <script src="assets/global/scripts/app.min.js" type="text/javascript"></script>
    <script src="assets/pages/scripts/login-4.js" type="text/javascript"></script>
    <script type="text/javascript">

        $("#btnEntrar").click(function () {
            login();
        });

        $('#txtUser').keypress(function (event) {
            if (event.keyCode == 13) {
                $("#notificacionError").hide("fast");
                login();
            }
        });

        $('#txtPassword').keypress(function (event) {
            if (event.keyCode == 13) {
                $("#notificacionError").hide("fast");
                login();
            }
        });


        function login() {
            if ($("#txtUser").val() == "" || $("#txtPassword").val() == "") {
                $("#mensajeError").html("Los datos de inicio de sesión son requeridos, verifique por favor.");
                $("#notificacionError").show("fast");
                setTimeout(function () { $("#notificacionError").hide("fast"); }, 5000);
            } else {
                var txtusuario =  $.trim($("#txtUser").val());
                var txtpassword =  $.trim($("#txtPassword").val());
                $.ajax({
                    type: "POST",
                    url: "Default.aspx/Login",
                    data: '{ usuario:"' + txtusuario + '", password:"' + txtpassword + '" }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d.Result) {
                            window.location = "Admin/";
                        } else {
                            $("#mensajeError").html(response.d.Message);
                            $("#notificacionError").show("fast");
                            setTimeout(function () { $("#notificacionError").hide("fast"); }, 5000);
                        }
                    },
                    error: function (error) {
                        console.log("ERROR: " + error);
                    }
                });

             

            }
        }

    </script>
</body>

<<<<<<< HEAD
            </form>
=======
</html>
=======
            </div>
>>>>>>> Eduardo
        </div>
        <div class="copyright"> <% Response.Write(DateTime.Now.Year.ToString()); %> &copy; COMBUSTIBLES Y GASES DE TORREON S.A. DE C.V. </div>
        <script src="assets/global/plugins/jquery.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/js.cookie.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/backstretch/jquery.backstretch.min.js" type="text/javascript"></script>
        <script src="assets/global/scripts/app.min.js" type="text/javascript"></script>
        <script src="assets/pages/scripts/login-4.js" type="text/javascript"></script>
    </body>

</html>
>>>>>>> master
