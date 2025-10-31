
module convertion::convert_bases {

    use std::string;
    use std::vector;

    public fun from_base10_to_other_base(mut n: u64, base: u8): string::String {
        let mut digits = vector::empty<u8>();

    
        if (n == 0) {
            return string::utf8(b"0");
        };

        loop {
            let remainder = n % (base as u64);
            vector::push_back(&mut digits, remainder as u8);
            n = n / (base as u64);

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

     public fun from_other_base_to_base10(num_str: string::String, base: u8): string::String {
        let bytes = string::bytes(&num_str); 
        let mut result: u64 = 0;
        let mut power: u64 = 1;
        let mut i = vector::length(&bytes);

        while (i > 0) {
            i = i - 1;
            let d = *vector::borrow(&bytes, i);

           
            let digit_value = if (d >= 48 && d <= 57) {
                (d - 48) as u64  
            } else if (d >= 65 && d <= 90) {
                (d - 55) as u64  
            } else if (d >= 97 && d <= 122) {
                (d - 87) as u64   
            } else {
                0u64            
            };

            result = result + digit_value * power;
            power = power * (base as u64);
        };

    
        u64_to_string(result)
    }

    fun u64_to_string(mut n: u64): string::String {
        let mut digits = vector::empty<u8>();

        if (n == 0) {
            return string::utf8(b"0");
        };

        loop {
            let remainder = n % 10;
            vector::push_back(&mut digits, (remainder as u8) + 48);
            n = n / 10;
            if (n == 0) { break; };
        };

        vector::reverse(&mut digits);
        string::utf8(digits)
    }


}
    




