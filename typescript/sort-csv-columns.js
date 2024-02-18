function sortCsvColumns(csvFileContent) {
    let cells = csvFileContent.split('\n').map(l => l.split(";"));
    // get indexes that would order columns
    let columns = cells[0];
    let indexes = Array.from(cells[0], (_, i) => i);
    indexes.sort((a, b) => -columns[b].localeCompare(columns[a]));
    return cells.map(row => indexes.map(indexCol => row[indexCol]).join(";")).join("\n");
}
var csv = sortCsvColumns("defg;abc;hi\nabc;gfeh;hi");
console.log(csv);
