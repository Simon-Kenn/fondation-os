const hyprland = await Service.import("hyprland")

export  default () => {
	const activeId = hyprland.active.workspace.bind("id")
	const workspaces = hyprland.bind("workspaces")
		.as(ws => ws.map(({ id }) => Widget.Button({
			on_clicked: () => hyprland.messageAsync(`dispatch workspaces ${id}`),
			child: Widget.Label(`${id}`)
		})))
}
