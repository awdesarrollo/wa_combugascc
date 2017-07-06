using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using WA_CombugasCC.Core;

namespace WA_CombugasCC.CallCenter
{
    /// <summary>
    /// Descripción breve de hn_FileUpload
    /// </summary>
    public class hn_FileUpload : IHttpHandler
    {

        

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            string dirFullPath = HttpContext.Current.Server.MapPath("~/Images/choferes/");
            string[] files;
            int numFiles;
            files = System.IO.Directory.GetFiles(dirFullPath);
            numFiles = files.Length;
            numFiles = numFiles + 1;
            string pathToSave_100 = "";
            string str_image = "";
            Guid guid = Guid.NewGuid();
            string username = context.Request.QueryString["username"].ToString();
            ContextCombugasDataContext contexto = new ContextCombugasDataContext();
            fotografias foto = new fotografias();
            

            foreach (string s in context.Request.Files)
            {
                HttpPostedFile file = context.Request.Files[s];
               
                string fileName = file.FileName;
                string fileExtension = file.ContentType;
                

              
                if (!string.IsNullOrEmpty(fileName))
                {

                    fileExtension = Path.GetExtension(fileName);
                    str_image = guid + fileExtension;
                    pathToSave_100 = HttpContext.Current.Server.MapPath("~/Images/choferes/") + str_image;
                    file.SaveAs(pathToSave_100);
                    foto.nombre = str_image;
                    foto.url = pathToSave_100;
                    foto.guardada = 1;
                    foto.confirmada = 0;
                    foto.id_chofer = 0;
                    foto.id_cliente = 0;
                    foto.alta = DateTime.Now;
                    contexto.fotografias.InsertOnSubmit(foto);
                    contexto.SubmitChanges();
                    

                }
            }
            context.Response.Write(str_image);
        }
    }
}