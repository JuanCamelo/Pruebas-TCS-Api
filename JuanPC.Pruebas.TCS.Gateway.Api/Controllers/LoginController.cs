using JuanPC.Pruebas.TCS.Core.Aplication.Commands.Login.Contracts;
using JuanPC.Pruebas.TCS.Core.Aplication.Commands.Login.ModelDTO;
using Microsoft.AspNetCore.Mvc;
using OpheliaSuiteV2.Core.SSB.Lib.Models;
using System.Threading.Tasks;

namespace JuanPC.Pruebas.TCS.Gateway.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoginController : ControllerBase
    {
        #region Properties
        private readonly ILoginApp _loginUser;
        #endregion

        #region Build

        public LoginController(ILoginApp loginUser)
        {
            _loginUser = loginUser;
        }
        #endregion

        #region Methods
        /// <summary>
        /// 
        /// </summary>
        /// <param name="user"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        [HttpGet]
        [Route(nameof(LoginController.LoginUser))]
        public RequestResult<UserDto> LoginUser(string user, string password)
            =>  _loginUser.LoginUser(user, password);
        #endregion
    }
}
