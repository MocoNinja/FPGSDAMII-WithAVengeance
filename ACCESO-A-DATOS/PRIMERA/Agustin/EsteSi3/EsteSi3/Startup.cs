using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(EsteSi3.Startup))]
namespace EsteSi3
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
