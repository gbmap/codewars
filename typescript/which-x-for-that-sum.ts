// https://www.codewars.com/kata/5b1cd19fcd206af728000056/train/typescript
function solve(m: number): number {
    function f(x: number): number {
        let n = 1e16;
        return -((n+1)*x**(n+1) - n*x**(n+2)-x)/(1-x)**2;
    }
    let guess: number = 0.5;
    for (let i = 0; i < 999; i++) {
        let y: number = f(guess);
        if (isNaN(y)) { guess /= 2.00; i-=1; continue; }
        let delta: number = y - m;
        let approxDx = (f(guess+1e-16)-y)/1e-16;
        if (Math.abs(delta) <= 1e-12) {
            return guess;
        }
        guess -= Math.min(1000/i, Math.max(-1000/i, delta/approxDx));
    }
    return guess;
}


console.log(solve(2.0));
console.log(solve(4.0));
console.log(solve(12.0));
console.log(solve(13.0));
console.log(solve(301127));
console.log(solve(119924));
console.log(solve(486212));

