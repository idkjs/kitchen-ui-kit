@react.component
let defaultBalanceCard = (
    ~title,
    ~currency,
    ~balance,
    ~description
) => {
    Js.log("creating")
    <BalanceCard
        title
        currency
        balance
        description
    />
}