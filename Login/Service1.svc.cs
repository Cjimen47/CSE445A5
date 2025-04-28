using System;
using System.Collections.Generic;
using System.Net.Mail;
using System.Runtime.Serialization;
using Security;

namespace Login
{
    public class LoginService : ILoginService
    {
        public bool ChangeEmail(string sessionId, string email)
        {
            return UserRegistry.ChangeEmail(sessionId, email);
        }

        public bool ChangePassword(string sessionId, string oldPassword, string newPassword)
        {
            return UserRegistry.ChangePassword(sessionId, oldPassword, newPassword);
        }

        public bool ChangeUsername(string sessionId, string username)
        {
            return UserRegistry.ChangeUsername(sessionId, username);
        }

        public bool CreateAccount(string username, string email, string password)
        {
            return UserRegistry.RegisterUser(username, email, password);
        }

        public bool IsUserLoggedIn(string username)
        {
            return UserRegistry.IsUserLoggedIn(username);
        }

        public string Login(string username, string password)
        {
            return UserRegistry.LoginUser(username, password);
        }

        public bool Logout(string sessionId)
        {
            return UserRegistry.LogoutUser(sessionId);
        }

        public bool RemoveAccount(string sessionId, string username, string password)
        {
            return UserRegistry.DeleteUser(sessionId, username, password);
        }
    }

    public class UserRegistry
    {
        /// <summary>
        /// Defines a user with a username, password, salt, email, session id.
        /// </summary>
        public class User
        {
            public string Username { get; set; }
            public string Password { get; set; }
            public string Salt { get; set; }
            public string Email { get; set; }
            public Guid SessionId { get; set; }
        }

        /// <summary>
        /// Dictionary of all users in the system.
        /// </summary>
        private static Dictionary<string, User> users = new Dictionary<string, User>();

        /// <summary>
        /// Dictionary of all logged in users.
        /// </summary>
        private static Dictionary<string, User> loggedInUsers = new Dictionary<string, User>();

        /// <summary>
        /// Response from emailable.com api.
        /// </summary>
        [DataContract]
        private class EmailableResonse
        {
            [DataMember(Name = "accept_all")]
            public bool accept_all;
            [DataMember(Name = "did_you_mean")]
            public string did_you_mean;
            [DataMember(Name = "disposable")]
            public bool disposable;
            [DataMember(Name = "domain")]
            public string domain;
            [DataMember(Name = "duration")]
            public double duration;
            [DataMember(Name = "email")]
            public string email;
            [DataMember(Name = "first_name")]
            public string first_name;
            [DataMember(Name = "free")]
            public bool free;
            [DataMember(Name = "full_name")]
            public string full_name;
            [DataMember(Name = "gender")]
            public string gender;
            [DataMember(Name = "last_name")]
            public string last_name;
            [DataMember(Name = "mailbox_full")]
            public bool mailbox_full;
            [DataMember(Name = "mx_record")]
            public string mx_record;
            [DataMember(Name = "no_reply")]
            public bool no_reply;
            [DataMember(Name = "reason")]
            public string reason;
            [DataMember(Name = "role")]
            public bool role;
            [DataMember(Name = "score")]
            public int score;
            [DataMember(Name = "smtp_provider")]
            public string smtp_provider;
            [DataMember(Name = "state")]
            public string state;
            [DataMember(Name = "tag")]
            public string tag;
            [DataMember(Name = "user")]
            public string user;
        }

