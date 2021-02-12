﻿using System;

namespace Identity.Plugin.Models
{
    public class ApplicationUser
    {
        public string Id { get; set; }
        public string UserName { get; set; }
        public string NormalizedUserName { get; set; }
        public string Email { get; set; }
        public string NormalizedEmail { get; set; }
        public bool IsEmailVerified { get; set; }
        
        public string PhoneNumber { get; set; }
        public bool IsPhoneNumberVerified { get; set; }
        public string PasswordHash { get; set; }
        public string SecurityStamp { get; set; }
        public bool IsTwoFactorEnabled { get; set; }

        public int AccessFailedCount { get; set; }
        public bool IsLockoutEnabled { get; set; }
        public DateTimeOffset? LockoutEndDate { get; set; }

        public DateTime CreatedOn { get; set; }
        public DateTime? DeletedOn { get; set; }

        public ApplicationUser()
        {
        }

        public ApplicationUser(string userName, string email) : this(userName)
        {
            if (email != null)
            {
                // Email = new ApplicationUserMail(email);
            }
        }

        public ApplicationUser(string userName)
        {
            if (userName == null)
            {
                throw new ArgumentNullException(nameof(userName));
            }

            Id = new Guid().ToString();
            UserName = userName;
            CreatedOn = DateTime.UtcNow;
        }
    }
}