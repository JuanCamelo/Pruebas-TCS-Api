using JuanPC.Pruebas.TCS.Core.NewFolder;
using JuanPC.Pruebas.TCS.Gateway.Api.Controllers;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Moq;
using OpheliaSuiteV2.Core.SSB.Lib.Models;
using System.Diagnostics.CodeAnalysis;

namespace TCS.Pruebas.Tests
{
    [TestClass]    
    public class WordCountUnitTests
    {
        private WordCountController wordCountController;


        private Mock<IWordCount> wordCountApp;
        public WordCountUnitTests()
        {
            this.wordCountApp = new Mock<IWordCount>();
            wordCountController = new WordCountController(wordCountApp.Object);
        }

        [TestMethod()]
        public void GetWordCountTests()
        {
            string text = "aeiou";
            RequestResult<dynamic> requestResult = new RequestResult<dynamic>();
            wordCountApp.Setup(x => x.ValidWordCount(text)).Returns(requestResult);

            // Act
            var actual = wordCountController.ValidWordCount(text);

            // Assert
            Assert.AreEqual(actual.Result, requestResult.Result);
        }
    }
}

