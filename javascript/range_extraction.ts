
function solution(list: Array<number>): string {
    let n: number = list[0];
    let str: string = n.toString();
    for (let i = 1; i < list.length; i++) {
        if (list[i]-n === 1) {
            if (i+1 == list.length ) str = str.concat(`-${list[i]}`);
            else if (list[i+1] - list[i] > 1) {
                if (n-list[i-2] === 1) {
                str = str.concat(`-${list[i]}`);
                }
                else {
                str = str.concat(`,${list[i]}`);
                }
            }
        }
        else { str = str.concat(`,${list[i]}`); }
        n = list[i];
    }
    return str;
}


console.log(solution([0,1,2,3]));
console.log(solution([0,1,2,3,5]));
console.log(solution([-10,-9,-8,17,18,19,20]));
console.log(solution([-6, -3, -2, -1, 0, 1, 3, 4, 5, 7, 8, 9, 10, 11, 14, 15, 17, 18, 19, 20]));