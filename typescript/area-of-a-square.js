"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.squareArea = void 0;
var squareArea = function (num) {
    // num is quarter of circumference, circumference = 2*pi*r
    // therefore num = circumference/4 = (1/2)*pi*r => r = num/(1/2*pi)
    // y = r**2
    return Math.pow((num / (0.5 * Math.PI)), 2);
};
exports.squareArea = squareArea;
console.log((0, exports.squareArea)(1.0));
console.log((0, exports.squareArea)(1.5));
console.log((0, exports.squareArea)(2.5));
