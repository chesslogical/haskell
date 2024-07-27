-- Import necessary modules
import Crypto.Hash (hashWith, SHA512, Digest)
import qualified Data.ByteString.Char8 as BS
import Data.ByteString.Base16 (encode)
import System.IO (hFlush, stdout)

-- Function to compute SHA-512 hash of a given string
computeSHA512 :: String -> String
computeSHA512 input = 
    let
        -- Convert the input string to ByteString
        byteInput = BS.pack input
        -- Compute the hash and encode it as hex
        digest = encode $ hashWith SHA512 byteInput
    in
        -- Convert ByteString to String
        BS.unpack digest

main :: IO ()
main = do
    -- Prompt the user to enter a string
    putStr "Enter a string: "
    hFlush stdout
    input <- getLine
    -- Compute and print the SHA-512 hash
    let hashValue = computeSHA512 input
    putStrLn $ "SHA-512 hash: " ++ hashValue
