local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

-- Java Mappings
map('n', '<leader>ji', ':lua require("jdtls").organize_imports()<CR>', opts)
map('n', '<leader>jv', ':lua require("jdtls").extract_variable(true)<CR>', opts)
map('n', '<leader>jc', ':lua require("jdtls").extract_constant(true)<CR>', opts)
map('n', '<leader>jm', ':lua require("jdtls").extract_method(true)<CR>', opts)

function get_test_runner(test_name, debug)
    if debug then
        return './gradlew test --debug-jvm -Dtest="' .. test_name .. '"'
    end
    return './gradlew test -Dtest="' .. test_name .. '"'
end

function run_java_test_method(debug)
    local utils = require 'treesitter-config.ts-utils'
    local method_name = utils.get_current_full_method_name("\\#")

    vim.cmd('term ' .. get_test_runner(method_name, debug))
end

function run_java_test_class(debug)
    local utils = require'treesitter-config.ts-utils'
    local class_name = utils.get_current_full_class_name()

    vim.cmd('term ' .. get_test_runner(class_name, debug))
end

function get_debug_param(debug)
    local debug_param = ""

    if debug then
        debug_param = ' -Dspring-boot.run.jvmArguments="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=5005"'
    end

    return debug_param
end

function get_profile_param(profile)
    local profile_param = ""

    if profile then
        profile_param = " -Dspring-boot.run.profiles=" ..profile .. " "
    end

    return profile_param
end

function get_spring_boot_runner(profile, debug)
    local debug_param = get_debug_param(debug)
    local profile_param = get_profile_param(profile)

    return './gradlew bootRun ' .. profile_param .. debug_param
end

function run_spring_boot(debug)
    vim.cmd('term ' .. get_spring_boot_runner(method_name, debug))
end

function get_spring_boot_maven_runner(profile, debug)
    local debug_param = get_debug_param(debug)
    local profile_param = get_profile_param(profile)

    return './mvnw spring-boot:run ' .. profile_param .. debug_param
end

function run_spring_boot_maven(debug)
    vim.cmd('term ' .. get_spring_boot_maven_runner(method_name, debug))
end

vim.keymap.set('n', '<leader>tm', function() run_java_test_method() end)
vim.keymap.set('n', '<leader>TM', function() run_java_test_method(true) end)
vim.keymap.set('n', '<leader>tc', function() run_java_test_class() end)
vim.keymap.set('n', '<leader>TC', function() run_java_test_class(true) end)
vim.keymap.set('n', '<leader>8', function() run_spring_boot_maven() end)
vim.keymap.set('n', '<leader>9', function() run_spring_boot() end)
vim.keymap.set('n', '<leader>0', function() run_spring_boot(true) end)

-- Debug methods
map('n', '<leader>b', ':lua require"dap".toggle_breakpoint()<CR>', opts)
map('n', '<leader>B', ':lua require"dap".set_breakpoint(vim.fn.input("Condition: "))<CR>', opts)
map('n', '<leader>bl', ':lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log: "))<CR>', opts)
map('n', '<leader>dr', ':lua require"dap".repl.open()<CR>', opts)

-- Information for the Debug Mode
function show_dap_centered_scopes()
    local widgets = require'dap.ui.widgets'
    widgets.centered_float(widgets.scopes)
end
map('n', 'gs', ':lua show_dap_centered_scopes()<CR>', opts)

-- Move in the Debug Mode
map('n', '<F5>', ':lua require"dap".continue()<CR>', opts)
map('n', '<F8>', ':lua require"dap".step_over()<CR>', opts)
map('n', '<F7>', ':lua require"dap".step_into()<CR>', opts)
map('n', '<F6>', ':lua require"dap".step_out()<CR>', opts)

function attach_to_debug()
    local dap = require('dap')
    dap.configurations.java = {
        {
            type = 'java';
            request = 'attach';
            name = 'Attach to the process';
            hostName = 'localhost';
            port = '5005';
        },
    }
    dap.continue()
end

map('n', '<leader>da', ':lua attach_to_debug()<CR>', opts)

