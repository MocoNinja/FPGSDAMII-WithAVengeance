using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ExamenJGT.Startup))]
namespace ExamenJGT
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
