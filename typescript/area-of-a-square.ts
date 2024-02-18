export const squareArea = (num : number) : number =>  {
    // num is quarter of circumference, circumference = 2*pi*r
    // therefore num = circumference/4 = (1/2)*pi*r => r = num/(1/2*pi)
    // y = r**2
    return (num/(0.5*Math.PI))**2;
}

console.log(squareArea(1.0));
console.log(squareArea(1.5));
console.log(squareArea(2.5));