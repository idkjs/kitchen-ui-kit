@react.component
let make = (
    ~pkh,
    ~balance
) => {
    // convert from the integer provided by the story control
    let balance = BigNumber.make(balance)
    <>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <AccountButton
            pkh
            balance
        />
    </>
}