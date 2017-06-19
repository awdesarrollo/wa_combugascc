using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using WA_CombugasCC.Core;

namespace WA_CombugasCC.Admin
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["sesionUsuario"] == null)
            {
                Response.Redirect("~/");
            }
            usuario objUsuario = (usuario)Session["sesionUsuario"];
            if (objUsuario.id_rol != 1)
            {
                Response.Redirect("~/CallCenter/");
            }
        }

       

    }
}