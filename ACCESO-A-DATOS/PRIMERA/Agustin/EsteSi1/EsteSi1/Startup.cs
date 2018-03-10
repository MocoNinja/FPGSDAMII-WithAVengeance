using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(EsteSi1.Startup))]
namespace EsteSi1
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
