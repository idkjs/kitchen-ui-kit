@bs.module external tailwind: unit = "tailwindcss/tailwind.css"; tailwind;

type kind = 
| Primary 
| Secondary

@react.component
let make = (~kind: kind) => (
    <div className="bg-purple-600">
        {React.string("Test")}
    </div>
)