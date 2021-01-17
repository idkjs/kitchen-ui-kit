
export const parameters = {
  actions: { argTypesRegex: "^on[A-Z].*" },
  backgrounds: {
    default: 'white',
    values: [
      {
        name: 'white',
        value: '#FFFFFF',
      },
      {
        name: 'light',
        value: '#F2F2F2'
      },
      {
        name: 'dark',
        value: '#171F2D'
      }
    ]
  }
}