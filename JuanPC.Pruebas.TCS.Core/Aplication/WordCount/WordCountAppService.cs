using JuanPC.Pruebas.TCS.Core.Domain.Models;
using JuanPC.Pruebas.TCS.Core.NewFolder;
using Microsoft.EntityFrameworkCore;
using OpheliaSuiteV2.Core.SSB.Lib.Models;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace JuanPC.Pruebas.TCS.Core
{
    public class WordCountAppService : DbContext, IWordCount
    {
        #region Properties

        #endregion

        #region Builders
       
        #endregion

        #region Methods
        /// <summary>
        /// validacion de texto 
        /// </summary>
        /// <param name="text"></param>
        /// <returns></returns>
        public RequestResult<dynamic> ValidWordCount(string text)
        {
            try
            {
                
                #region variables
                int contador = 0;
                int indexPosition = 0;
                List<RequesValidWordCountDto> addRequestDTO = new List<RequesValidWordCountDto>();
                #endregion

                if (text == null)
                   return RequestResult<dynamic>.CreateUnsuccessful(new string[] { "Debe ingresar al menos un carácter" });
                

                string resultext =  RemoveCharacterSpecials(text);

                for (int i = 0; i <= resultext.Length; i++)
                {
                    string validChar = resultext.Substring(0, 1);
                    contador = 0;
                    indexPosition = 0;
                    while (indexPosition != -1)
                    {
                        indexPosition = text.IndexOf(validChar, indexPosition);
                        if (indexPosition >= 0)
                        {
                            contador++;
                            indexPosition++;
                        }
                    }
                    addRequestDTO.Add(new  RequesValidWordCountDto
                    {
                        countChar = contador,
                        chararter = validChar
                    });
                    resultext = resultext.Replace(validChar, "");
                    i = 0;
                }
                return RequestResult<dynamic>.CreateSuccessful(addRequestDTO);
            }
            catch (Exception error)
            {

               return RequestResult<dynamic>.CreateError(error.Message);
            }
        }
       
        #endregion

        #region Private
        /// <summary>
        /// Validacion 
        /// </summary>
        /// <param name="descripcion"></param>
        /// <returns></returns>
        private static string RemoveCharacterSpecials(string descripcion = "")
        {
            string output = "";
            if (descripcion != null)
            {                
                string trim = descripcion.Replace(" ", "");
                trim = trim.Replace(",", "");
                trim = trim.Replace(".", "");
                output = trim;
            }

            return output.Trim();
        }
        #endregion
    }
}
