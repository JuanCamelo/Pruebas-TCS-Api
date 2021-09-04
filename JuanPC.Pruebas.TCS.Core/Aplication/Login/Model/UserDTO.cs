using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JuanPC.Pruebas.TCS.Core.Aplication.Commands.Login.ModelDTO
{
    public class UserDto
    {
        public UserDto()
        {
            this.username = null;
            this.gmail = null;
            this.token = null;
            this.error = null;
        }

        public string username { get; set; }
        public string gmail { get; set; }

        public string token { get; set; }
        public string error { get; set; }
    }
}
