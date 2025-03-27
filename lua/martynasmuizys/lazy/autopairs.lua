return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true,
    opts = {
        check_ts = true,  -- Enable treesitter
        ts_config = {
            lua = { 'string' }, -- it will not add a pair on that treesitter node
            javascript = { 'template_string' },
            java = false, -- don't check treesitter on java
        }
    }
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
}
