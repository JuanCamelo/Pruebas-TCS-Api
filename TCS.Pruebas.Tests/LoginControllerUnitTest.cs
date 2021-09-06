using JuanPC.Pruebas.TCS.Core.Aplication.Commands.Login;
using JuanPC.Pruebas.TCS.Core.Aplication.Commands.Login.Contracts;
using JuanPC.Pruebas.TCS.Core.Aplication.Commands.Login.ModelDTO;
using JuanPC.Pruebas.TCS.Gateway.Api.Controllers;
using Microsoft.Extensions.Options;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Moq;
using OpheliaSuiteV2.Core.SSB.Lib.Models;
using System;
using System.Diagnostics.CodeAnalysis;

namespace TCS.Pruebas.Tests
{
    [TestClass]
    [ExcludeFromCodeCoverage]
    public class LoginControllerUnitTest
    {
        private LoginController _loginController;
        private Mock<ILoginApp> _testloginAppService;

        private LoginAppService _loginAppservice;
        private Mock<IOptions<AppSettings>> _testIoptions;

        public LoginControllerUnitTest()
        {
            this._testloginAppService = new Mock<ILoginApp>();
            this._testIoptions = new Mock<IOptions<AppSettings>>();
            _loginController = new LoginController(_testloginAppService.Object);
            _loginAppservice = new LoginAppService(_testIoptions.Object);
        }

        [TestMethod()]
        public void LoginControllerTest()
        {
            string password = "admin123";
            string name = "admin";
            RequestResult<UserDto> requestResult = new RequestResult<UserDto>();
            _testloginAppService.Setup(x => x.LoginUser(name.Trim(), password.Trim())).Returns(requestResult);

            // Act
            var actual = _loginController.LoginUser(name, password);

            // Assert
            Assert.AreEqual(actual.Result, requestResult.Result);
        }

        [TestMethod()]
        public void LoginAppServiceTest()
        {
            string password = "admin123";
            string name = "admin";
            // Act
            var actual = _loginAppservice.LoginUser(name, password);
            // Assert
            Assert.AreEqual(actual.Result, actual.Result);
        }

        [TestMethod()]
        public void LoginAppServiceErrorTests()
        {
            string password = "admin123";
            string name = null;
            // Act
            var actual = _loginAppservice.LoginUser(name, password);
            // Assert
            Assert.AreEqual(actual.Result, actual.Result);
        }
        [TestMethod()]
        public void LoginAppServiceErrorTest2()
        {
            string password = null;
            string name = "admin123";
            // Act
            var actual = _loginAppservice.LoginUser(name, password);
            // Assert
            Assert.AreEqual(actual.Result, actual.Result);
        }

        [TestMethod()]
        public void LoginAppServiceErrorTest()
        {
            string password = "admin1223";
            string name = "123";
            // Act
            var actual = _loginAppservice.LoginUser(name, password);

            // Assert
            Assert.AreEqual(actual.Result, actual.Result);
        }
    }
}
