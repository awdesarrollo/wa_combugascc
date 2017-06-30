using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WA_CombugasCC.Core
{
    public class ClassBicatora
    {
        public static void insertBitacora(Bitacora bitacora)
        {
            try
            {
                Bitacora b = new Bitacora();
                b = bitacora;
                ContextCombugasDataContext context = new ContextCombugasDataContext();
                context.Bitacora.InsertOnSubmit(b);
                context.SubmitChanges();
            }
            catch (Exception ex)
            {
                throw new Exception("Problema de Bitacora. " + ex.Message);
            }
        }
    }
}