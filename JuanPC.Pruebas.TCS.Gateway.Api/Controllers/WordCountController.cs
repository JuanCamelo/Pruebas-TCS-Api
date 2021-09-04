using JuanPC.Pruebas.TCS.Core.NewFolder;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using OpheliaSuiteV2.Core.SSB.Lib.Models;
using System.Threading.Tasks;

namespace JuanPC.Pruebas.TCS.Gateway.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class WordCountController : ControllerBase
    {
        #region Properties
        private readonly IWordCount _wordCount;
        #endregion

        #region Builders
        public WordCountController(IWordCount wordCount)
        {
            _wordCount = wordCount;
        }
        #endregion

        #region Methods
        /// <summary>
        /// Valida la cantidad de veces que se repite una letra 
        /// </summary>
        /// <param name="text"></param>
        /// <returns></returns>
        [HttpGet]
        //[Authorize]
        [Route(nameof(WordCountController.ValidWordCount))]
        public RequestResult<dynamic> ValidWordCount(string text)
            => _wordCount.ValidWordCount(text);

        #endregion

    }
}
