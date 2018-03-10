using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(TrabajandoEntityFW.Startup))]
namespace TrabajandoEntityFW
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
