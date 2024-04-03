-- Keep cursor at the bracket 
-- gS = split to multiple lines
-- gJ split to single line

vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
vim.g.splitjoin_trailing_comma = 1
vim.g.splitjoin_php_method_chain_full = 1
vim.keymap.set('n', '<F3>', ':SplitjoinSplit<CR>')
vim.keymap.set('n', '<F4>', ':SplitjoinJoin<CR>')
