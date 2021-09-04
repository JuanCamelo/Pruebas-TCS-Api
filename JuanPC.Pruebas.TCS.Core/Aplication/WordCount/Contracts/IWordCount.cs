using OpheliaSuiteV2.Core.SSB.Lib.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JuanPC.Pruebas.TCS.Core.NewFolder
{
    public interface IWordCount
    {
        RequestResult<dynamic> ValidWordCount( string text);
    }
}
