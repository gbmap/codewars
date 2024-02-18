// https://www.codewars.com/kata/5b1cd19fcd206af728000056/train/typescript
function solve(m) {
    function f(x) {
        var n = 1e16;
        return -((n + 1) * Math.pow(x, (n + 1)) - n * Math.pow(x, (n + 2)) - x) / Math.pow((1 - x), 2);
    }
    var guess = 0.5;
    for (var i = 0; i < 999; i++) {
        var y = f(guess);
        if (isNaN(y)) {
            guess /= 2.00;
            i -= 1;
            continue;
        }
        var delta = y - m;
        var approxDx = (f(guess + 1e-16) - y) / 1e-16;
        if (Math.abs(delta) <= 1e-12) {
            return guess;
        }
        // guess -= delta/approxDx;
        guess -= Math.min(1000 / i, Math.max(-1000 / i, delta / approxDx));
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
