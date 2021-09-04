using JuanPC.Pruebas.TCS.Core.Aplication.Commands.Login.Contracts;
using JuanPC.Pruebas.TCS.Core.Aplication.Commands.Login.ModelDTO;
using JuanPC.Pruebas.TCS.Gateway.Api.Controllers;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Moq;
using OpheliaSuiteV2.Core.SSB.Lib.Models;

namespace TCS.Pruebas.Tests
{
    [TestClass]    
    public class LoginControllerUnitTest
    {
        private LoginController loginController;

        private Mock<ILoginApp> testloginAppService;       
        public LoginControllerUnitTest()
        {
            this.testloginAppService = new Mock<ILoginApp>();
            loginController = new LoginController(testloginAppService.Object);
        }

        [TestMethod()]
        public void LoginControllerTest()
        {
            string password = "admin123";
            string name = "admin";
            RequestResult<UserDto> requestResult = new RequestResult<UserDto>();
            testloginAppService.Setup(x => x.LoginUser(name.Trim(), password.Trim())).Returns(requestResult);

            // Act
            var actual = loginController.LoginUser(name, password);

            // Assert
            Assert.AreEqual(actual.Result, requestResult.Result);
        }
    }
}
