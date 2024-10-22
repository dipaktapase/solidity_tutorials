contract ExampleContract {
    function findPrimeFactor(uint256 x) 
        public 
        pure 
        returns (uint256) {
            // start at 2, 1 is not a prime factor
            // use <= because x might be prime
            for (uint256 i = 2; i <= x; i++) {
                if (x % i == 0) {
                    return i;
                }
            }

            
    }
}