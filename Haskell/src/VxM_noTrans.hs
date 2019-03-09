import System.CPUTime
import Text.Printf

main = do
    vf <- readFile "../../Data/2048vector.data"
    mf <- readFile "../../Data/2048matrix.data"
    let v = map (read :: String -> Int) (words vf)
    let m = [map (read :: String -> Int) (words m) | m <- (lines mf)]
    s <- getCPUTime
    let ans = [sum(zipWith (*) v c) | c <- m]
    printf "vxm_noTrans c[n-1]: %d\n" (ans!!2047)
    e <- getCPUTime
    let time = (fromIntegral (e - s)) / (10^9)
    printf "2048 Haskell time %.2f ms\n" (time::Double)

