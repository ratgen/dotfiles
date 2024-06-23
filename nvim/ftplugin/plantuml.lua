-- Function to save PlantUML diagram as SVG
--

function Save_plantuml_as_svg()
    local current_file = vim.fn.expand('%:p')
    local svg_file = current_file:gsub('%.puml$', '.svg')
    if svg_file ~= current_file then
        vim.cmd('PlantumlSave ' .. svg_file)
    else
        print("The current file is not a .puml file.")
    end
end


function Save_plantuml_as_pdf()
    local current_file = vim.fn.expand('%:p')
    local pdf_file = current_file:gsub('%.puml$', '.pdf')
    if pdf_file ~= current_file then
        vim.cmd('PlantumlSave ' .. pdf_file)
    else
        print("The current file is not a .puml file.")
    end
end

-- Create the mapping for saving PlantUML diagrams as SVGs
vim.api.nvim_set_keymap('n', '<leader>ls', ':lua Save_plantuml_as_svg()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lp', ':lua Save_plantuml_as_pdf()<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>ll', ':PlantumlOpen<CR>', { noremap = true, silent = true })