        /// <summary>
        /// Registers a new user to the service.
        /// </summary>
        /// <param name="username">The username of the user.</param>
        /// <param name="email">The email of the user, verified by emailable.</param>
        /// <param name="password">The plaintext password of the user.</param>
        /// <returns></returns>
        public static bool RegisterUser(string username, string email, string password)
        {
            string salt = Hash.GenerateSalt();

            User user = new User()
            {
                Username = username,
                Salt = salt,
                Password = Hash.SHA256Hash(salt + password),
                Email = email,
                SessionId = Guid.Empty
            };

            // Make sure user doesn't already exist and that their email is correct
            if (!users.ContainsKey(username) && VerifyEmail(email))
            {
                users.Add(username, user);
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// Verfies an email address using https://stackoverflow.com/questions/201323/how-can-i-validate-an-email-address-using-a-regular-expression
        /// </summary>
        /// <param name="email">The email to verify.</param>
        /// <returns>True if the email is valid.</returns>
        private static bool VerifyEmail(string email)
        {
            bool isValid = false;

            try
            {
                MailAddress address = new MailAddress(email);
                isValid = (address.Address == email);
            }
            catch (FormatException)
            {
                // address is invalid
            }

            return isValid;
        }

        /// <summary>
        /// Logs in a user to the service if that user exists and their password is correct.
        /// </summary>
        /// <param name="username">The username of the user.</param>
        /// <param name="password">The password of the user.</param>
        /// <returns>The string of the GUID session token.</returns>
        public static string LoginUser(string username, string password)
        {
            if (!users.ContainsKey(username) || loggedInUsers.ContainsKey(username))
            {
                return "Incorrect Username or User is Already Logged In";
            }
            else
            {
                string hash = Hash.SHA256Hash(users[username].Salt + password);

                if (users[username].Password != hash)
                {
                    return "Incorrect Password";
                }

                Guid guid = Guid.NewGuid();
                loggedInUsers.Add(guid.ToString(), users[username]);
                users[username].SessionId = guid;
                return guid.ToString();
            }
        }

        /// <summary>
        /// Logs out a user from the service.
        /// </summary>
        /// <param name="sessionId">The active session id of the user.</param>
        /// <returns>True if the user was successfully logged out.</returns>
        public static bool LogoutUser(string sessionId)
        {
            if (!loggedInUsers.ContainsKey(sessionId))
            {
                return false;
            }
            else
            {
                loggedInUsers[sessionId].SessionId = Guid.Empty;
                loggedInUsers.Remove(sessionId);
                return true;
            }
        }

        /// <summary>
        /// Checks if a user is logged in by their username.
        /// </summary>
        /// <param name="username">The username of the user.</param>
        /// <returns>True if the user exists and is logged in.</returns>
        public static bool IsUserLoggedIn(string username)
        {
            return users.ContainsKey(username) && users[username].SessionId != Guid.Empty;
        }

        /// <summary>
        /// Deletes a registered user from the service. The user must be logged in to perform this action. Resets all data in the user.
        /// </summary>
        /// <param name="sessionId">The session id of the logged in user.</param>
        /// <param name="username">The username of the user.</param>
        /// <param name="password">The password of the user.</param>
        /// <returns>True if the user was successfully logged out.</returns>
        public static bool DeleteUser(string sessionId, string username, string password)
        {
            if (loggedInUsers.ContainsKey(sessionId) && loggedInUsers[sessionId].Username == username && loggedInUsers[sessionId].Password == Hash.SHA256Hash(loggedInUsers[sessionId].Salt + password))
            {
                User user = loggedInUsers[sessionId];
                loggedInUsers.Remove(sessionId);
                users.Remove(username);
                user.SessionId = Guid.Empty;
                user.Password = "";
                user.Salt = "";
                user.Email = "";
                user.Username = "";
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// Changes the username of a logged in user.
        /// </summary>
        /// <param name="sessionId">The session id of the logged in user.</param>
        /// <param name="username">The new username of the user.</param>
        /// <returns>True if the username was successfully changed.</returns>
        public static bool ChangeUsername(string sessionId, string username)
        {
            if (loggedInUsers.ContainsKey(sessionId) && !users.ContainsKey(username))
            {
                users.Remove(loggedInUsers[sessionId].Username);
                loggedInUsers[sessionId].Username = username;
                users.Add(username, loggedInUsers[sessionId]);
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// Changes the password of a logged in user.
        /// </summary>
        /// <param name="sessionId">The session id of the logged in user.</param>
        /// <param name="oldPassword">The old password of the user.</param>
        /// <param name="newPassword">The new password of the user.</param>
        /// <returns>True if the password was successfully changed.</returns>
        public static bool ChangePassword(string sessionId, string oldPassword, string newPassword)
        {
            if (loggedInUsers.ContainsKey(sessionId) && loggedInUsers[sessionId].Password == Hash.SHA256Hash(loggedInUsers[sessionId].Salt + oldPassword))
            {
                loggedInUsers[sessionId].Salt = Hash.GenerateSalt();
                loggedInUsers[sessionId].Password = Hash.SHA256Hash(loggedInUsers[sessionId].Salt + newPassword);
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// Changes the email of a logged in user. Verifies the email.
        /// </summary>
        /// <param name="sessionId">The session id of the logged in user.</param>
        /// <param name="email">The new email of the user</param>
        /// <returns>True if the email is valid and was successfully changed.</returns>
        public static bool ChangeEmail(string sessionId, string email)
        {
            if (loggedInUsers.ContainsKey(sessionId))
            {
                loggedInUsers[sessionId].Email = email;
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
