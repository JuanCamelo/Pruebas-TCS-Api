using JuanPC.Pruebas.TCS.Core.Aplication.Commands.Login.ModelDTO;
using OpheliaSuiteV2.Core.SSB.Lib.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JuanPC.Pruebas.TCS.Core.Aplication.Commands.Login.Contracts
{
    public interface ILoginApp
    {

        /// <summary>
        /// 
        /// </summary>
        /// <param name="user"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        RequestResult<UserDto> LoginUser(string user, string password);
    }
}
