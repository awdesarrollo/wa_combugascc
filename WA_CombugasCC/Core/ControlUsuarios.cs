using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WA_CombugasCC.Core
{
    public class ControlUsuarios
    {

        public static int LogIn(string userName, string password)
        {
            int result = 0;
            usuario entity = null;

            try
            {
                ContextCombugasDataContext model = new ContextCombugasDataContext();
                entity = model.usuarios.Where(x => x.username == userName && x.passwords == password).SingleOrDefault();

                if (entity != null)
                {
                    if (!entity.isActive)
                    {
                        
                    }
                    else
                    {
                        
                    }
                }
            }
            catch (Exception ex)
            {
                throw new ApplicationException("Ha ocurrido un error al iniciar la sesión del usuario. " + ex.Message);
            }

            return result;
        }

    }
}