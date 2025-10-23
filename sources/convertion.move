
module convertion::convert_bases {

    use std::string;
    use std::vector;

    public fun to_base10_to_(mut n: u64): string::String {
        let mut digits = vector::empty<u8>();

    
        if (n == 0) {
            return string::utf8(b"0");
        };

        loop {
            let remainder = n % 4;
            vector::push_back(&mut digits, remainder as u8);
            n = n / 4;

            if (n == 0) {
                break;
            };
        };
        vector::reverse(&mut digits);

        let mut result_bytes = vector::empty<u8>();
        let mut i = 0;
        let len = vector::length(&digits);

        while (i < len) {
            let d = *vector::borrow(&digits, i);
            vector::push_back(&mut result_bytes, d + 48);
            i = i + 1;
        };

        string::utf8(result_bytes)
    }
}
    




