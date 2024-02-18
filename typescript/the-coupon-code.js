function checkCoupon(enteredCode, correctCode, currentDate, expirationDate) {
    return enteredCode === correctCode && new Date(currentDate) <= new Date(expirationDate);
}
console.log(checkCoupon("abc1234", "abc1234", "2024-01-01", "2024-01-02"));
console.log(checkCoupon("abc1234", "abc1234", "2024-01-02", "2024-01-01"));
console.log(checkCoupon("abc1235", "abc1234", "2024-01-01", "2024-01-02"));
