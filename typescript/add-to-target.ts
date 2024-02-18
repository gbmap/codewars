
// hint: diophantine equation 
export function getNumbers(numbers: number[], target: number): number[] {
    function _gcd(a:number,b:number): number {
        return b === 0 ? a : _gcd(b, a % b);
    }
    if (numbers.length === 0 || target === 0) return []
    if (target % numbers.slice(1).reduce(_gcd, numbers[0]) !== 0) return []
    let x = numbers[0];
    let delta = target - x;
    if (delta > 0) {
        let sub = getNumbers(numbers, delta);
        if (sub.length > 0) return [x].concat(sub)
        return getNumbers(numbers.slice(1), target);
    }
    else if (delta === 0) return [x];
    else return getNumbers(numbers.slice(1), target);
}

let numbers = [100, 25, 15,7,3]
console.log(getNumbers(numbers, 24))
console.log(getNumbers(numbers, 53))
console.log(getNumbers(numbers, 35))
console.log(getNumbers([10,8,6,4,2], 9999))