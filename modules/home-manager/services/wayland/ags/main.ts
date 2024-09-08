//import Bar from "./windows/bar/main"

const scss = App.configDir + "/style.scss"
const css = App.configDir + `/style.css`

Utils.exec(`sass ${scss} ${css}`)

App.config({
	style: css,
	windows: [
//		Bar(0)
	]
})
