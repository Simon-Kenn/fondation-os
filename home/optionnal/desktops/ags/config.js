function Bar(monitor = 0) {
	const myLabel =  Wigdet.Label({
		label: 'some exemple content',
	})

	return Widget.Window({
		monitor,
		name: `bar${monitor}`,
		anchor: ['top', 'left', 'right'],
		child: myLabel,
	})
}

App.config({ 
	windows: [
		Bar(0),
		Bar(1),
	],
})
