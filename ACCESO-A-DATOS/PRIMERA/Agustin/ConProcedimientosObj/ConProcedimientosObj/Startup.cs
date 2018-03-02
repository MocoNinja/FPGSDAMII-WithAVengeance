using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ConProcedimientosObj.Startup))]
namespace ConProcedimientosObj
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
