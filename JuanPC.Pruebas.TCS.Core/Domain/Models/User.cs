using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JuanPC.Pruebas.TCS.Core.Domain.Models
{
    public class User
    {
        [ExcludeFromCodeCoverage]
        public class Users
        {
            public Users()
            {
                this.name = "admin";
                this.gmail = "admin@gmail.com";
                this.numeroDocumento = 123456789;
                this.password = "admin123";
            }

            public string name { get; set; }
            public string gmail { get; set; }
            public int numeroDocumento { get; set; }
            public string password { get; set; }
        }
    }
}
