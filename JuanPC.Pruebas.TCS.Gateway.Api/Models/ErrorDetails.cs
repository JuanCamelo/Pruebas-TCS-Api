using Newtonsoft.Json;
using System.Diagnostics.CodeAnalysis;

namespace JuanPC.Pruebas.TCS.Gateway.Api.Models
{
    [ExcludeFromCodeCoverage]
    public class ErrorDetails
    {
        public int StatusCode { get; set; }
        public string Message { get; set; }
        public override string ToString()
        {
            return JsonConvert.SerializeObject(this);
        }
    }
}
