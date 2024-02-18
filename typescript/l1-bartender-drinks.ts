function getDrinkByProfession(profession:string): string {
    const dict: { [key: string]: string } = {
        "jabroni": "Patron Tequila",
        "school counselor": "Anything with Alcohol",
        "programmer": "Hipster Craft Beer",
        "bike gang member": "Moonshine",
        "politician": "Your tax dollars",
        "rapper": "Cristal",
    };
    return dict[profession.toLowerCase()] || "Beer";
}

console.log(getDrinkByProfession("Jabroni"));
console.log(getDrinkByProfession("JaBrONi"));
console.log(getDrinkByProfession("biKe Gang MeMber"));
console.log(getDrinkByProfession("what"));