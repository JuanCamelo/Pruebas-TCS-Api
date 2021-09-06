using JuanPC.Pruebas.TCS.Core;
using JuanPC.Pruebas.TCS.Core.NewFolder;
using JuanPC.Pruebas.TCS.Gateway.Api.Controllers;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Moq;
using OpheliaSuiteV2.Core.SSB.Lib.Models;
using System.Diagnostics.CodeAnalysis;

namespace TCS.Pruebas.Tests
{
    [TestClass]
    [ExcludeFromCodeCoverage]
    public class WordCountUnitTests
    {
        private WordCountController _wordCountController;
        private Mock<IWordCount> _wordCountApp;

        private WordCountAppService _WordCountAppService;
        public WordCountUnitTests()
        {
            this._wordCountApp = new Mock<IWordCount>();
            _wordCountController = new WordCountController(_wordCountApp.Object);
            _WordCountAppService = new WordCountAppService();
        }

        [TestMethod()]
        public void GetWordCountTests()
        {
            string text = "aeiou";
            RequestResult<dynamic> requestResult = new RequestResult<dynamic>();
            _wordCountApp.Setup(x => x.ValidWordCount(text)).Returns(requestResult);

            // Act
            var actual = _wordCountController.ValidWordCount(text);

            // Assert
            Assert.AreEqual(actual.Result, requestResult.Result);
        }

        [TestMethod()]
        public void WordCountAppServiceTests()
        {
            string text = "aei o , . u , .";
            // Act
            var actual = _WordCountAppService.ValidWordCount(text);
            // Assert
            Assert.AreEqual(actual.Result, actual.Result);
        }
        [TestMethod()]
        public void WordCountAppServiceErrorTests()
        {
            string text = null;
            // Act
            var actual = _WordCountAppService.ValidWordCount(text);
            // Assert
            Assert.AreEqual(actual.Result, actual.Result);
        }
    }
}

