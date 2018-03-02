using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ACCESODATOS_VM.Startup))]
namespace ACCESODATOS_VM
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
