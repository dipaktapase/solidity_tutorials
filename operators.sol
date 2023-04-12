pragma solidity >= 0.7.0 < 0.9.0;

// Operators are the symbols. Interpreter to performs specific mathematical, relational or logical operation and produce final product

// Arithimatic operators: + - % / * 
// Comparison operators: 

contract Operators {

    function calculator() public pure returns(uint) {
        uint a = 7;
        uint b = 5;
        return a % b;
    }

    uint a = 2;
    uint b = 12;

    function arithimiticExercise_1() public view returns(uint) {
        uint result =  a + b - b + a;
        return result;
    }
    
    function arithimiticExercise_2() public view returns(uint) {
        uint result =  a * b * b - 1;
        return result;
    }

    // function arithimiticExercise_3() public pure returns(uint) {
    //     // uint newB = b++;
    //     // uint newA = a++;
    //     // uint newAdd = newB + newA;
    //     uint result =  b + b++ + a++;
    //     return result;
    // }

    function arithimiticExercise_4() public view returns(uint) {
        uint result =  (b % a) + 3;
        return result;
    }
}

contract ComparisonOperators {

    uint a = 323;
    uint b = 541;

    function compare() view public {
        require(a <= b, "This cpmparison is false!");    
    }
}

// Logical operators: && - logical AND, || - logical OR, ! - Logical NOT
// Bitwise operators: & - Bitwise AND, | - Bitwise OR, ^ - Bitwise XOR 

contract LogicalOperators {
    uint a = 4;
    uint b = 5;

    function logic() public view returns(uint) {
        uint result = 0;
        if(a < b || a == 5) {
            result = a + b;
        }   
        return result;
    }

    function conditionalLogic() public view returns(uint) {
        uint a = 17;
        uint b = 32;
        uint result = 0;
        if (b > a && a != b) {
            result = (a * b) / b;
        }
        return result;
    }
}

contract AssignmentOperator {
    uint b = 4;
    uint a = 3;

    function assign() public view returns(uint) {
        uint c = 2;
        return c += c + b;
    }
}

// Solution
contract FinalExercise {
    uint a =300;
    uint b =12;
    uint f =47;

    function finalize() public view returns(uint) {
        uint d = 23;
        if (a >= b && b < f) {
        return (d *= d) - b;
        } else {
            return d;
        }
    } 
}