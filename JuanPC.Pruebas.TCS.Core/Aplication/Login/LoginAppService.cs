using JuanPC.Pruebas.TCS.Core.Aplication.Commands.Login.Contracts;
using JuanPC.Pruebas.TCS.Core.Aplication.Commands.Login.ModelDTO;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using OpheliaSuiteV2.Core.SSB.Lib.Models;
using System;
using System.Diagnostics.CodeAnalysis;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using static JuanPC.Pruebas.TCS.Core.Domain.Models.User;

namespace JuanPC.Pruebas.TCS.Core.Aplication.Commands.Login
{
    public class LoginAppService : ILoginApp
    {
        #region Properties
        
        private readonly AppSettings _appSettings;

        public LoginAppService(IOptions<AppSettings> appSettings)
        {
            _appSettings = appSettings.Value;
        }
        #endregion

        #region Builders

        #endregion

        #region Private
        /// <summary>
        /// 
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        [ExcludeFromCodeCoverage]
        private string GetToken(Users user)
        {
            var tokenHandler = new JwtSecurityTokenHandler();
            var llave = Encoding.ASCII.GetBytes(_appSettings.Token);
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(
                    new Claim[]
                    {
                        new Claim(ClaimTypes.NameIdentifier,user.gmail),
                        new Claim(ClaimTypes.NameIdentifier,user.numeroDocumento.ToString())
                    }
                    ),
                Expires = DateTime.UtcNow.AddDays(1),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(llave), SecurityAlgorithms.HmacSha256)
            };

            var token = tokenHandler.CreateToken(tokenDescriptor);
            return tokenHandler.WriteToken(token);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="name"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        private static Users getUserLogin(string name, string password)
        {
            Users _user = new Users();
            
            if (!(_user.name.Equals(name) && _user.password.Equals(password)))
                return null;             
            return _user;
        }
        #endregion

        #region Methods
        /// <summary>
        /// 
        /// </summary>
        /// <param name="user"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public RequestResult<UserDto> LoginUser(string user, string password)
        {
            try
            {
                UserDto resulUser = new UserDto();
                #region valid
                if (string.IsNullOrEmpty(user))
                    return RequestResult<UserDto>.CreateUnsuccessful(new string[] { "userName vacio o no contiene el formato correcto." });
                
                if (string.IsNullOrEmpty(password))
                    return RequestResult<UserDto>.CreateUnsuccessful(new string[] {"password vacio o no contiene el formato correcto." });
                #endregion

                Users responseUser = getUserLogin(user, password);
                if (responseUser == null)
                    return RequestResult<UserDto>.CreateUnsuccessful(new string[] { "Usuario o contraseña incorrecta" });

                resulUser.username = responseUser.name;
                resulUser.gmail = responseUser.gmail;
                resulUser.token = GetToken(responseUser);

                return RequestResult<UserDto>.CreateSuccessful(resulUser);
            }
            catch (Exception error)
            {
                return RequestResult<UserDto>.CreateError(error.Message);
            }
        }
        #endregion
    }
}
