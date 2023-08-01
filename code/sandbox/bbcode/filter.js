const fs = require('fs')

let textFile = fs.readFileSync('FaceClaim_Test.txt', 'utf8').toString();


// get user tags
var charTagPattern = /(?<=\[b\])(.*?)(?=\[\/b\])/g;
let parsed1 = textFile.match(charTagPattern);
console.log(`[1] char tags: { ${parsed1.length} }\n`);

var charTagPattern2 = /@\w+/g;
let parsed1_1 = parsed1.filter(function (c) {
    return charTagPattern2.test(c);
});
console.log(`[2] char tags: { ${parsed1_1.length} }\n`);

parsed1.slice(0,10).forEach(p => console.log(p));
console.log("\n");
parsed1_1.slice(0,10).forEach(p => console.log(p));

// get  URLs
var urlClaimPattern = /(?<=src=)(.*?)(png|jpg)"/g;
let parsed2 = textFile.match(urlClaimPattern);
// console.log(parsed2);
console.log("\n")
// parsed2.slice(0,10).forEach(p => console.log(p));

// get fc names
var fcNamePattern = /(?<=]\n.*?)(.*?)(?=\n.*?\[)/g;
let parsed3 = textFile.match(fcNamePattern);
// console.log(parsed3);
console.log("\n")
// parsed3.slice(0,10).forEach(p => console.log(p));
