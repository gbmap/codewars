function sumArray(array) {
    if (array === null) {
        return 0;
    }
    return array.sort((a, b) => a - b).slice(1, -1).reduce((agg, x) => agg + x, 0);
}
console.log(sumArray([0, 2, 3, 4, 5, 10]));
console.log(sumArray([]));
console.log(sumArray(null));
