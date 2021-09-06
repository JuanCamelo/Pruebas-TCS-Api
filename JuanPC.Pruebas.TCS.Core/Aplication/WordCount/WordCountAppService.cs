using JuanPC.Pruebas.TCS.Core.Domain.Models;
using JuanPC.Pruebas.TCS.Core.NewFolder;
using Microsoft.EntityFrameworkCore;
using OpheliaSuiteV2.Core.SSB.Lib.Models;
using System;
using System.Collections.Generic;
using System.Linq;
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
                string palabra = null;
                List<RequesValidWordCountDto> addRequestDTO = new List<RequesValidWordCountDto>();
                #endregion

                if (text == null)
                    return RequestResult<dynamic>.CreateUnsuccessful(new string[] { "Debe ingresar al menos un carácter" });

                String[] palabras = text.Split(" ");
                for (int i = 0; i < palabras.Length; i++)
                {

                    if (addRequestDTO.Any(x => x.chararter.Equals(palabras[i])) == false)
                    {
                        palabra = null;
                        for (int j = 0; j < palabras.Length; j++)
                        {
                            if (palabras[i].CompareTo(palabras[j]) == 0)
                            {
                                contador++;
                                palabra = palabras[j];
                            }
                        }
                        addRequestDTO.Add(new RequesValidWordCountDto
                        {
                            countChar = contador++,
                            chararter = palabra
                        }); ;
                        contador = 0;
                    }

                }
                return RequestResult<dynamic>.CreateSuccessful(addRequestDTO);
            }
            catch (Exception error)
            {

                return RequestResult<dynamic>.CreateError(error.Message);
            }
        }

        #endregion

    }
}
