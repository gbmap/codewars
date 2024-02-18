"use strict";
// export function getNumbers(numbers: number[], target: number): number[] {
//     function n(numbers: number[], target: number, buffer: number[]): number[] {
Object.defineProperty(exports, "__esModule", { value: true });
exports.getNumbers = void 0;
//         if (target === 0) return buffer;
//         if (numbers.length == 0) return [];
//         else if (numbers.length == 1) {
//             if (numbers[0] - target >= 0) return [numbers[0]].concat(n(numbers,target-numbers[0],[]));
//             return [];
//         }
//         let x = numbers[0];
//         if (target-x > 0) {
//             let sub = n(numbers, target-x, buffer);
//             // no solution past this point,
//             // dont update buffer
//             if (sub.length === 0) 
//                 return n(numbers.slice(1), target, buffer);
//             // found solution, subtract target and get subsolution
//             return sub;
//         }
//         else if (target-x === 0) {
//             return buffer;
//         }
//         return n(numbers.slice(1), target, buffer)
//   }
//   return n(numbers, target, []);
// }
function getNumbers(numbers, target) {
    function _gcd(a, b) {
        return b === 0 ? a : _gcd(b, a % b);
    }
    if (numbers.length === 0 || target === 0)
        return [];
    if (target % numbers.slice(1).reduce(_gcd, numbers[0]) !== 0)
        return [];
    var x = numbers[0];
    var delta = target - x;
    if (delta > 0) {
        var sub = getNumbers(numbers, delta);
        if (sub.length > 0)
            return [x].concat(sub);
        return getNumbers(numbers.slice(1), target);
    }
    else if (delta === 0)
        return [x];
    else
        return getNumbers(numbers.slice(1), target);
}
exports.getNumbers = getNumbers;
var numbers = [100, 25, 15, 7, 3];
console.log(getNumbers(numbers, 24));
console.log(getNumbers(numbers, 53));
console.log(getNumbers(numbers, 35));
console.log(getNumbers([10, 8, 6, 4, 2], 9999));
