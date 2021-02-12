# identityserver4-example
That's an example of IdentityServer with ASP .NET Core custom identity stores, I feel there is a need for example how to do use custom stores with identityserver4 is4aspid template aka 'IdentityServer with Asp Net Core Identity' even it looks obvious there is few things to avoid while implementing this and as I see almost there is no resource or repo mentioning about this spesific topic, even though I used dapper and psql to implement custom stores you can add anything under the repositories.

## Right initilazation method for is4aspid template
The problem about this asp net core identity offers few extension method to add identity such as `AddIdentity`, `AddDefaultIdentity`, `AddIdentityCore` in initilization phase developer shouldn't use `AddDefaultIdentity` in is4aspid template because `AddDefaultIdentity` add default UI's as well in this case it coflicts with our template's UI and only shows us a blank screen with no logs or any clue and also worth to mention UserManager RoleManager should add with DI as well.

An example initilization code
`           services.AddScoped<IIdentityUserRepository<ApplicationUser>, IdentityUserRepository>();
            services.AddScoped<IIdentityRoleRepository<IdentityRole>,IdentityRoleRepository>();
            services.AddScoped<IProfileService, ProfileService>();
            
            services.AddIdentity<ApplicationUser,IdentityRole>()
                .AddUserStore<CustomUserStore<ApplicationUser>>()
                .AddRoleStore<CustomRoleStore>();
            services.AddScoped<UserManager<ApplicationUser>>();`
