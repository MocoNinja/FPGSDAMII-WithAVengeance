using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(DiasDeCine.Startup))]
namespace DiasDeCine
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
