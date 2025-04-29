using System;
using System.Security.Cryptography;
using System.Text;

namespace BankingSecurityLibrary
{
    public class SecurityManager
    {
        // Hash a password using SHA256
        public string HashPassword(string password)
        {
            if (string.IsNullOrEmpty(password))
                return string.Empty;

            using (SHA256 sha256 = SHA256.Create())
            {
                // Convert the input string to a byte array and compute the hash
                byte[] hashBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));

                // Convert the byte array to a string
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < hashBytes.Length; i++)
                {
                    builder.Append(hashBytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }

        // Verify a password against a stored hash
        public bool VerifyPassword(string password, string storedHash)
        {
            string hashedPassword = HashPassword(password);
            return string.Equals(hashedPassword, storedHash, StringComparison.OrdinalIgnoreCase);
        }

        // Encrypt data using AES
        public string EncryptData(string data, string key)
        {
            if (string.IsNullOrEmpty(data))
                return string.Empty;

            byte[] keyBytes = Encoding.UTF8.GetBytes(EnsureKeyLength(key));
            byte[] dataBytes = Encoding.UTF8.GetBytes(data);

            using (Aes aes = Aes.Create())
            {
                aes.Key = keyBytes;
                aes.GenerateIV(); // Generate a new IV for each encryption
                byte[] iv = aes.IV;

                // Create encryptor
                ICryptoTransform encryptor = aes.CreateEncryptor(aes.Key, aes.IV);

                // Encrypt the data
                byte[] encryptedData = encryptor.TransformFinalBlock(dataBytes, 0, dataBytes.Length);

                // Combine the IV and encrypted data
                byte[] result = new byte[iv.Length + encryptedData.Length];
                Array.Copy(iv, 0, result, 0, iv.Length);
                Array.Copy(encryptedData, 0, result, iv.Length, encryptedData.Length);

                return Convert.ToBase64String(result);
            }
        }

        // Decrypt data using AES
        public string DecryptData(string encryptedData, string key)
        {
            if (string.IsNullOrEmpty(encryptedData))
                return string.Empty;

            byte[] keyBytes = Encoding.UTF8.GetBytes(EnsureKeyLength(key));
            byte[] encryptedBytes = Convert.FromBase64String(encryptedData);

            using (Aes aes = Aes.Create())
            {
                // Extract the IV from the beginning of the encrypted data
                byte[] iv = new byte[aes.BlockSize / 8];
                byte[] actualEncryptedData = new byte[encryptedBytes.Length - iv.Length];

                Array.Copy(encryptedBytes, 0, iv, 0, iv.Length);
                Array.Copy(encryptedBytes, iv.Length, actualEncryptedData, 0, actualEncryptedData.Length);

                aes.Key = keyBytes;
                aes.IV = iv;

                // Create decryptor
                ICryptoTransform decryptor = aes.CreateDecryptor(aes.Key, aes.IV);

                // Decrypt the data
                byte[] decryptedBytes = decryptor.TransformFinalBlock(actualEncryptedData, 0, actualEncryptedData.Length);

                return Encoding.UTF8.GetString(decryptedBytes);
            }
        }

        // Ensure the key is exactly 32 bytes (256 bits) for AES-256
        private string EnsureKeyLength(string key)
        {
            if (string.IsNullOrEmpty(key))
                key = "DefaultBankSecurityKey12345";

            // If key is too short, pad it
            if (key.Length < 32)
            {
                return key.PadRight(32, '*');
            }
            // If key is too long, truncate it
            else if (key.Length > 32)
            {
                return key.Substring(0, 32);
            }

            return key;
        }
    }
}