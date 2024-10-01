# Contributing to mellifluous

Thanks for taking the time to contribute!

Please feel free to ask for suggestions or help.

## General guidelines
- Code should be formatted using [stylua](https://github.com/johnnymorganz/stylua).
- For commit messages, it is recommended to use rules from [conventionalcommits.org](https://www.conventionalcommits.org/). I have a couple of non-standard commit types that I use for this project:
    - `color`: for when a color is changed in a subjective manner.
    - `highlight`: for when a highlight group is changed in a subjective manner.
- There is no need to manually update vimdoc when README is modified. Vimdoc will be updated automatically using [panvimdoc](https://github.com/kdheepak/panvimdoc).

## Plugin contributions
If you find a plugin that could match the rules better, your suggestions are very welcome.

### Terminology
- **Element**: Anything that has or could have a highlight group, e.g. important word, button or title.
- **Styled plugin**: A plugin that, from the contributor's perspective looks as good as possible in all use cases and the design follows rules 2, 3 and 4 (at least for elements that have highlight groups).
- **UI colors**: Colors that have a `ui_` prefix in their name. They are like normal colors for syntax elements, but they all have the same brightness.

### Rules
1. Don't submit pull requests for partially styled plugins. Only submit a pull request when in your opinion, the plugin is fully styled. If you have a partial styling for a plugin, feel free to open an issue requesting full styling, or a discussion. In these places only can a partial styling for a plugin be suggested.
2. Avoid clutter. Always try to find a styling that looks the most minimal. Avoid borders and bold text whenever possible, and instead explore alternative ways to highlight elements, such as using a different background. In some cases, there may be no practical reason for an element to stand out. While some plugins might by default prioritize certain elements over others, always question whether that is truly necessary. Similarly, always try to minimise the use of different colors.
3. Use UI colors for UI elements. Some examples of UI elements: tab names, diagnostic messages, indentation markers, floating windows (their titles and backgrounds).
4. Use a lighter background for UI elements of higher importance. The only exception is selected elements (e.g. `Visual` or a selected button) on light theme – these should typically have a darker background for better visibility.
5. Use highlight groups that are already defined by the colorscheme (link to them, or use the `get` function of highlighter) whenever possible. This includes [general highlight groups](./lua/mellifluous/highlights/general.lua), [telescope highlight groups](./lua/mellifluous/highlights/plugins/telescope.lua), and [custom highlight groups](./lua/mellifluous/highlights/custom_groups.lua). If you find an excuse to create a new custom highlight group that could later be used for another plugin, please do so.

### Examples

#### [Lazy](./lua/mellifluous/highlights/plugins/lazy.lua)
![lazy-dark](https://github.com/user-attachments/assets/412f3c35-ca70-4188-bf56-8dd6287d09c8)
![lazy-light](https://github.com/user-attachments/assets/5ac76ee9-7382-42cc-a6fc-1d457fa31318)

For this plugin, the menu bar at the top has been highly simplified with [custom highlight groups](./lua/mellifluous/highlights/custom_groups.lua) (`MenuButton` and `MenuButtonSelected`). To better follow rule 2, the following decisions were made:
- Selecting the home button ("lazy.nvim") does not make it standout as much as the original highlight groups would (which would make it brighter than the other buttons when selected).
- Deselected buttons do not have any background. Instead, they all have a foreground with `ui_blue` color. I try to use blue color whenever I want to indicate an action (it is also the color of function name in the default colorset and most of the others).

There is one issue with this plugin – the diagnostics have a darker background than the window of the plugin (breaks rule 4). I left it this way, because there is currently no way to fix it – Lazy does not provide a highlight group for its diagnostics.
