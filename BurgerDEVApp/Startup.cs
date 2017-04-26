using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(BurgerDEVApp.Startup))]
namespace BurgerDEVApp
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
