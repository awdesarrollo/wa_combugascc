using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data;
using System.Web.Script.Services;

namespace WA_CombugasCC
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }

    public class ajaxResponse
    {
        public bool Result { get; set; }
        public string Message { get; set; }
        public string Content { get; set; }
        public DataSet ds { get; set; }
    }




    #region WebMethod

    [WebMethod(EnableSession = true)]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static ajaxResponse Login()
    {
        ajaxResponse Response = new ajaxResponse();


        return Response;
    }

    #endregion

}