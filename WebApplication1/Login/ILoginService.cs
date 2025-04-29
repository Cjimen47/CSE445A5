using System.ServiceModel;

namespace Login
{
    [ServiceContract]
    public interface ILoginService
    {
        [OperationContract]
        bool CreateAccount(string username, string email, string password);

        [OperationContract]
        string Login(string username, string password);

        [OperationContract]
        bool Logout(string sessionId);

        [OperationContract]
        bool IsUserLoggedIn(string username);

        [OperationContract]
        bool RemoveAccount(string sessionId, string username, string password);

        [OperationContract]
        bool ChangeUsername(string sessionId,  string username);

        [OperationContract]
        bool ChangePassword(string sessionId, string oldPassword, string newPassword);

        [OperationContract]
        bool ChangeEmail(string sessionId, string email);
    }
}
