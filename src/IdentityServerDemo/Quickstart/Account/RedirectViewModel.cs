// Copyright (c) Brock Allen & Dominick Baier. All rights reserved.
// Licensed under the Apache License, Version 2.0. See LICENSE in the project root for license information.


using System;

namespace IdentityServerHost.Quickstart.UI
{
    public class RedirectViewModel
    {
        public RedirectViewModel()
        {
            Console.WriteLine();
        }
        public string RedirectUrl { get; set; }
    }
}