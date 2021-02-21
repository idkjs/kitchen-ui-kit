open BigNumber

let mutezMultiplier = 1000000.
/**
 * Balance in Taquito are in the mutez format,
 * but our formatting function expects a float instead
 */
let toTez: BigNumber.t => BigNumber.t = bigNumber => {
    bigNumber->dividedBy(mutezMultiplier)
}

let format: BigNumber.t => string = bigNumber => {
    let numeralFormat = "0,0.[000000]"
    let number = bigNumber
        -> toNumber

    NumeralJs.make(number)
        -> NumeralJs.format(numeralFormat)
}