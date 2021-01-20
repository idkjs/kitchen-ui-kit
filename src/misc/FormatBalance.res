type formatBalance = (int) => string
let make: formatBalance = %raw(`
    function(balance) {
        const numeral = require('numeral');
        
        let tez = Math.floor((balance / 1000000))
        tez = numeral(tez).format('0,0')
        
        let mutez = balance % 1000000
        if (mutez > 0) {
            mutez = "." + numeral(mutez).format('000000')
        } else {
            mutez = ""
        }

        return tez + mutez;
    }
`)