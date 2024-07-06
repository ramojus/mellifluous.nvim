local M = {}

function M.set(hl, colors)
    hl.set("@neorg.headings.1.title", { link = "@markup.heading.1" })
    hl.set("@neorg.headings.2.title", { link = "@markup.heading.2" })
    hl.set("@neorg.headings.3.title", { link = "@markup.heading.3" })
    hl.set("@neorg.headings.4.title", { link = "@markup.heading.4" })
    hl.set("@neorg.headings.5.title", { link = "@markup.heading.5" })
    hl.set("@neorg.headings.6.title", { link = "@markup.heading.6" })
    hl.set("@neorg.headings.1.prefix", { link = "@markup.heading.1.marker" })
    hl.set("@neorg.headings.2.prefix", { link = "@markup.heading.2.marker" })
    hl.set("@neorg.headings.3.prefix", { link = "@markup.heading.3.marker" })
    hl.set("@neorg.headings.4.prefix", { link = "@markup.heading.4.marker" })
    hl.set("@neorg.headings.5.prefix", { link = "@markup.heading.5.marker" })
    hl.set("@neorg.headings.6.prefix", { link = "@markup.heading.6.marker" })

    hl.set(
        "@neorg.links.location.heading.1",
        { fg = hl.get("@neorg.headings.1.title").fg, style = hl.get("@neorg.headings.1.title").style }
    )
    hl.set(
        "@neorg.links.location.heading.2",
        { fg = hl.get("@neorg.headings.2.title").fg, style = hl.get("@neorg.headings.2.title").style }
    )
    hl.set(
        "@neorg.links.location.heading.3",
        { fg = hl.get("@neorg.headings.3.title").fg, style = hl.get("@neorg.headings.3.title").style }
    )
    hl.set(
        "@neorg.links.location.heading.4",
        { fg = hl.get("@neorg.headings.4.title").fg, style = hl.get("@neorg.headings.4.title").style }
    )
    hl.set(
        "@neorg.links.location.heading.5",
        { fg = hl.get("@neorg.headings.5.title").fg, style = hl.get("@neorg.headings.5.title").style }
    )
    hl.set(
        "@neorg.links.location.heading.6",
        { fg = hl.get("@neorg.headings.6.title").fg, style = hl.get("@neorg.headings.6.title").style }
    )

    hl.set("@neorg.todo_items.undone", { link = "@markup.list.unchecked" })
    hl.set("@neorg.todo_items.done", { link = "@markup.list.checked" })
    hl.set("@neorg.todo_items.on_hold", { link = "Constant" })
    hl.set("@neorg.todo_items.uncertain", { link = "Constant" })
    hl.set("@neorg.todo_items.pending", { link = "@comment.info" })
    hl.set("@neorg.lists.unordered.prefix", { link = "@markup.list" })
    hl.set("@neorg.lists.ordered.prefix", { link = "@markup.list" })

    hl.set("@neorg.markup.verbatim", { link = "@markup.raw" })
    hl.set("@neorg.tags.ranged_verbatim.code_block", { bg = colors.dark_bg })
    hl.set("@neorg.links", { link = "@markup.url" })
    hl.set("@neorg.links.file", { link = "@markup.link.url" })
    hl.set("@neorg.links.description", { link = "@markup.link" })

    hl.set("@neorg.delimiters.horizontal_line", { link = "NonText" })
end

return M
