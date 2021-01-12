type kind = 
| Primary 
| Secondary

@react.component
let make = (~kind: kind) => (
    <>
        <h1>{React.string("Test")}</h1>
        {switch kind {
            | Primary => <p>{React.string("Primary")}</p>
            | Secondary => <p>{React.string("Secondary!")}</p>
        }}
    </>
)