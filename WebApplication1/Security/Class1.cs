using System;
using System.IO;
using System.Security.Cryptography;
using System.Text;

namespace Security
{
    public class Hash
    {
        /// <summary>
        /// Generates a salt string for password hashing.
        /// </summary>
        /// <returns>A randomly generated string.</returns>
        public static string GenerateSalt()
        {
            byte[] salt = new byte[16];

            using (RandomNumberGenerator rng = RandomNumberGenerator.Create())
            {
                rng.GetBytes(salt);
            }

            return BitConverter.ToString(salt).Replace("-", "").ToLower();
        }

        /// <summary>
        /// Hashes a string with SHA256.
        /// </summary>
        /// <param name="text">The string to hash.</param>
        /// <returns>The hashed string as a string.</returns>
        public static string SHA256Hash(string text)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(text));

                return BitConverter.ToString(bytes).Replace("-", "").ToLower();
            }
        }
    }

    /// <summary>
    /// Helper class for cryptographic functions.
    /// </summary>
    public class Crypto
    {
        public Crypto()
        {
            // Create and set up AES crypto
            aes = Aes.Create();
            aes.Key = key;
            iv = aes.IV;
        }

        // Default key for exemplary purposes
        private byte[] key = { 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16 };
        private byte[] iv;
        private Aes aes;

        /// <summary>
        /// Encrypts a string.
        /// </summary>
        /// <param name="data">The string to encrypt.</param>
        /// <returns>The encrypted string as a byte array.</returns>
        public byte[] Encrypt(string data)
        {
            MemoryStream memory = new MemoryStream();

            // Write the IV to the first 16 bytes
            memory.Write(iv, 0, iv.Length);

            using (CryptoStream crypto = new CryptoStream(memory, aes.CreateEncryptor(), CryptoStreamMode.Write))
            {
                using (StreamWriter writer = new StreamWriter(crypto))
                {
                    writer.Write(data);
                }
            }

            return memory.ToArray();
        }

        /// <summary>
        /// Decrypts a byte array.
        /// </summary>
        /// <param name="data">The byte array to decrypt.</param>
        /// <returns>The decrypted string.</returns>
        public string Decrypt(byte[] data)
        {
            string decrypt;

            MemoryStream memory = new MemoryStream(data);

            // Read the iv from the first 16 bytes
            byte[] _iv = new byte[aes.IV.Length];

            memory.Read(_iv, 0, aes.IV.Length);

            using (CryptoStream crypto = new CryptoStream(memory, aes.CreateDecryptor(key, _iv), CryptoStreamMode.Read))
            {
                using (StreamReader reader = new StreamReader(crypto))
                {
                    decrypt = reader.ReadToEnd();
                }
            }

            return decrypt;
        }
    }
}
