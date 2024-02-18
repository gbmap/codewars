function startSmoking(bars, boxes) {
    function smoke(s, c) {
        var _s = Math.floor(s / 5);
        if (_s == 0 && c == 0) {
            return _s;
        }
        return c + smoke(c + (s - _s * 5), _s);
    }
    return smoke(0, (bars * 10 + boxes) * 18);
}
console.log(startSmoking(0, 1));
console.log(startSmoking(0, 1) === 22);
console.log(startSmoking(1, 0));
console.log(startSmoking(1, 0) === 224);
console.log(startSmoking(1, 1));
console.log(startSmoking(1, 1) === 247);
