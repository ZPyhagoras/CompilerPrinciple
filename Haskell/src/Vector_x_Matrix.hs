import System.CPUTime
import Text.Printf

split :: Char -> String -> [String]
split d [] = []
split d s = x : split d (drop 1 y) where (x,y) = span (/= d) s

str2int :: [String]->[Int]
str2int [] = []
str2int strs = map (read::String->Int) strs

col :: [[Int]] -> [Int]
col m = [x | x : xs <- m]

right :: [[Int]]->[[Int]]
right m = [xs | x : xs <- m, length(xs) > 0]

vxm1 :: [Int] -> [[Int]] -> [Int]
vxm1 v [] = []
vxm1 v m = sum(zipWith (*) v (col m)):(vxm1 v (right m))

transform :: [[Int]]->[[Int]]
transform y = [[z !! j | z <- y] | j <- [0 .. s]] where s = length (head y) - 1

vxm2 :: [Int] -> [[Int]] -> [Int]
vxm2 v m = [sum(zipWith (*) v c) | c <- transform m]

main = do
    strm <- readFile "../../Data/4096matrix.data"
    let strms = split '\n' strm
    let chms = map (split ' ') strms
    let b = map str2int chms

    strv <- readFile "../../Data/4096vector.data"
    let strvs = split ' ' strv
    let a = str2int strvs
    
    start <- getCPUTime
    let c = vxm1 a b
    printf "vxm1 c[n-1]: %d\n" (c!!4095)
    end <- getCPUTime
    let rt = (fromIntegral (end - start)) / (10^9)
    printf "Haskell time %.2f ms\n"(rt::Double)
